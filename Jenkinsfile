pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: '1214', url: 'https://github.com/farhandevopss/my-react-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test -- --watchAll=false'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-react-app-image")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerImage.run('-p 5000:5000')
                }
            }
        }
    }
}

