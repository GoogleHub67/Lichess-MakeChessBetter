FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

WORKDIR /

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 🟢 FIX: Added the absolute folder path so dynamic module imports don't lose track
ENV PYTHONPATH="/config:/src:/src/Lichess_MakeChessBetter"

CMD ["python", "src/Lichess_MakeChessBetter/app.py"]
