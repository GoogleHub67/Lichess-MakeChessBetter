# 📚 Opening Book & Move Tree Selection

To conserve system memory and preserve engine thinking time during initial phases, the bot utilizes a Polyglot compiled library matrix before activating Stockfish calculations.

## 📦 Default Matrix Binary
The system reads the pre-compiled `gm2001.bin` move registry. This compilation aggregates over 2.5 million grandmaster moves across historical tournament networks.

## 🎛️ Selection Weights Logic (`openings.py`)
When multiple book choices match the current chess position array layout, the selection sequence acts according to a specialized weight variable:

```text
Position Matrix Matched 
   │
   ├── [Option A: e4] ➔ Weight: 65% (High Priority, Classical Aggressive)
   ├── [Option B: d4] ➔ Weight: 25% (Positional Backup Strategy)
   └── [Option C: c4] ➔ Weight: 10% (Subtle Variant Deviation)
```

## 🛠️ Loading Custom Polyglot Books
To hot-swap your opening parameters, place your custom `.bin` file into the root environment directory and map the parameters directly inside your code logic:
```python
# Modifying opening book allocation limits dynamically
self.opening_book = chess.polyglot.open_reader("your_custom_book.bin")
```
