pipeline {
    agent { label 'ubuntu-agent2' }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'master', description: 'Branch to build')
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning repository ${params.BRANCH_NAME}"
                git branch: params.BRANCH_NAME, changelog: false, credentialsId: 'sivanunna9', poll: false, url: 'git@github.com:sivanunna9/yashikakart.git'
            }
        }
        stage('Build') {
            
            steps {
                echo "Building branch ${params.BRANCH_NAME}"
                script {
                    def mvnHome = tool name: 'M3', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean install"
                }
            }
        }
        stage('Build-Docker-Image') {
            steps {
                echo "Building Docker image for branch ${params.BRANCH_NAME}"
                script {
                    // Ensure Docker socket is available in Jenkins agent container
                    sh "ls -l /var/run/docker.sock"
                    def dockerImage = "ekart:${params.BUILD_NUMBER}"
                    sh "docker build -t ${dockerImage} ."
                }
            }
        }
    }
}