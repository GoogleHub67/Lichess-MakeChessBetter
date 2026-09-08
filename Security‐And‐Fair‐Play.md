# 🛡️ Security Parameters & Fair Play Compliance

Operating an automated system on a public platform requires rigid enforcement of system limits to protect server resources and uphold platform gameplay integrity.

## 🤝 Lichess Bot API Rules Compliance
This framework is built strictly in accordance with the official **Lichess Bot API Agreement**:
* **No Human Intervention:** The engine acts entirely autonomously once initialized. Mid-game human manual overrides are hard-blocked by design inside the code layers.
* **Bot Designation:** The repository setup scripts require the user account to be permanently flagged with a `BOT` status badge. Running this code on a standard player account will result in immediate platform moderation actions.

## 🔒 Local API Token Preservation
Your secret Lichess API token (`lip_***`) represents complete administrative command over your bot profile. 
* **Zero Disk Spillage:** The application reads tokens straight out of runtime environment spaces via `os.getenv("LICHESS_TOKEN")`. 
* **Safe Submissions:** The root configuration contains a `.gitignore` layout that blocks your custom `.env` or `config.yml` files from accidental commits back into your public repository history.

## 🛑 Input Sanitization & Exploit Prevention
To prevent malicious players from crashing your backend server via in-game text vectors:
1. **Chat Injection Blocking:** All incoming game chat packets processed by `game_handler.py` are stripped of control sequences and limited to a max length of 140 characters before being evaluated.
2. **Malformed FEN Filtering:** The engine validates incoming board coordinates using `python-chess` internal structural tests before shipping move selections over to local binary subprocess execution blocks.
