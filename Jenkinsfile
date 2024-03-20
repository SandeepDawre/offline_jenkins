pipeline {
    agent any 
    stages {
        stage('Test Jekins k8s') { 
            steps {
                script {
                    withKubeCredentials(kubectlCredentials: [[ credentialsId: 'dev_kube_config' ]]) {
                        
                        sh 'kubectl get pod --all-namespaces'

                    }
                }

            }
        }

        }
}
