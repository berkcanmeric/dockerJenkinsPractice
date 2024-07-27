pipeline {
    agent any

    environment {
        // Set Docker home if needed; ensure 'myDocker' is a valid tool configuration
        DOCKER_HOME = tool name: 'myDocker', type: 'DockerTool' // Change to correct tool type if needed
    }

    stages {
        stage('Initialize') {
            steps {
                script {
                    // Update PATH environment variable for Docker
                    env.PATH = "${env.DOCKER_HOME}/bin:${env.PATH}"
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    docker.build('my-web-app')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run Docker container
                    docker.image('my-web-app').run('-d -p 8080:3000')
                }
            }
        }
    }
}
