pipeline {
    agent any

    stages{
 stage('Build') {
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
    image: gcr.io/kaniko-project/executor:debug
    command:
    - /busybox/cat
    tty: true
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
steps {
      script {
                    sh '''
                        /kaniko/executor \
                        --dockerfile `pwd`/Dockerfile \
                        --context git://github.com/agavitalis/kaniko-kubernetes.git \
                        --destination docker.io/saijiro784/test:1.0.2
                    '''    } 
  }
} 
    }
   
   
}
