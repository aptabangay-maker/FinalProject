pipeline {
    agent any

    environment {
        PATH = "C:\\Program Files\\Git\\bin;C:\\Program Files\\Git\\usr\\bin;${env.PATH}"
    }

    stages {
        stage('Build & Test') {
            steps {
                sh 'mvn.cmd clean test || mvn clean test'
            }
        }

        stage('Package Application') {
            steps {
                sh 'mvn.cmd clean package -DskipTests || mvn clean package -DskipTests'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                sh 'docker build -t hello-world:latest .'
                sh 'docker run --rm hello-world:latest'
            }
        }

        stage('System Maintenance') {
            steps {
                sh 'bash system_maintenance.sh'
            }
        }
    }
}
