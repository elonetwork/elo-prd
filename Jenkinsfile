pipeline {
    agent {
        docker {
            image 'gcr.io/kaniko-project/executor:latest'
            args '--privileged'
        }
    }

    environment {
        IMAGE_NAME = 'elonetworkcontainerregistry.azurecr.io/hello-world-example'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Your Kaniko build command here
                    sh "kaniko --context . --dockerfile Dockerfile --destination ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}
