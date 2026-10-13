FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

WORKDIR /workspace

# 1. Install standard requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. 🟢 Force-install the latest version directly from PyPI
RUN pip install --no-cache-dir --upgrade Lichess-MakeChessBetter

# 3. Launch the app directly from your globally installed PyPI library package!
CMD ["python", "-m", "Lichess_MakeChessBetter.app"]
