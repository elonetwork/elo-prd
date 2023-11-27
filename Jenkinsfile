pipeline {
    agent any

    stages {
        stage('Install Docker') {
            steps {
                script {
                    // Check if Docker is installed
                    def dockerInstalled = sh(script: 'command -v docker', returnStatus: true) == 0

                    // Install Docker if not installed
                    if (!dockerInstalled) {
                        echo 'Docker is not installed. Installing Docker...'
                        sh 'sudo apt-get update'
                        sh 'sudo apt-get install -y docker.io'
                    } else {
                        echo 'Docker is already installed.'
                    }
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Define the image name and tag
                    def imageName = "elonetworkcontainerregistry.azurecr.io/hello-world-example"
                    def imageTag = "latest"

                    // Build the Docker image
                    docker.build(imageName + ":" + imageTag, '.')

                    // Log in to Azure Container Registry
                    withDockerRegistry(credentialsId: 'your_acr_credentials_id', url: 'https://elonetworkcontainerregistry.azurecr.io') {
                        // Push the Docker image to ACR
                        docker.image(imageName + ":" + imageTag).push()
                    }
                }
            }
        }
    }
}

