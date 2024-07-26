pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'berkcanmeric/webapp'
        // Use Jenkins credentials ID
        DOCKER_CREDENTIALS_ID = credentials('293584b5-3427-4c7f-8305-657fca791dad')
    }
    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from the GitHub repository
                git 'https://github.com/berkcanmeric/dockerJenkinsPractice.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm test'
                    }
                } 
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
    }
}