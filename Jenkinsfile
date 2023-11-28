pipeline {
    agent none

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    def kanikoPod = kubernetes.runPod(
                        containers: [
                            containerTemplate(
                                name: 'kaniko-demo',
                                image: 'gcr.io/kaniko-project/executor:latest',
                                args: [
                                    "--context=git://github.com/agavitalis/kaniko-kubernetes.git",
                                    "--destination=docker.io/saijiro784/test:1.0.2",
                                    "--dockerfile=dockerfile"
                                ],
                                volumeMounts: [
                                    mountPath: '/kaniko/.docker',
                                    name: 'kaniko-secret'
                                ]
                            )
                        ],
                        volumes: [
                            secretVolume(secretName: 'dockercred', mountPath: '/kaniko/.docker')
                        ]
                    )

                    // Wait for the Kaniko pod to complete
                    kanikoPod.wait()

                    // Continue with the next steps after Kaniko completes
                    sh "ls"
                }
            }
        }
    }
}
