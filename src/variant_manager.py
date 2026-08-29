import os
import urllib.request
import logging
import chess
import chess.variant

log = logging.getLogger(__name__)

# List of variants the bot is strictly NOT willing to play
UNWANTED_VARIANTS = {
    "standard",       
    "chess960",       
    "fromPosition"    
}

# FIXED: Keys mapped to match exact Lichess API payload strings (lowercase)
VARIANT_UCI_MAPPINGS = {
    "kingofthehill": "kingoftheHill",
    "threecheck": "3check",
    "crazyhouse": "crazyhouse",
    "antichess": "antichess",
    "atomic": "atomic",
    "horde": "horde",
    "racingkings": "racingKings"
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
    """Checks if the incoming challenge format belongs to our new variant list."""
    # Convert incoming key to lowercase to ensure safety against format mismatches
    return str(variant_key).lower() in VARIANT_UCI_MAPPINGS

def should_decline_variant(variant_key: str) -> bool:
    """Returns True if the format is standard or explicitly blocked."""
    # Handle both camelCase and lowercase checks cleanly
    k = str(variant_key)
    return k in UNWANTED_VARIANTS or k.lower() in UNWANTED_VARIANTS

def setup_variant_board(engine, variant_key: str):
    """
    Configures Fairy-Stockfish with the proper variant setting 
    and returns the matching python-chess rule-enforcing board framework.
    """
    download_engine_if_missing()

    # Safety normalization to lowercase
    uci_variant_name = VARIANT_UCI_MAPPINGS.get(str(variant_key).lower())
    if not uci_variant_name:
        log.warning(f"Unknown variant key '{variant_key}'. Defaulting to standard rules.")
        return chess.Board()

    try:
        log.info(f"♞ Configuring Fairy-Stockfish engine for variant: {uci_variant_name}")
        engine.configure({"UCI_Variant": uci_variant_name})
        
        variant_board_class = chess.variant.find_variant(uci_variant_name)
        return variant_board_class()
        
    except Exception as e:
        log.error(f"Fairy-Stockfish variant initialization crash sequence: {e}")
        return chess.Board()
