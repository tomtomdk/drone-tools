# 🚀 Local RTMP Server for DJI Drone Streaming

[![Docker Build](https://img.shields.io/badge/Docker-Build%20Passing-brightgreen)](https://www.docker.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE.md)
[![Status: Production Ready](https://img.shields.io/badge/Status-Production%20Ready-green)]()

---

## Overview

This project provides a **self-hosted RTMP server** inside a **Docker container** for streaming video from your **DJI drone controller** directly into **OBS Studio** — without relying on external services like YouTube or Twitch.  
Built with **NGINX** and the **RTMP module**, it offers a simple, fast, and fully local streaming solution.

---

## Features

- 🎥 Real-time DJI video streaming to OBS Studio.
- 📦 Fully containerized with Docker.
- 🔒 100% private, local network streaming.
- ⚡ Lightweight and production-ready setup.
- 🛠️ Single-command deployment using `docker-compose`.

---

## Prerequisites

| Software | Purpose | Download |
|:---------|:--------|:---------|
| **Docker** | Run containerized RTMP server | [Docker Download](https://www.docker.com/products/docker-desktop) |
| **Docker Compose** | Manage services with single command | [Compose Install Guide](https://docs.docker.com/compose/install/) |
| **OBS Studio** | Capture and record the RTMP stream | [OBS Studio Download](https://obsproject.com/download) |

✅ **Additional Requirements**:
- Your DJI controller must support **Custom RTMP streaming**.
- Laptop and DJI controller must be connected to the **same local network**.

---

## 🏁 Quickstart (Using Docker Compose)

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/rtmp-docker-dji-stream.git
cd rtmp-docker-dji-stream
```

---

### Step 2: Bring Up the Server

```bash
docker-compose up -d
```

✅ This will **build** the Docker image and **launch** the container automatically.

---

### Step 3: Shut Down the Server

```bash
docker-compose down
```

---

## 📄 `docker-compose.yml` Used

Here’s the **full `docker-compose.yml`** included in this project:

```yaml
version: '3.8'

services:
  rtmp-server:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: local-nginx-rtmp
    ports:
      - "1935:1935"   # RTMP streaming port
      - "8080:8080"   # HTTP stats/test page
    restart: unless-stopped
```

✅ **Explanation**:
| Field | Purpose |
|:-----|:--------|
| `version: '3.8'` | Modern, widely compatible Compose version |
| `build.context` | Build from the current directory |
| `container_name` | Easy-to-manage container name |
| `ports` | Exposes RTMP (1935) and HTTP (8080) |
| `restart: unless-stopped` | Auto-restarts the container on failure or reboot |

---

## 🔥 RTMP Server Configuration

The server exposes:

| Port | Purpose |
|:----:|:-------:|
| 1935 | RTMP stream ingest (from DJI controller) |
| 8080 | HTTP web page (optional stats and testing) |

You can view basic server info at: [http://localhost:8080](http://localhost:8080)

---

## 📋 DJI Controller Setup

1. Open your DJI Controller settings.
2. Set **Custom RTMP** as your streaming method.
3. Configure the URL to:

```plaintext
rtmp://<your-laptop-ip>/live/stream
```

- Replace `<your-laptop-ip>` with your actual local IP address.
- Find it by running:
  - Windows: `ipconfig`
  - Mac/Linux: `ifconfig`

---

## 🎥 OBS Studio Setup

1. Open **OBS Studio**.
2. Add a **Media Source** to your scene.
3. Configure the Media Source:
   - **Uncheck** "Local File"
   - **Input URL**:

   ```plaintext
   rtmp://localhost/live/stream
   ```

4. Start streaming from your DJI controller — the video feed will appear inside OBS.

---

## 📂 Folder Structure

```plaintext
rtmp-docker-dji-stream/
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── README.md
└── (optional) index.html
```

---

## 📄 Key Files Explained

| File | Purpose |
|:-----|:--------|
| `Dockerfile` | Defines the NGINX + RTMP server container |
| `docker-compose.yml` | Single-command deployment file |
| `nginx.conf` | RTMP server and HTTP server configuration |
| `index.html` (optional) | Landing page for HTTP server |

---

## 🛠️ Advanced Usage

| Action | Command |
|:------|:--------|
| Rebuild after changes | `docker-compose up -d --build` |
| View container logs | `docker logs -f local-nginx-rtmp` |
| Manually stop/start container | `docker stop local-nginx-rtmp && docker start local-nginx-rtmp` |

---

## 🧰 Troubleshooting

| Problem | Solution |
|:--------|:---------|
| OBS black screen | Ensure DJI controller is sending the stream. Confirm correct RTMP URL. |
| Controller can't connect | Verify laptop/controller are on the same network. Check firewall settings. |
| Server not reachable | Confirm Docker container is running and ports are mapped correctly. |

---

## 📜 License

This project is licensed under the [MIT License](LICENSE.md).

---

## 🤝 Credits

- [NGINX RTMP Module](https://github.com/arut/nginx-rtmp-module)
- [Docker](https://www.docker.com/)
- [OBS Studio](https://obsproject.com/)

---

## 📬 Contact

For questions, improvements, or feedback:  
**rob@aztekmq.net**

---

# ✅ Status: **Production Ready**

---

# 🚀 Ready to Stream Locally?
Launch your **self-hosted RTMP server** in seconds — and keep your drone footage **private, secure, and lightning-fast**!

---

# 🔥 Summary of What's Included:
- Dockerfile (NGINX + RTMP module)
- nginx.conf (RTMP server configuration)
- docker-compose.yml (professional single-command startup)
- Fully structured, lightweight, production-grade deployment

