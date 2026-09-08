# 🤖 Lichess-MakeChessBetter FAQs

### Qn 1. What is Lichess-MakeChessBetter?
**Ans 1.** It is an open-source, fully automated chess engine built with Python and Stockfish that connects natively to the lichess.org Bot API.

### Qn 2. How does the bot adjust its playing strength?
**Ans 2.** The bot functions as an Adaptive Chess Partner, calculating your performance per move using real-time Centipawn Loss (CPL) analysis rather than your profile rating.

### Qn 3. What are the specific ELO difficulty tiers used by the bot?
**Ans 3.** It maps rolling CPL averages into seven categories: CPL ≤ 15 (ELO 2200), CPL ≤ 25 (ELO 2000), CPL ≤ 40 (ELO 1800), CPL ≤ 60 (ELO 1600), CPL ≤ 90 (ELO 1400), CPL ≤ 130 (ELO 1200), and CPL > 130 (ELO 1000).

### An 4. Does the bot support alternative chess variants?
**Ans 4.** Yes, it features full execution compatibility with variants supported by Fairy-Stockfish.

### Qn 5. How does the bot handle draw offers?
**Ans 5.** It implements a Smart Draw Strategy, rejecting draws when holding an advantage and accepting them under heavy positional strain.

### Qn 6. Will the bot play out a completely lost game?
**Ans 6.** No, it uses Predictive Resignations to resign instantly when facing unpreventable forced checkmates in 3 moves or fewer.

### Qn 7. Can the bot handle multiple games simultaneously?
**Ans 7.** Yes, it utilizes an asynchronous backend setup capable of scaling for concurrent platform matches.

### Qn 8. What are the system requirements to host the bot?
**Ans 8.** You need Python 3.10+, local paths for Stockfish/Fairy-Stockfish binaries, and a dedicated Lichess profile with upgraded `BOT` status.

### Qn 9. How do I install the bot package?
**Ans 9.** Install via the pre-compiled wheel (`pip install MakeChessBetter-2.0.1-py3-none-any.whl`) or extract the source tarball and run `pip install -r requirements.txt`.

### Qn 10. How do I configure my Lichess API credentials?
**Ans 10.** Create a `config.yml` file with your token and binary paths, or use a root `.env` template parameter configuration (`LICHESS_TOKEN=lip_yourtoken`).

### Qn 11. How can I keep the bot running silently in the background?
**Ans 11.** Use `pythonw bot.py` on Windows, or `nohup python bot.py &` on Linux/macOS.

### Qn 12. Why does the application window instantly flash and exit when I double-click it?
**Ans 12.** Avoid clicking raw scripts directly from the file explorer; launch them manually from an open terminal to capture error flags.

### Qn 13. What should I do if I get a "401 Authentication Validation Error"?
**Ans 13.** Confirm that your Lichess Personal Access Token includes the authorized `bot:play` permission configuration.

### Qn 14. How can I optimize the engine for faster, low-latency calculations?
**Ans 14.** Align calculation properties with your physical CPU core limits and raise local hash allocation ceilings in your config variables.

### Qn 15. Is there a visual way to track the bot's match history and statistics?
**Ans 15.** Yes, by executing `dashboard.py` to run the dedicated local web dashboard interface.
