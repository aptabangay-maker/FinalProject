pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                bat 'call mvn clean test || mvn.cmd clean test'
            }
        }

        stage('Package Application') {
            steps {
                bat 'call mvn clean package -DskipTests || mvn.cmd clean package -DskipTests'
            }
        }

        stage('Docker Build & Verify') {
            steps {
                bat 'docker build -t hello-world:latest .'
                bat 'docker run --rm hello-world:latest'
            }
        }

        stage('System Maintenance') {
            steps {
                bat '''
                    @echo off
                    echo ==============================================
                    echo Running System Maintenance Tasks...
                    echo ==============================================
                    echo Checking Disk Space:
                    wmic logicaldisk get caption, freespace, size
                    echo Cleaning temporary files...
                    del /q /f %TEMP%\\* 2>nul || ver >nul
                    echo System Maintenance Completed Successfully.
                    echo ==============================================
                '''
            }
        }
    }
}
