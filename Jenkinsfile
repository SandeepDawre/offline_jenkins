pipeline {
    agent any
    stages {
        stage('Docker Image Build') {
            steps {
                echo "Building Docker Image Logging in to Docker Hub & Pushing the Image" 
                def app = docker.build("latest")
                docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/cdex-jenkins', 'dockerhub_creds') {
                    app.push()
                }
            }
        }
        stage('Test') {
            steps {
                echo "Tata"
            }
        }
        stage('Deploy') {
            steps {
                echo "Bye"
            }
        }
    }
    post { 
        always { 
            echo 'Deleting Project now !! '
            deleteDir()
        }
    }
}