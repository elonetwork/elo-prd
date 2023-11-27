pipeline {
    agent {
        docker {
            image 'docker:dind'
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
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."

                    // Log in to Azure Container Registry
                    withDockerRegistry(credentialsId: 'your_acr_credentials_id', url: 'https://elonetworkcontainerregistry.azurecr.io') {
                        // Push the Docker image to ACR
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
