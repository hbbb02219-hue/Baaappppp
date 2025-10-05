# ✅ Updated base image (Bullseye = latest stable Debian)
FROM nikolaik/python-nodejs:python3.10-nodejs20-bullseye

# ✅ Update repo sources + install ffmpeg safely
RUN apt-get update --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ✅ Copy app files
WORKDIR /app
COPY . /app/

# ✅ Install Python dependencies
RUN pip3 install --no-cache-dir -U -r requirements.txt

# ✅ Start command
CMD ["bash", "start"]