pipeline {

    agent any

    environment {
        TF_IN_AUTOMATION = "true"
        TF_INPUT = "false"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Terraform Version') {
            steps {
                sh 'terraform version'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir('terraform') {
                    sh 'terraform fmt -check'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to deploy the infrastructure?',
                      ok: 'Deploy'

                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Deployment Output') {
            steps {
                dir('terraform') {
                    sh 'terraform output'
                    sh 'terraform output website_url'
                }
            }
        }
    }

    post {

        success {
            echo 'Terraform deployment completed successfully.'
        }

        failure {
            echo 'Terraform deployment failed. Check the console output.'
        }

        always {
            echo 'Pipeline finished.'
        }
    }
}
