pipeline {
    agent any
    environment { 
        Month = 'Ramdaan'
    }
    parameters {
        choice(name: 'NAME', choices: ['Vivek', 'Zubair', 'Asad'], description: 'Pick the name')
        choice(name: 'LAST_NAME', choices: ['More', 'Baig', 'Shaikh'], description: 'Pick the last name')
        booleanParam(name: 'IS_TRUE', defaultValue: true, description: 'Toggle this value')
    }
    stages {
        stage('Calling Name') {
            when {
                branch 'master'
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
            steps {
                echo "Hello ${params.NAME}"
                echo "Hello, ${PERSON}, nice to meet you."
                sh "/bin/bash ./welcome.sh ${params.NAME} ${params.LAST_NAME} ${params.IS_TRUE}"
                sh 'echo "Calling Holy Month $env.Month"'
            }
        }
        stage('Calling Last Name') {
            when {
                branch 'dev'
            }
            steps {
                echo "Hello ${params.LAST_NAME}"
                sh 'echo "Calling Holy Month $Month"'
            }
        }
        stage('Calling all ') {
            when {
                branch 'qa'
            }
            steps {
                echo "Hello ${params.NAME} ${params.LAST_NAME} ${params.IS_TRUE}"
                sh 'echo "Calling Holy Month $Month"'
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