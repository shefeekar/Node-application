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
                   def dockerImage = docker.build('hello-world:latest')
                   dockerImage.inside {
                    sh "cd /var/jenkins_home/workspace/docker-image@script/282c4e1ab902bdfc227a268ff53318d7d750667271033db2a8f34b631f99d15a && node /home/shefeek/Desktop/node-hello-world-main/script.js"
                       
                   }
               }
            }
        }
    }
}
