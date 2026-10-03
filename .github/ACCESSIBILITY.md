# Accessibility Statement for Lichess-MakeChessBetter

We are committed to making the **[Lichess-MakeChessBetter](https://github.com/GoogleHub67/Lichess-MakeChessBetter)** bot and its ecosystem accessible to all users, including those with visual, motor, cognitive, or auditory disabilities. As a fully adaptive chess bot built by **Aarav Patel** that interfaces with **Lichess.org**, we strive to ensure our software behaves predictably, transparently, and inclusively.

---

## ♿ Core Accessibility Design

Because `Lichess-MakeChessBetter` operates as a backend service via the **Lichess Bot API**, the primary user interface is provided directly by **Lichess.org**. However, our bot's internal logic, gameplay behaviors, and terminal interfaces are developed with the following accessibility considerations:

### 🎮 Gameplay Accessibility
* **Screen Reader & Keyboard Friendly:** The bot interacts strictly via valid UCI (Universal Chess Interface) protocols and standard API requests. This means players using screen readers, refreshable Braille displays, or keyboard-only navigation on Lichess can seamlessly play against the bot without visual or structural layout hindrances.
* **Predictive Adaptive Difficulty:** By computing live performance based on rolling **Centipawn Loss (CPL)** analysis, the engine automatically lowers or raises its ELO difficulty dynamically. This lowers barriers for casual players or those requiring more processing time, providing an engaging, unstressed environment for all cognitive levels.

### 💻 Developer & Terminal Accessibility
* **Readable Console Diagnostics:** For developers running the script via `python -m src.bot` or `MakeChessBetter`, all console logs are output in high-contrast text strings. We avoid complex ASCII graphics or color-dependent status flags that are unreadable by command-line screen readers.
* **Suppressed Flashing Windows:** Issues like instant terminal exit or flashing pop-ups can trigger sensory sensitivities. We outline explicit troubleshooting methods using persistent terminals or silent execution modes (`pythonw` and `nohup`) to make standard operations more stable.

---

## 🛠️ Conformance Status

We aim to design features that respect the principles of the **Web Content Accessibility Guidelines (WCAG) 2.1 Level AA**, specifically keeping data outputs text-based and programmatically clear:
* **Text Alternatives:** The bot utilizes standard chess notation (`e2e4`, `g1f3`) for move execution, allowing third-party tools to translate actions flawlessly into speech or tactile feedback.
* **Chat Integration:** Automated status alerts emitted to the in-game log panel (`POST /api/bot/game/{gameId}/chat`) are structured as plain text messages, preventing hidden symbols or non-parsed visual items from blocking user understanding.

---

## ⚠️ Known Limitations & Workarounds

While we try to optimize the engine, certain limitations exist outside of our direct application logic:
* **Lichess UI Dependencies:** The visual board layout, contrast settings, piece themes, and sound effects are governed entirely by **Lichess.org**. If you need high-contrast pieces or audio move announcements, please configure the built-in accessibility settings on your Lichess profile.
* **Local Binaries Configuration:** Setting up the paths for **Stockfish** or **Fairy-Stockfish** inside the `config.yml` or `.env` files relies on text editing. Users who experience difficulties navigating raw configuration syntax are encouraged to use automated text-to-speech tools or follow our structured blueprint guidelines in the main documentation.

---

## 📬 Feedback & Support

We welcome your feedback on the accessibility of `Lichess-MakeChessBetter`. If you encounter any barriers, please let us know:
* **Issues:** Open an accessibility report directly on our [GitHub Issues Page](https://github.com/GoogleHub67/Lichess-MakeChessBetter/issues).
* **Contributions:** We gladly accept pull requests aimed at improving code comments, expanding configuration validation logs, or documenting further assistive workflows.
