pipeline {
    agent any
    parameters {
        choice(name: 'NAME', choices: ['Vivek', 'Zubair', 'Asad'], description: 'Pick the name')
        choice(name: 'LAST_NAME', choices: ['More', 'Baig', 'Shaikh'], description: 'Pick the last name')
        booleanParam(name: 'IS_TRUE', defaultValue: true, description: 'Toggle this value')
    }
    stages {
        stage('Calling Name') {
            steps {
                //docker image build -t teamcloudethix:v1 .
                echo "Hello ${params.NAME}"
                sh "/bin/bash ./welcome.sh ${params.NAME} ${params.LAST_NAME} ${params.IS_TRUE}"
            }
        }
        stage('Calling Last Name') {
            steps {
                //docker login
                //docker image push teamcloudethix:v1
                echo "Hello ${params.LAST_NAME}"
            }
        }
        stage('Calling all ') {
            steps {
                //export KUBECONFIG=CONFIG_PATH
                //kubectl apply -f  kube/.
                echo "Hello ${params.NAME} ${params.LAST_NAME} ${params.IS_TRUE}"
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