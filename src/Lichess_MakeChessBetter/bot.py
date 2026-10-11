import os
import sys
import asyncio
import json
import logging
import httpx

# Track down folder environments safely
src_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(src_dir)
config_folder_path = os.path.join(project_root, "config")
if config_folder_path not in sys.path:
    sys.path.insert(0, config_folder_path)

from bot_config import Config

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
log = logging.getLogger(__name__)

BASE_URL = "https://lichess.org"


class LichessBot:
    def __init__(self, engine=None):
        self.token = Config.LICHESS_TOKEN
        self.headers = {"Authorization": f"Bearer {self.token}"}
        self.active_games: dict[str, asyncio.Task] = {}
        self.engine = engine  

    async def start(self):
        async with httpx.AsyncClient(base_url=BASE_URL, headers=self.headers, timeout=30) as client:
            response = await client.get("/api/account")
            if response.status_code == 401:
                log.critical("CRITICAL: Lichess API Token rejected! Verify token configuration parameters.")
                return

            profile = response.json()
            if "username" not in profile:
                log.critical(f"CRITICAL: Failed to parse user profile: {profile}")
                return

            log.info(f"Logged in as: {profile['username']}")
            if profile.get("title") != "BOT":
                log.info("Upgrading to BOT account...")
                await client.post("/api/bot/account/upgrade")

        log.info("MakeChessBetter is ONLINE")
        await self._stream_events()

    async def _stream_events(self):
        log.info("Listening for events...")
        backoff = 1
        while True:
            try:
                async with httpx.AsyncClient(base_url=BASE_URL, headers=self.headers, timeout=None) as client:
                    async with client.stream("GET", "/api/stream/event") as resp:
                        resp.raise_for_status()
                        backoff = 1
                        async for line in resp.aiter_lines():
                            if line.strip():
                                try:
                                    await self._handle_event(json.loads(line))
                                except Exception as e:
                                    log.error(f"Event error: {e}")
            except Exception as e:
                log.error(f"Stream dropped: {e} - retry in {backoff}s")
                await asyncio.sleep(backoff)
                backoff = min(backoff * 2, 60)

    async def _handle_event(self, event: dict):
        etype = event.get("type")

        if etype == "challenge":
            await self._handle_challenge(event["challenge"])

        elif etype == "gameStart":
            gid = event["game"]["id"]
            if gid not in self.active_games:
                log.info(f"Game starting: {gid}")
                task = asyncio.create_task(self._run_game(gid))
                self.active_games[gid] = task

        elif etype == "gameFinish":
            gid = event["game"]["id"]
            task = self.active_games.pop(gid, None)
            if task:
                task.cancel()
            log.info(f"Game finished: {gid} | Active: {len(self.active_games)}")

    async def _handle_challenge(self, challenge: dict):
        cid        = challenge["id"]
        challenger = challenge["challenger"]["name"]
        variant    = challenge.get("variant", {}).get("key", "standard")
        speed      = challenge.get("speed", "blitz")
        rated      = challenge.get("rated", False)

        log.info(f"Challenge: {challenger} | {variant} | {speed} | rated={rated}")

        if variant not in Config.ACCEPT_VARIANTS:
            await self._decline(cid, "variant"); return
        if speed not in Config.ACCEPT_TIME_CONTROLS:
            await self._decline(cid, "tooSlow"); return
        if Config.DECLINE_RATED and rated:
            await self._decline(cid, "casual"); return

        async with httpx.AsyncClient(base_url=BASE_URL, headers=self.headers) as c:
            await c.post(f"/api/challenge/{cid}/accept")
        log.info(f"Accepted: {challenger}")

    async def _decline(self, cid: str, reason: str = "generic"):
        async with httpx.AsyncClient(base_url=BASE_URL, headers=self.headers) as c:
            await c.post(f"/api/challenge/{cid}/decline", data={"reason": reason})

    async def _run_game(self, game_id: str):
        try:
            from game_handler import GameHandler
            await GameHandler(game_id, self.token, self.engine).run()
        except asyncio.CancelledError:
            pass
        except Exception as e:
            log.error(f"Game {game_id} error: {e}", exc_info=True)


async def main():
    log.info("Initializing Chess Bot Wrapper...")
    bot = LichessBot()
    await bot.start()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        log.info("Shutting down bot process cleanly...")
    except Exception as e:
        log.critical(f"Unhandled loop crash: {e}", exc_info=True)
    finally:
        input("\nProcess finished. Press Enter to exit terminal...")
