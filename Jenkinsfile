pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                bat 'wsl -d Ubuntu -- bash -c "cd ~/FinalProject && mvn clean test"'
            }
        }

        stage('Package Application') {
            steps {
                bat 'wsl -d Ubuntu -- bash -c "cd ~/FinalProject && mvn clean package -DskipTests"'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                bat 'wsl -d Ubuntu -- bash -c "cd ~/FinalProject && DOCKER_BUILDKIT=0 docker build -t hello-world:latest ."'
                bat 'wsl -d Ubuntu -- bash -c "docker run --rm hello-world:latest"'
            }
        }

        stage('System Maintenance') {
            steps {
                bat 'wsl -d Ubuntu -- bash -c "cd ~/FinalProject && chmod +x system_maintenance.sh && ./system_maintenance.sh"'
            }
        }
    }
}
