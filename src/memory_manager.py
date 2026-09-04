import gc
import ctypes
import os
import sys

# Global tracking variables for consecutive game counts
GAMES_PLAYED = 0
MAX_CONSECUTIVE_GAMES = 100
CLEANUP_INTERVAL = 25  # Runs RAM cleanup every 25 games

def force_garbage_collection():
    """Forces Python and the C-level memory allocator to dump all cached RAM immediately."""
    print("Executing strict RAM cleanup routine...")
    gc.collect()
    try:
        # Forces malloc to release unused memory chunks back to the Render Host OS
        ctypes.CDLL('libc.so.6').malloc_trim(0)
    except Exception:
        pass

def track_game_and_safeguard():
    """Tracks consecutive matches and forces a container reset before hitting 512MB RAM."""
    global GAMES_PLAYED
    GAMES_PLAYED += 1
    
    print(f"Match completed. Consecutive games since last start: {GAMES_PLAYED}/{MAX_CONSECUTIVE_GAMES}")

    # Run the flush only every 25 games
    if GAMES_PLAYED % CLEANUP_INTERVAL == 0:
        print(f"Reached {GAMES_PLAYED} games.")
        force_garbage_collection()

    # Run safety reset routine
    if GAMES_PLAYED >= MAX_CONSECUTIVE_GAMES:
        print("Approaching Render Free Tier memory threshold. Initiating clean container cycle...")
        # Gracefully exit with 0. Render automatically spawns a fresh, clean container in 5 seconds.
        sys.exit(0)
