pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Package Application') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                sh 'DOCKER_BUILDKIT=0 docker build -t hello-world:latest .'
                sh 'docker run --rm hello-world:latest'
            }
        }

        stage('System Maintenance') {
            steps {
                sh 'chmod +x system_maintenance.sh'
                sh './system_maintenance.sh'
            }
        }
    }
}
