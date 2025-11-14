pipeline {
    agent { label 'ubuntu-agent2' }

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
    }

    stages {

        stage('Clone Repo') {
            steps {
                echo "Cloning repository ${params.BRANCH_NAME}"
                git branch: params.BRANCH_NAME,
                    changelog: false,
                    credentialsId: 'sivanunna9',
                    poll: false,
                    url: 'git@github.com:sivanunna9/yashikakart.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building Java project..."
                script {
                    def mvnHome = tool name: 'M3', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean install"
                }
            }
        }

        stage('Build-Docker-Image') {
            steps {
                echo "Building Docker image with sudo..."
                script {
                    sh "sudo ls -l /var/run/docker.sock"

                    def dockerImage = "ekart:${env.BUILD_NUMBER}"

                    sh "sudo docker build -t ${dockerImage} ."
                }
            }
        }

        stage('Run-Docker-Container') {
            steps {
                echo "Running Docker container with sudo..."
                script {

                    def dockerImage = "ekart:${env.BUILD_NUMBER}"
                    def containerName = "ekart-app"

                    // Stop & remove old container if exists
                    sh """
                        if [ \$(sudo docker ps -aq -f name=${containerName}) ]; then
                            echo "Old container found — stopping & removing..."
                            sudo docker stop ${containerName} || true
                            sudo docker rm ${containerName} || true
                        else
                            echo "No existing container found."
                        fi
                    """

                    // Start new container
                    sh """
                        sudo docker run -d --name ${containerName} -p 8083:8080 ${dockerImage}
                    """
                }
            }
        }
    }
}
