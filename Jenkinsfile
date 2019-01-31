#!groovy
pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    parameters { choice(name: 'TAG', choices: ['Project', 'Create', 'Delete', 'Find', 'Alert'], description: '') }

    stages {

        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Download Project') {
            steps {
                git url: 'https://github.com/icoxwebconsulting/java-test-cloud.git'
            }
        }

        stage ('Test') {
            steps  {
                withCredentials([usernamePassword(credentialsId: 'mauro', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "mvn -Dcucumber.options='--tags @$parameters.TAG' -Dusername=$username -Dpassword=$password clean test"
                }
            }
            post {
                always{
                    cucumber fileIncludePattern: '**/*.json',
                             sortingMethod: 'ALPHABETICAL',
                             jsonReportDirectory: 'target/cucumber-parallel'
                }
            }
            /*post {
                always {
                    publishHTML (target: [
                            allowMissing: false,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: 'target/test-report',
                            reportFiles: 'index.html',
                            reportName: "Executive Report"
                    ])
                }
            }*/
        }

    }
    options {
        timestamps()
        buildDiscarder(logRotator(artifactNumToKeepStr: '5',artifactDaysToKeepStr: '14'))
        disableConcurrentBuilds()
        skipDefaultCheckout()
        timeout(time: 1, unit: 'DAYS')
    }
}
