pipeline {
    agent any

    environment {
        IMAGE_NAME = 'palindrome-app'
    }

    stages {

        stage('Compile Java') {
            steps {
                sh 'javac Palindrome.java'
            }
        }

        stage('Run Program') {
            steps {
                sh 'java Palindrome'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}