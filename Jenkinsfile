pipeline {
    agent any 
    stages {
        stage('Test Jekins k8s') { 
            steps {
                script {
                    withKubeCredentials(kubectlCredentials: [[ credentialsId: 'dev_kube_config' ]]) {
                        
                        kubectl get pod --all-namespaces

                    }
                }

            }
        }

        }
}
