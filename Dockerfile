FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

# 1. Start out at a neutral root workspace folder inside the container
WORKDIR /app

# 2. Copy requirements.txt straight from your repository root and install it
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copy your whole repository layout into the container 
COPY . .

# 4. Run python by pointing precisely to where app.py lives from the root
CMD ["python", "src/Lichess_MakeChessBetter/app.py"]
