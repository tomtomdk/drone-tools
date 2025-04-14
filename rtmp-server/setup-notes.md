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
