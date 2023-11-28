pipeline {
    agent {
        kubernetes {
            // Define the Kubernetes YAML configuration inline
            defaultContainer 'kaniko-demo'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  name: kaniko-demo
spec:
  containers:
  - name: kaniko-demo
    image: gcr.io/kaniko-project/executor:latest
    args: ["--context=git://github.com/agavitalis/kaniko-kubernetes.git",
            "--destination=elonetworkcontainerregistry.azurecr.io/saijiro784/test:1.0.0",
            "--dockerfile=dockerfile"]
    volumeMounts:
    - name: kaniko-secret
      mountPath: /kaniko/.docker
  restartPolicy: Never
  volumes:
  - name: kaniko-secret
    secret:
      secretName: dockercred
      items:
      - key: .dockerconfigjson
        path: config.json
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
