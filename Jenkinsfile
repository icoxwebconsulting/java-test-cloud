#!groovy
pipeline {
    agent { label 'master'}

    parameters {
        choice( name: 'Scenario',
                choices: "Project\nCreate\nDelete\nFind\nAlert",
                description: '')
    }

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
                //git url: 'https://github.com/icoxwebconsulting/java-test-cloud.git'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-credentials', url: 'https://github.com/icoxwebconsulting/java-test-cloud.git']]])
            }
        }

        stage ('Test') {
            steps  {
                withCredentials([usernamePassword(credentialsId: 'mauro', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "mvn -Dcucumber.options='--tags @${parameters.Scenario}' -Dusername=$username -Dpassword=$password clean test"
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
