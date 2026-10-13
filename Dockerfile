FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

# 1. No custom workspace folders. Copy directly into the container's root filesystem scope
WORKDIR /

# 2. Grab requirements.txt directly from your repo root
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. Bring over your exact repository structure (maintaining src/ and config/)
COPY . .

# 4. Inject a fallback so python natively detects your standalone config folder layout
ENV PYTHONPATH="/src:/config:/src/Lichess_MakeChessBetter"

# 5. Execute using your exact root relative pathway
CMD ["python", "src/Lichess_MakeChessBetter/app.py"]
