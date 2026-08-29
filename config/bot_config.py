import os
from dotenv import load_dotenv

# Automatically load environmental variables from .env if running locally
load_dotenv()

class Config:
    # Stockfish path as configured in your working Dockerfile runtime
    STOCKFISH_PATH: str = "/usr/games/stockfish"
    
    # Pulls your secure token from Render's Environment dashboard
    LICHESS_TOKEN: str = os.environ.get("LICHESS_TOKEN", "")
    
    # 🟢 FIX: Secure, platform-agnostic absolute path resolution for the opening book
    # Steps out of the 'config' folder into the root directory to find 'assets'
    _current_dir = os.path.dirname(os.path.abspath(__file__))
    _project_root = os.path.dirname(_current_dir)
    BOOK_PATH: str = os.path.abspath(os.path.join(_project_root, "assets", "books", "gm2001.bin"))

    CPL_MIN_SAMPLES: int = 3
    DEFAULT_ELO: int = 1320

    # Mapped as: (Max Average Centipawn Loss, Approximate Elo Rating)
    # Lower ACPL = Higher, elite-level Elo. Higher ACPL = Beginner Elo.
    
    CPL_ELO_MAP: list[tuple[int, int]] = [
        (10, 2900),  # World Champion / Top Engine level
        (15, 2800),  # Grandmaster / Elite Bot level
        (20, 2700),  # International Master level
        (30, 2500),  # Expert / Candidate Master level
        (40, 2300),  # Class A / Advanced club player
        (50, 2100),  # Intermediate club player
        (65, 1900),  # Steady hobbyist player
        (80, 1700),  # Developing casual player
        (95, 1500),  # Casual player (frequent +1.00 eval bar drops)
        (120, 1320),  # Advanced beginner
        (150, 1320),  # Beginner (frequent +1.50 to +2.00 blunders)
    ]


    ACCEPT_VARIANTS: list[str] = ["standard", "chess960", "fromPosition", "antichess", "horde", "threeCheck", "kingOfTheHill", "crazyhouse", "atomic"]
    ACCEPT_TIME_CONTROLS: list[str] = ["rapid", "classical", "correspondence", "unlimited"]
    DECLINE_RATED: bool = False

    CHAT_GREET: str = "Hi! I'll adapt to your level. Good luck!"
    CHAT_OFF_BOOK: str = "You're out of book! Adapting to your level now."
    CHAT_GG: str = "Good game! Review your moves - that's how you improve."
    CHAT_BLUNDER_DETECTED: str = "Ooof. Big blunder there!"
