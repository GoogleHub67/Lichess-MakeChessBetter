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
    "fromposition"    
}

# Single Source of Truth Configuration Map
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

ENGINE_PATH = "./fairy-stockfish"
ENGINE_URL = "https://github.com/GoogleHub67/Lichess-MakeChessBetter/releases/download/V2.1.0/fairy-stockfish-largeboard_x86-64"

# Global state tracker to keep the monkeypatch informed
_CURRENT_ACTIVE_VARIANT = "standard"

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
    return str(variant_key).lower().strip() in VARIANT_CONFIGS

def should_decline_variant(variant_key: str) -> bool:
    """Returns True if the format is explicitly blocked or standard."""
    if not variant_key:
        return True
    normalized_key = str(variant_key).lower().strip()
    
    # Track the variant globally when Lichess filters incoming challenges
    global _CURRENT_ACTIVE_VARIANT
    if is_playable_variant(normalized_key):
        _CURRENT_ACTIVE_VARIANT = normalized_key
    elif normalized_key in UNWANTED_VARIANTS:
        _CURRENT_ACTIVE_VARIANT = "standard"
        return True

    return not is_playable_variant(normalized_key)

def setup_variant_board(engine, variant_key: str):
    """Configures Fairy-Stockfish with the proper variant setting."""
    download_engine_if_missing()

    global _CURRENT_ACTIVE_VARIANT
    normalized_key = str(variant_key).lower().strip()
    _CURRENT_ACTIVE_VARIANT = normalized_key

    config = VARIANT_CONFIGS.get(normalized_key)
    if not config:
        log.warning(f"Unknown variant key '{variant_key}'. Defaulting to standard rules.")
        return chess.Board()

    uci_variant_name = config["uci"]
    BoardClass = config["board_class"]

    try:
        log.info(f"♞ Configuring Fairy-Stockfish engine for variant: {uci_variant_name}")
        engine.configure({"UCI_Variant": uci_variant_name})
        return BoardClass()
    except Exception as e:
        log.error(f"❌ Fairy-Stockfish variant initialization crash sequence: {e}")
        return BoardClass()

# --- MONKEYPATCH INJECTION ---
# This intercepts `chess.Board()` calls made by other files and forces the correct ruleset
_original_board_init = chess.Board.__init__

def _patched_board_init(self, fen=chess.STARTING_FEN, chess960=False):
    global _CURRENT_ACTIVE_VARIANT
    config = VARIANT_CONFIGS.get(_CURRENT_ACTIVE_VARIANT)
    
    if config and not isinstance(self, config["board_class"]):
        # Morph this object instance into the variant class dynamically
        self.__class__ = config["board_class"]
    
    _original_board_init(self, fen=fen, chess960=chess960)

# Apply patch to the library global scope
chess.Board.__init__ = _patched_board_init
