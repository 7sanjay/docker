pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/7sanjay/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dockerimage:latest .'
            }
        }
    }
}
