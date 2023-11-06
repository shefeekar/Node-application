pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main'
            }
        }

        stage('Build') {
            steps {
                docker.build('node-hello-world:latest')
            }
        }

        
                }
            }
        }
    }
}