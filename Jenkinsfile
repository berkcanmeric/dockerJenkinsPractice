pipeline {
    agent any

    stages {
        stage('Initialize'){
            steps {
                script {
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }
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
