pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh """
                echo 'FROM ubuntu:22.04' > Dockerfile
                echo 'RUN apt-get update && apt-get install -y curl git' >> Dockerfile
                echo 'CMD ["bash"]' >> Dockerfile
                docker build -t dockerimage:latest .
                """
            }
        }
    }
}

