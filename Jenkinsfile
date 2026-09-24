pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" -lc "mvn clean test"'
            }
        }

        stage('Package Application') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" -lc "mvn clean package -DskipTests"'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" -lc "docker build -t hello-world:latest . && docker run --rm hello-world:latest"'
            }
        }

        stage('System Maintenance') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" -lc "chmod +x system_maintenance.sh && ./system_maintenance.sh"'
            }
        }
    }
}
