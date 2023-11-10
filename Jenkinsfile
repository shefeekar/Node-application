pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/shefeekar/hello-world-main.git'
            }
        }

        stage('Build') {
            timeout  { 
                time(2)
                unit('MINUTES')
            steps {
               script {
                   def dockerImage = docker.build('node-hello-world:latest')
                    // Run the docker run command
                   sh 'docker run  -p 8081:8081 --name node-hello-world node-hello-world:latest'
                   
               }
            }
        }
    }
}
}