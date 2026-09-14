import os
import platform
import shutil
import urllib.request
from dotenv import load_dotenv

# Calculate absolute paths across your repository hierarchy
_current_dir = os.path.dirname(os.path.abspath(__file__))
_project_root = os.path.dirname(_current_dir)
_path_to_env = os.path.join(_project_root, ".env")

def _bootstrap_environment():
    """
    Detects the operating system, extracts the matching platform-specific template
    from config/env/, and seeds a standard root-level .env file if missing.
    """
    if os.path.exists(_path_to_env):
        return  # Local file exists; bypass bootstrap to prevent overwriting active tokens

    system_os = platform.system().lower()
    
    # Map running kernel to your explicit repository configuration assets
    if "linux" in system_os:
        template_name = ".linux.env.example"
    elif "darwin" in system_os:  # macOS kernel engine
        template_name = ".macos.env.example"
    elif "windows" in system_os:
        template_name = ".windows.env.example"
    else:
        # Resilient fallback default to prevent system faults on unusual kernels
        template_name = ".linux.env.example"

    source_template_path = os.path.join(_project_root, "config", "env", template_name)

    if os.path.exists(source_template_path):
        try:
            shutil.copyfile(source_template_path, _path_to_env)
            print(f"[BOOTSTRAP] Successfully generated local environmental file (.env) from '{template_name}'.")
            print("[BOOTSTRAP] Remember to insert your secret Lichess Token before executing your application.")
        except Exception as e:
            print(f"[BOOTSTRAP ERROR] Failed to automatically copy system template: {e}")
    else:
        print(f"[BOOTSTRAP ERROR] Critical template configuration asset missing at: {source_template_path}")


# Execute structural setup routine before reading environmental definitions
_bootstrap_environment()

# Safely load configurations into environmental memory mapping
load_dotenv(dotenv_path=_path_to_env)


class Config:
    # ==========================================================================
    # ENVIRONMENT DRIVEN CONFIGURATION
    # ==========================================================================
    STOCKFISH_PATH: str = os.environ.get("STOCKFISH_PATH", "")
    LICHESS_TOKEN: str = os.environ.get("LICHESS_TOKEN", "")
    
    # Platform-agnostic structural tracking paths
    BOOK_PATH: str = os.path.abspath(os.path.join(_project_root, "assets", "books", "gm2001.bin"))

    @classmethod
    def ensure_opening_book_exists(cls):
        """
        Download the heavy binary book file automatically if it doesn't exist locally,
        pulling from the permanent V2.1.0 release sandbox storage.
        """
        if not os.path.exists(cls.BOOK_PATH):
            os.makedirs(os.path.dirname(cls.BOOK_PATH), exist_ok=True)
            print("[ASSETS] Downloading gm2001.bin from permanent release sandbox...")
            
            # Pull directly from your specific V2.1.0 storage link
            remote_url = "https://github.com/GoogleHub67/Lichess-MakeChessBetter/releases/download/V1.0.0/gm2001.bin"
            try:
                urllib.request.urlretrieve(remote_url, cls.BOOK_PATH)
                print("[ASSETS] Opening book downloaded successfully.")
            except Exception as e:
                print(f"[ASSETS ERROR] Failed to download opening book asset: {e}")

    # ==========================================================================
    # BOT GAMEPLAY & RATING CALIBRATION 
    # ==========================================================================
    CPL_MIN_SAMPLES: int = 3
    DEFAULT_ELO: int = 1320

    CPL_ELO_MAP: list[tuple[int, int]] = [
        (10, 2900), (15, 2800), (20, 2700), (30, 2500),
        (40, 2300), (50, 2100), (65, 1900), (80, 1700),
        (95, 1500), (120, 1320), (150, 1320)
    ]

    ACCEPT_VARIANTS: list[str] = ["standard", "chess960", "fromPosition"] 
    ACCEPT_TIME_CONTROLS: list[str] = ["rapid", "classical", "correspondence", "unlimited"]
    DECLINE_RATED: bool = False

    # ==========================================================================
    # LICHESS GAME CHAT LAYOUTS
    # ==========================================================================
    CHAT_GREET: str = "Hi! I'll adapt to your level. Good luck!"
    CHAT_OFF_BOOK: str = "You're out of book! Adapting to your level now."
    CHAT_GG: str = "Good game! Review your moves - that's how you improve."
    CHAT_BLUNDER_DETECTED: str = "Ooof. Big blunder there!"


# Trigger the verification function so it acts automatically on import
Config.ensure_opening_book_exists()
