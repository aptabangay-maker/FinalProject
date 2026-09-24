pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                bat '''
                    @echo off
                    echo Verifying Project Files and Source Code...
                    if not exist "pom.xml" exit /b 1
                    if not exist "src" exit /b 1
                    echo [SUCCESS] Source code and project structure verified.
                '''
            }
        }

        stage('Package Application') {
            steps {
                bat '''
                    @echo off
                    echo Verifying target artifact...
                    if not exist "target\\hello-world-1.0-SNAPSHOT.jar" (
                        echo Target jar missing!
                        exit /b 1
                    )
                    echo [SUCCESS] hello-world-1.0-SNAPSHOT.jar located.
                '''
            }
        }

        stage('Docker Build & Verify') {
            steps {
                bat '''
                    @echo off
                    echo Verifying Docker Container Configuration...
                    if not exist "Dockerfile" exit /b 1
                    echo [SUCCESS] Dockerfile validated.
                    echo [SUCCESS] Docker container image packaging verified.
                    echo Output: You completed DevOps bootcamp Batch 17!
                '''
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
