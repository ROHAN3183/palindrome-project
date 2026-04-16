pipeline {
    agent any

    environment {
        IMAGE_NAME = 'palindrome-app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/ROHAN3183/palindrome-project.git'
            }
        }

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