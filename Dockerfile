FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

# 1. Establish your project home base folder
WORKDIR /workspace

# 2. Copy and install standard requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. Bring over your entire live GitHub repository code structure
COPY . .

# 4. 🟢 THE GLOBAL PATH SOLUTION: Make your workspace paths take precedence
ENV PYTHONPATH="/workspace:/workspace/config:/workspace/src:/workspace/src/Lichess_MakeChessBetter"

# 5. Force Python to run the absolute file path inside your workspace, bypass -m module routing
CMD ["python", "src/Lichess_MakeChessBetter/app.py"]
