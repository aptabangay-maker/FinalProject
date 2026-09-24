pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                bat 'bash -c "mvn clean test"'
            }
        }

        stage('Package Application') {
            steps {
                bat 'bash -c "mvn clean package -DskipTests"'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                bat 'bash -c "docker build -t hello-world:latest . && docker run --rm hello-world:latest"'
            }
        }

        stage('System Maintenance') {
            steps {
                bat 'bash -c "chmod +x system_maintenance.sh && ./system_maintenance.sh"'
            }
        }
    }
}
