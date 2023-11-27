pipeline {
    agent {
        kubernetes {
            label 'my-custom-label'
            defaultContainer 'jnlp-docker'
            yaml """
            apiVersion: v1
            kind: Pod
            metadata:
              labels:
                some-label: some-label-value
            spec:
              containers:
              - name: jnlp-docker
                image: jenkins/jnlp-agent:latest
                command:
                - cat
                tty: true
            """
        }
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Define the image name and tag
                    def imageName = "elonetworkcontainerregistry.azurecr.io/hello-world-example"
                    def imageTag = "latest"

                    // Build the Docker image
                    sh "docker build -t ${imageName}:${imageTag} ."

                    // Log in to Azure Container Registry
                    withDockerRegistry(credentialsId: 'your_acr_credentials_id', url: 'https://elonetworkcontainerregistry.azurecr.io') {
                        // Push the Docker image to ACR
                        sh "docker push ${imageName}:${imageTag}"
                    }
                }
            }
        }
    }
}
