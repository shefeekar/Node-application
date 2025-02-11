# Node.js Application: CI/CD with Docker and Jenkins

## Description
.
This project demonstrates the CI/CD process for a Node.js application using Docker and Jenkins. The pipeline automates the process of building a Docker image, running the container, and performing cleanup tasks, ensuring a seamless development and deployment workflow.

## Features

- Docker-based Node.js application containerization.
- Automated Jenkins pipeline for build, run, and cleanup.
- Port exposure and application startup configured for seamless access.
- Simple and reusable pipeline setup for CI/CD tasks.

## Prerequisites

- A running Jenkins instance with:
    - Docker installed on the Jenkins node.
    - Git plugin installed.
- Docker installed on the host or Jenkins node.
- GitHub repository containing the application source code and Dockerfile.

## Application Overview

### **Dockerfile Details**

The provided `Dockerfile` builds a containerized Node.js application:

```
Dockerfile
Copy code
FROM node:latest

# Create an app directory
WORKDIR /

# Copy the package.json file
COPY package.json ./

# Install the app dependencies
RUN npm install

# Copy the app source
COPY . .

# Expose the port the app is running on
EXPOSE 8081

# Start the app when the container is run
CMD ["npm", "start"]

```

**Key Features:**

- Uses the latest Node.js base image.
- Installs dependencies using `npm install`.
- Exposes port `8081` for the application.
- Runs the application with `npm start`.

### **Jenkins Pipeline Details**

The Jenkins pipeline automates the following tasks:

1. **Checkout Stage**
    - Clones the application repository from GitHub.
2. **Build and Run Stage**
    - Builds the Docker image for the Node.js application.
    - Runs the container, mapping port `8081` for external access.
3. **Cleanup Stage**
    - Stops and removes the Docker container after execution.

Pipeline script:

```groovy
groovy
Copy code
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/shefeekar/hello-world-main.git'
            }
        }

        stage('Build and Run') {
            options {
                timeout(time: 2, unit: 'MINUTES')
            }
            steps {
                script {
                    // Build the Docker image
                    def dockerImage = docker.build('node-hello-world:latest')

                    // Run the Docker container
                    sh 'docker run -p 8081:8081 --name node-hello-world node-hello-world:latest'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Stop and remove the Docker container
                    sh 'docker stop node-hello-world || true'
                    sh 'docker rm node-hello-world || true'
                }
            }
        }
    }
}

```

## Usage

### Step 1: Clone the Repository

Clone the source code repository:

```bash
bash
Copy code
git clone https://github.com/shefeekar/hello-world-main.git
cd hello-world-main

```

### Step 2: Configure Jenkins

1. Create a new pipeline job in Jenkins.
2. Copy and paste the provided pipeline script into the Jenkins pipeline configuration.
3. Ensure Docker is installed and configured on the Jenkins node.

### Step 3: Execute the Pipeline

1. Trigger the pipeline from Jenkins.
2. Monitor the console output to ensure each stage completes successfully.

## Pipeline Workflow

- **Stage 1:** Clones the Node.js application source code.
- **Stage 2:** Builds the Docker image and runs the container.
- **Stage 3:** Stops and removes the Docker container after execution.

## Application Access

Once the pipeline runs successfully, the Node.js application will be accessible at:

```arduino
arduino
Copy code
http://<Jenkins-node-IP>:8081

```

## Troubleshooting

- Ensure Docker is installed and running.
- Verify the availability of port `8081` on the host system.
- Check Jenkins logs for any errors during pipeline execution.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this project.

## License

This project is licensed under the MIT License.
