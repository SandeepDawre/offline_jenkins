pipeline {
    agent any
    stages {
        stage('Docker Image Build IN Dev') {
            when {
                branch 'dev'
            }
            steps {
                echo "Building Docker Image Logging in to Docker Hub & Pushing the Image" 
                script {
                    def app = docker.build("teamcloudethix/dev-cdex-jenkins:latest")
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/dev-cdex-jenkins', 'dev-dockerhub_creds') {
                    app.push()
                    }
                }
                sh 'echo Image Pushed to DEV'
                sh 'echo Deleting Local docker DEV Image'
            }
        }
        stage('Pull Tag push to QA') {
            when {
                branch 'qa'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/dev-cdex-jenkins', 'dev-dockerhub_creds') {
                    docker.image("teamcloudethix/dev-cdex-jenkins:latest").pull()
                    }
                }
                sh 'echo Image pulled from DEV'
                sh 'echo Taggig Docker image from Dev to QA'
                sh "docker tag teamcloudethix/dev-cdex-jenkins:latest  teamcloudethix/qa-cdex-jenkins:latest" 
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/qa-cdex-jenkins', 'qa-dockerhub_creds') {
                    app.push() 
                    }
                }
                sh 'echo Image Pushed to QA'
                sh 'echo Deleting Local docker Images'
            }
        }
        stage('Pull Tag push to stage') {
            when {
                branch 'stage'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/qa-cdex-jenkins', 'qa-dockerhub_creds') {
                    docker.image("teamcloudethix/qa-cdex-jenkins:latest").pull()
                    }
                }
                sh 'echo Image pulled from QA'
                sh 'echo Taggig Docker image from QA to Stage'
                sh "docker tag teamcloudethix/qa-cdex-jenkins:latest  teamcloudethix/stage-cdex-jenkins:latest" 
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/stage-cdex-jenkins', 'stage-dockerhub_creds') {
                    app.push() 
                    }
                }
                sh 'echo Image Pushed to STAGE'
                sh 'echo Deleting Local docker Images'
            }
        }
        stage('Pull Tag push to Prod') {
            when {
                branch 'prod'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/stage-cdex-jenkins', 'stage-dockerhub_creds') {
                    docker.image("teamcloudethix/stage-cdex-jenkins:latest").pull()
                    }
                }
                sh 'echo Image pulled from QA'
                sh 'echo Taggig Docker image from stage to prod'
                sh "docker tag teamcloudethix/stage-cdex-jenkins:latest  teamcloudethix/prod-cdex-jenkins:latest" 
                script {
                    docker.withRegistry('https://registry.hub.docker.com/teamcloudethix/prod-cdex-jenkins', 'prod-dockerhub_creds') {
                    app.push() 
                    }
                }
                sh 'echo Image Pushed to Prod'
                sh 'echo Deleting Local docker Images'
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