# Jenkins Pipeline for yashikakart

This repository contains a Jenkins pipeline (`Jenkinsfile`) for building, testing, scanning, and deploying a Java/Maven web application with Docker, Trivy, and SonarQube integration.

## Pipeline Overview

The pipeline automates the following steps:

1. **Clone Repo**: Clones the specified branch from the GitHub repository using credentials.
2. **Build Java**: Builds the Java project using Maven (skipping tests).
3. **Build Docker Image**: Builds a Docker image for the application.
4. **Run Docker Container**: Runs the built Docker image as a container, cleaning up any previous containers/images.
5. **Sanity Test**: Performs a simple HTTP check to verify the application is running.
6. **Install Trivy**: Installs Trivy for vulnerability scanning.
7. **Trivy Scan**: Scans the Docker image for vulnerabilities and saves the output.
8. **Generate HTML Report**: Converts the Trivy scan output into a clean HTML report.
9. **Push Docker Image**: Tags and pushes the Docker image to Docker Hub.
10. **Publish Artifacts**: Archives the Trivy scan output and HTML report as Jenkins artifacts.
11. **SonarQube Analysis**: Supports three analysis methods:
    - Using the official SonarQube Docker CLI (for Linux/ARM64 agents)
    - Using the native macOS ARM64 SonarQube scanner
    - Using Maven's `sonar:sonar` goal
12. **Quality Gate**: Waits for SonarQube quality gate results and aborts the pipeline if the gate fails.

## Prerequisites

- Jenkins agent with Docker, Maven, and (optionally) Trivy installed
- Docker group permissions for the Jenkins user (for running Docker commands)
- SonarQube server and credentials configured in Jenkins
- Docker Hub credentials configured in Jenkins

## Parameters
- `BRANCH_NAME`: The Git branch to build (default: `main`)

## SonarQube Integration
- The pipeline supports SonarQube analysis via Docker, native binary, or Maven plugin.
- Configure your SonarQube server in Jenkins and set the correct credentials.

## Usage
1. Create a Jenkins pipeline job and point it to this repository's `Jenkinsfile`.
2. Set up required credentials in Jenkins (Git, Docker Hub, SonarQube).
3. Ensure your Jenkins agent has the necessary tools and permissions.
4. Run the pipeline, optionally specifying a different branch.

## Notes
- The pipeline is compatible with ARM64 (Apple Silicon/macOS) and Linux agents.
- Trivy and SonarQube scanner installation steps are included for agent compatibility.
- The pipeline cleans up old Docker containers and images to save space.

---

For any issues or improvements, please open an issue or submit a pull request.
