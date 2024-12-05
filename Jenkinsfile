pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        build job: 'build'
                    } else if (env.BRANCH_NAME == 'develop') {
                        build job: 'test'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'develop') {
                        // Test the application
                        sh 'echo Testing application on develop branch'
                    } else if (env.BRANCH_NAME == 'master') {
                        // Test the application
                        sh 'echo Testing application on master branch'
                    }
                }
            }
        }
        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Deploy the application to production
                    build job: 'prod'
                }
            }
        }
    }
}
