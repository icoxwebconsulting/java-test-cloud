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
            }
        }

        stage ('Test') {
            steps  {
                withCredentials([usernamePassword(credentialsId: 'mauro', passwordVariable: '316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af', usernameVariable: 'alejandrodavidsalazar@gmail.com')]) {
                    sh "mvn -Dcucumber.options='--tags @findProject1' -Dusername=$username -Dpassword=$password clean verify"
                }
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
