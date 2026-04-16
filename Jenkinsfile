pipeline {
    agent any

    environment {
        IMAGE_NAME = 'palindrome-app'
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

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}