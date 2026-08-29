import os
import urllib.request
import logging
import chess
import chess.variant

log = logging.getLogger(__name__)

# List of variants the bot is strictly NOT willing to play
UNWANTED_VARIANTS = {
    "standard",       # Already covered elsewhere
    "chess960",       # Already covered elsewhere
    "fromPosition"    # Already covered elsewhere
}

# FIXED Single Source of Truth Configuration Map
# Maps lowercase Lichess API strings to correct Fairy-Stockfish tags AND native python-chess Board classes
VARIANT_CONFIGS = {
    "kingofthehill": {
        "uci": "kingofthehill", 
        "board_class": chess.variant.KingOfTheHillBoard
    },
    "threecheck": {
        "uci": "3check",        
        "board_class": chess.variant.ThreeCheckBoard
    },
    "crazyhouse": {
        "uci": "crazyhouse",    
        "board_class": chess.variant.CrazyhouseBoard
    },
    "antichess": {
        "uci": "antichess",     
        "board_class": chess.variant.AntichessBoard
    },
    "atomic": {
        "uci": "atomic",        
        "board_class": chess.variant.AtomicBoard
    },
    "horde": {
        "uci": "horde",         
        "board_class": chess.variant.HordeBoard
    },
    "racingkings": {
        "uci": "racingkings",   
        "board_class": chess.variant.RacingKingsBoard
    }
}

# Execution path on Render and source link for the specific required binary asset
ENGINE_PATH = "./fairy-stockfish"
ENGINE_URL = "https://github.com/GoogleHub67/Lichess-MakeChessBetter/releases/download/V2.1.0/fairy-stockfish-largeboard_x86-64"

def download_engine_if_missing():
    """Checks for the binary local footprint and downloads it automatically if missing."""
    if os.path.exists(ENGINE_PATH):
        return True

    try:
        log.info(f"📥 Downloading Fairy-Stockfish binary directly onto Render...")
        urllib.request.urlretrieve(ENGINE_URL, ENGINE_PATH)
        os.chmod(ENGINE_PATH, 0o755)
        log.info("✅ Fairy-Stockfish engine downloaded and ready.")
        return True
        
    except Exception as e:
        log.error(f"❌ Failed to download or configure engine binary context: {e}")
        return False

def is_playable_variant(variant_key: str) -> bool:
    """Checks if the incoming challenge format belongs to our variant list."""
    if not variant_key:
        return False
    return str(variant_key).lower() in VARIANT_CONFIGS

def should_decline_variant(variant_key: str) -> bool:
    """Returns True if the format is explicitly blocked or standard."""
    if not variant_key:
        return True
    
    normalized_key = str(variant_key).strip()
    
    # 1. Block standard variations immediately
    if normalized_key in UNWANTED_VARIANTS or normalized_key.lower() in UNWANTED_VARIANTS:
        return True
        
    # 2. Decline if it's an unrecognized variant format completely
    return not is_playable_variant(normalized_key)

def setup_variant_board(engine, variant_key: str):
    """
    Configures Fairy-Stockfish with the proper variant setting 
    and returns the matching python-chess rule-enforcing board framework.
    """
    download_engine_if_missing()

    normalized_key = str(variant_key).lower()
    config = VARIANT_CONFIGS.get(normalized_key)
    
    if not config:
        log.warning(f"Unknown variant key '{variant_key}'. Defaulting to standard rules.")
        return chess.Board()

    uci_variant_name = config["uci"]
    BoardClass = config["board_class"]

    try:
        log.info(f"♞ Configuring Fairy-Stockfish engine for variant: {uci_variant_name}")
        engine.configure({"UCI_Variant": uci_variant_name})
        
        # FIXED: Directly initializes the specific native Python variant rule engine board
        log.info(f"🧩 Successfully loaded rule engine wrapper for: {BoardClass.__name__}")
        return BoardClass()
        
    except Exception as e:
        log.error(f"❌ Fairy-Stockfish variant initialization crash sequence: {e}")
        # Secure fallback to the true native variant board context wrapper even if configuration drops
        return BoardClass()
