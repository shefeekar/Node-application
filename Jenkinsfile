pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/shefeekar/hello-world-main.git'
            }
        }

        stage('Build') {
            steps {
               script {
                   def dockerImage = docker.build('node-hello-world:latest')
                   dockerImage.inside {
                       
                   }
               }
            }
        }
    }
}
