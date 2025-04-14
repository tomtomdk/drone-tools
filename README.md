Sure! Here’s a **professional `README.md`** for your project, outlining everything step-by-step, including prerequisites, setup instructions, and usage.

```markdown
# Local RTMP Server for DJI Controller Streaming using Docker

## Overview

This project allows you to stream video from your **DJI Drone Controller** to **OBS Studio** on your laptop via an **RTMP server** running inside a **Docker container**. The server is based on **NGINX** with the **RTMP module**. This setup ensures that the stream is **local** to your machine, with no need for third-party platforms like YouTube or Twitch.

## Features
- Stream **DJI Drone** video to your laptop in **real-time**.
- **OBS Studio** can capture the stream from the local RTMP server.
- **Docker-based** solution for easy setup and portability.

## Prerequisites

Before getting started, ensure that you have the following installed:

- **Docker**: The project is containerized, so Docker must be installed on your machine.
  - Download and install Docker from: [Docker Official Website](https://www.docker.com/products/docker-desktop)
- **OBS Studio**: To view and record the stream.
  - Download OBS Studio from: [OBS Official Website](https://obsproject.com/download)

### For the DJI Controller:
- Your **DJI Controller** must support **RTMP streaming**. It should be able to stream directly to a custom RTMP server.
- Your laptop and DJI controller should be on the **same network** for the RTMP stream to work.

## Setup Instructions

### Step 1: Clone the Repository

Clone this repository to your local machine.

```bash
git clone https://github.com/yourusername/rtmp-docker-dji-stream.git
cd rtmp-docker-dji-stream
```

### Step 2: Docker Image Setup

This project uses **Docker** to set up an **NGINX RTMP server**.

#### 2.1: Dockerfile and Configuration

The Docker container is configured to run an **NGINX RTMP server** with the following settings:

- **RTMP server listens on port 1935** for incoming streams.
- **HTTP server listens on port 8080** (for testing purposes).

#### 2.2: Build the Docker Image

Run the following command to build the Docker image:

```bash
docker build -t nginx-rtmp .
```

### Step 3: Running the Docker Container

Once the image is built, run the container in detached mode:

```bash
docker run -d --name nginx-rtmp -p 1935:1935 -p 8080:8080 nginx-rtmp
```

This command maps:
- **Port 1935** (RTMP) from the container to your laptop.
- **Port 8080** (HTTP) for testing purposes.

### Step 4: Configure Your DJI Controller

1. Open the **settings menu** on your DJI Controller.
2. Choose the **Custom RTMP option** for streaming.
3. Set the RTMP URL to:

   ```
   rtmp://<your-laptop-ip>/live/stream
   ```

   Replace `<your-laptop-ip>` with the **local IP address** of your laptop. You can find it using the command:

   ```bash
   ipconfig (Windows) or ifconfig (Mac/Linux)
   ```

### Step 5: Configure OBS Studio

1. Open **OBS Studio** on your laptop.
2. Add a **Media Source** to your scene.
3. In the **Media Source properties**, uncheck **Local File** and set the **Input URL** to:

   ```
   rtmp://localhost/live/stream
   ```

4. Click **OK** and start streaming from your DJI controller.

## Usage

Once the Docker container is running and your DJI controller is streaming, you should see the feed in **OBS Studio**. You can then record or broadcast it according to your preferences.

- **Test the connection**: You can verify that the server is running correctly by opening a browser and visiting:
  ```
  http://localhost:8080
  ```

  If the stream is active, you will see the default NGINX HTML page.

## Troubleshooting

- **No video in OBS**:
  - Ensure the DJI controller is correctly streaming to the RTMP URL.
  - Make sure that the **NGINX server** is running properly and the ports are open.
  
- **Unable to connect to RTMP server**:
  - Ensure that both your DJI controller and laptop are on the same network.
  - Check that your firewall allows inbound connections to port 1935.

## Docker Commands

To **stop** the Docker container:

```bash
docker stop nginx-rtmp
```

To **restart** the Docker container:

```bash
docker restart nginx-rtmp
```

To **remove** the Docker container:

```bash
docker rm nginx-rtmp
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

## Acknowledgments

- **NGINX** for providing the RTMP module: [NGINX RTMP Module](https://github.com/arut/nginx-rtmp-module)
- **Docker** for making containerization simple and portable.
- **OBS Studio** for providing a powerful open-source tool to capture streams.

---

For more details or questions, feel free to contact us at [your-email@example.com].

```

---

### Key Sections of the `README.md`:
- **Overview**: A brief introduction to the project.
- **Prerequisites**: Requirements like Docker, OBS Studio, and network setup.
- **Setup Instructions**: Clear, step-by-step guide to building and running the Docker container.
- **Usage**: How to configure your DJI controller and OBS Studio to stream locally.
- **Troubleshooting**: Tips to resolve common issues.
- **Docker Commands**: Handy commands for managing the Docker container.
- **License**: Information on licensing and any acknowledgments.

This will give your project a professional, user-friendly structure that’s easy for others to follow and get started with.
