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
                   def dockerImage = docker.build('node-hello-world:latest'

                   dockerImage.inside {
                    sh 'docker run -it -p 8080:8080 --name node-hello-world node-hello-world:latest'
                       
                   }
               }
            }
        }
    }
}
