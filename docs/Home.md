Welcome to the Lichess-MakeChessBetter wiki!

## 🧮 Deep Dive: How Rolling CPL Estimation Works

Instead of looking at just the last move, the bot uses a **rolling average window** of the opponent's last 5 moves. This prevents the bot from dropping its difficulty level drastically if an opponent makes a single accidental blunder.

### The Formula:
$$\text{Rolling CPL} = \frac{\sum_{i=n-4}^{n} \text{CPL}_i}{5}$$

* If a player plays at a Grandmaster level ($\text{CPL} \le 15$) for 5 moves straight, the engine locks into **Stockfish Skill Level 20**.
* If the player slips into a series of tactical mistakes ($\text{CPL} > 90$), the bot seamlessly injects a subtle error margin into its next search tree calculation to offer a fairer match.
