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
            "--destination=docker.io/saijiro784/test:1.0.2",
            "--dockerfile=dockerfile"]
    volumeMounts:
    - name: kaniko-secret
      mountPath: /kaniko/.docker
  - name: busybox-container
    image: busybox:latest
    command: ['sh', '-c', 'echo "Hello from BusyBox"']
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
    stage('Build with Kaniko') {
      environment {
        PATH = "/busybox:/kaniko:$PATH"
      }
      steps {
        container(name: 'busybox-container', shell: '/busybox/sh') {
          sh '''#!/busybox/sh
          ls
          '''
        }
      }
    }
  }
}
