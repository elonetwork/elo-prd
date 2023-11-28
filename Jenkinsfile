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
    command:
      - "/bin/sh"
      - "-c"
      - "tail -f /dev/null"
    tty: true
    stdin: true
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

          writeFile file: "Dockerfile", text: """
            FROM jenkins/agent
            MAINTAINER CloudBees Support Team <support@cloudbees.com>
            RUN mkdir /home/jenkins/.m2
          """

          sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --verbosity debug --destination cloudbees/jnlp-from-kaniko:latest
          '''
        }
      }
    }
  }
}
