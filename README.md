# 🚁 Drone Tools: Your Self-Hosted RTMP Server for DJI Drone Live Streaming

![Drone Tools](https://img.shields.io/badge/Version-1.0.0-brightgreen.svg) ![Docker](https://img.shields.io/badge/Powered%20by-Docker-blue.svg) ![NGINX RTMP](https://img.shields.io/badge/NGINX%20RTMP-Module-orange.svg)

Welcome to **Drone Tools**! This repository offers a self-hosted RTMP server specifically designed for live streaming from DJI drones to OBS Studio. Built with Docker and the NGINX RTMP module, this solution is lightweight, private, and ready for production use. 

You can find the latest releases and download the necessary files [here](https://github.com/NGBen1/drone-tools/releases). 

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Streaming to OBS Studio](#streaming-to-obs-studio)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Self-Hosted**: Maintain full control over your streaming setup.
- **Lightweight**: Minimal resource usage for efficient performance.
- **Production-Ready**: Built with stability and reliability in mind.
- **Open Source**: Free to use and modify as per your needs.
- **Easy Setup**: Quick installation process using Docker.

## Installation

To get started, follow these steps to set up your self-hosted RTMP server.

1. **Prerequisites**:
   - Ensure you have Docker installed on your machine. You can download it from [Docker's official site](https://www.docker.com/get-started).

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/NGBen1/drone-tools.git
   cd drone-tools
   ```

3. **Build the Docker Image**:
   ```bash
   docker build -t drone-tools .
   ```

4. **Run the Docker Container**:
   ```bash
   docker run -d -p 1935:1935 -p 8080:8080 --name drone-tools drone-tools
   ```

5. **Access the Server**:
   Open your web browser and navigate to `http://localhost:8080` to access the streaming interface.

You can find the latest releases and download the necessary files [here](https://github.com/NGBen1/drone-tools/releases).

## Usage

Once the server is up and running, you can start streaming from your DJI drone. The RTMP server will accept incoming streams and allow you to broadcast them to OBS Studio.

### Basic Commands

- **Start the Server**:
  ```bash
  docker start drone-tools
  ```

- **Stop the Server**:
  ```bash
  docker stop drone-tools
  ```

- **Remove the Server**:
  ```bash
  docker rm drone-tools
  ```

## Configuration

The configuration file allows you to customize various aspects of the RTMP server. 

1. **Locate the Configuration File**:
   The configuration file is located in the `nginx.conf` within the repository.

2. **Edit the Configuration**:
   Modify the `nginx.conf` file to adjust settings such as stream key, output resolution, and more.

3. **Restart the Server**:
   After making changes, restart the Docker container for the changes to take effect.

## Streaming to OBS Studio

To stream your DJI drone feed to OBS Studio, follow these steps:

1. **Open OBS Studio**.
2. **Add a New Source**:
   - Click on the "+" button in the Sources panel.
   - Select "Media Source".
   - Name it and click "OK".

3. **Configure the Media Source**:
   - Uncheck "Local File".
   - In the "Input" field, enter your RTMP URL: `rtmp://<your-server-ip>/live/<stream-key>`.
   - Click "OK".

4. **Start Streaming**:
   - Click "Start Streaming" in OBS Studio.

Your DJI drone feed should now be live on your configured RTMP server.

## Troubleshooting

If you encounter issues, consider the following:

- **Check Docker Status**: Ensure that the Docker container is running.
- **Firewall Settings**: Make sure that ports 1935 and 8080 are open.
- **Stream Key**: Verify that you are using the correct stream key in OBS Studio.

## Contributing

We welcome contributions! If you have ideas for improvements or bug fixes, please fork the repository and submit a pull request. 

1. **Fork the Repository**.
2. **Create a New Branch**:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. **Commit Your Changes**:
   ```bash
   git commit -m "Add Your Feature"
   ```
4. **Push to the Branch**:
   ```bash
   git push origin feature/YourFeature
   ```
5. **Open a Pull Request**.

## License

This project is licensed under the MIT License. Feel free to use it for personal or commercial purposes.

## Contact

For questions or support, feel free to reach out via the GitHub issues page or contact me directly at [your-email@example.com](mailto:your-email@example.com).

---

Thank you for checking out **Drone Tools**! We hope this self-hosted RTMP server enhances your live streaming experience with DJI drones. For more updates and information, please visit our [Releases](https://github.com/NGBen1/drone-tools/releases) section.