def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]

pipeline {

    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    environment {
        //Credentials for Prod environment
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('SCM checkout') {
            steps {
                echo 'cloning code base to jenkins server'
                echo 'testing CI code base with jenkins server'
                git branch: 'main', credentialsId: 'be2f769a-7507-4e41-9c3f-1bb0d303e73a', url: 'https://github.com/wokia23/rowac-tf-infra.git'
                sh 'ls'
            }
        }
        
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Linting with tflint') {
            steps {
                sh 'tflint --init'
                sh 'tflint'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('terraform action to apply or destroy plan') {
            steps {
                sh 'terraform ${action} --auto-approve'
            }
        }
    }

     post {
        always {
            echo 'sending build result'
            slackSend channel: "#devops-personal", color: COLOR_MAP[currentBuild.currentResult], message: "Build Started by wokia: ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
        }
    }
}


