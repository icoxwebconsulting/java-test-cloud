#!groovy
pipeline {
    agent any
    tools {
        maven 'Maven3'
    }

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
                sh "cd ApiTesting/"
            }
        }

        stage ('Build') {
            steps {
                sh "mvn -version "
            }
        }

        stage ('Test') {
            steps  {
                sh "mvn -Dcucumber.options=\"--tags @prueba\" clean verify"
            }
            post {
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
            }
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
