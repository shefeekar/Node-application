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
                    sh 'docker stop node-hello-world || true'  // || true ensures the script continues even if the container is not running
                    sh 'docker rm node-hello-world || true'
                }
            }
        }
    }
}