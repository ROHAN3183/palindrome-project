pipeline {
    agent any

    environment {
        IMAGE_NAME = 'rohan65/palindrome-app'
        KUBECONFIG = 'C:\\ProgramData\\Jenkins\\.kube\\config'
    }

    stages {

        stage('Compile Java') {
            steps {
                bat 'javac Palindrome.java'
            }
        }

        stage('Run Program') {
            steps {
                bat 'java Palindrome'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        // 🔴 THIS IS THE IMPORTANT PART
        stage('Docker Login + Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-cred',   // 👈 use your ID
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    bat 'docker login -u %USER% -p %PASS%'
                    bat 'docker push %IMAGE_NAME%'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}