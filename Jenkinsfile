pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            steps {
                kubernetes {
                    defaultContainer 'busybox-container'
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
            "--destination=docker.io/saijiro784/test:1.0.2",
            "--dockerfile=dockerfile"]
    volumeMounts:
    - name: kaniko-secret
      mountPath: /kaniko/.docker
  - name: busybox-container
    image: busybox:latest
    command: ['sh', '-c', 'tail -f /dev/null']
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
        }
    }
}
