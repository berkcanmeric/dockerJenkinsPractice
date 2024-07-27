pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('my-web-app')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('my-web-app').run('-d -p 8080:3000')
                }
            }
        }
    }
}
