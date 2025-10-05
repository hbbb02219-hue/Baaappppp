FROM python:3.10-slim

# Fix Debian Buster repo issue and install ffmpeg
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy bot files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start bot
CMD ["python3", "main.py"]