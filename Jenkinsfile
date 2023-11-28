pipeline {
    agent any

    stages {
        stage('Create Kubernetes Pod') {
            steps {
                script {
                    // Define Kubernetes pod YAML
                    def podTemplate =  """
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

                    // Create the Kubernetes pod
                    kubernetesDeploy(
                        kubeconfigId: '652cf836-cff5-4822-8bbf-ebc5faa71fb4',
                        configs: podTemplate
                    )
                }
            }
        }

        // Add more stages as needed
    }
}
