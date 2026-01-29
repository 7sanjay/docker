pipeline {
    agent any

    tools {
        maven 'maven9'
    }

    environment {
        // Nexus
        NEXUS_URL  = "http://16.16.100.54:8081"
        NEXUS_REPO = "mymaven"

        // Artifact details
        GROUP_ID    = "com.example.app"
        ARTIFACT_ID = "demo-app"
        VERSION     = "1.0.0"
        FILE        = "target/demo-app-1.0.0.jar"
    }

    stages {

        stage('Checkout from GitHub') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/7sanjay/docker.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Verify Artifact') {
            steps {
                sh 'ls -lh target/*.jar'
            }
        }

        stage('Upload to Nexus') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'nexus-creds',
                    usernameVariable: 'NEXUS_USER',
                    passwordVariable: 'NEXUS_PASS'
                )]) {
                    sh '''
                    curl -f -u $NEXUS_USER:$NEXUS_PASS \
                    -X POST "$NEXUS_URL/service/rest/v1/components?repository=$NEXUS_REPO" \
                    -F "maven2.groupId=$GROUP_ID" \
                    -F "maven2.artifactId=$ARTIFACT_ID" \
                    -F "maven2.version=$VERSION" \
                    -F "maven2.generate-pom=true" \
                    -F "maven2.asset1=@$FILE" \
                    -F "maven2.asset1.extension=jar"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build and Nexus upload completed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
