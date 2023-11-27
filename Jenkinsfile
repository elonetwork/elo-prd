pipeline {
    agent {
        kubernetes {
            label 'docker-agent'
            yaml '''
            apiVersion: v1
            kind: Pod
            metadata:
                labels:
                    some-label: some-label-value
                name: my-custom-label-7jkcx-tq8km
            spec:
              containers:
              - name: jnlp
                image: jenkins/inbound-agent:latest
                command: ["/bin/bash"]
                args: ["-s"]
              - name: docker
                image: docker:latest
                volumeMounts:
                - name: docker-sock
                  mountPath: /var/run/docker.sock
              volumes:
              - name: docker-sock
                hostPath:
                  path: /var/run/docker.sock
            '''
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
