# ✅ Use latest stable Debian bookworm base (not buster/bullseye)
FROM python:3.10-slim-bookworm

# ✅ Install Node.js (for Telegram bots needing Node)
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ✅ Set working directory
WORKDIR /app

# ✅ Copy all files
COPY . /app/

# ✅ Install Python dependencies
RUN pip install --no-cache-dir -U -r requirements.txt

# ✅ Start the bot
CMD ["bash", "start"]