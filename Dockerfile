FROM python:3.10-slim

RUN apt-get update && apt-get install -y stockfish && rm -rf /var/lib/apt/lists/*
RUN chmod +x /usr/games/stockfish

# Set up your workspace root
WORKDIR /workspace

# Install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your exact repository layout over
COPY . .

# 🟢 THE CLEAN HYBRID PATHWAY: Points python to your workspace folders natively
ENV PYTHONPATH="/workspace:/workspace/config:/workspace/src:/workspace/src/Lichess_MakeChessBetter"

# Run your app file directly from its real location
CMD ["python", "src/Lichess_MakeChessBetter/app.py"]
