pipeline {
    agent { label 'ubuntu-agent2' }

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
    }

    stages {

        /* ------------------ 1. CLONE REPO ------------------ */
        stage('Clone Repo') {
            steps {
                echo "Cloning repository ${params.BRANCH_NAME}"
                git(
                    branch: params.BRANCH_NAME,
                    credentialsId: 'sivanunna9',
                    url: 'git@github.com:sivanunna9/yashikakart.git'
                )
            }
        }

        /* ------------------ 2. BUILD JAVA ------------------ */
        stage('Build') {
            steps {
                echo "Building Java project..."
                script {
                    def mvnHome = tool name: 'M3', type: 'maven'
                    sh "${mvnHome}/bin/mvn clean install -DskipTests"
                }
            }
        }

        /* ------------------ 3. BUILD DOCKER IMAGE ------------------ */
        stage('Build-Docker-Image') {
            steps {
                echo "Building Docker image..."
                script {
                    sh "sudo ls -l /var/run/docker.sock"
                    def dockerImage = "ekart:${env.BUILD_NUMBER}"
                    sh "sudo docker build -t ${dockerImage} ."
                }
            }
        }

        /* ------------------ 4. RUN DOCKER CONTAINER ------------------ */
        stage('Run-Docker-Container') {
            steps {
                echo "Running Docker container..."
                script {

                    def dockerImage = "ekart:${env.BUILD_NUMBER}"
                    def containerName = "ekart-app"

                    sh '''
                        echo "Checking for old container..."
                        if sudo docker ps -aq -f name=ekart-app | grep -q .; then
                            echo "Old container found — stopping & removing..."
                            sudo docker stop ekart-app || true
                            sudo docker rm ekart-app || true
                        else
                            echo "No existing container found."
                        fi
                    '''

                    sh """
                        echo "Deleting old images except current..."
                        CURRENT_ID=\$(sudo docker images -q ${dockerImage})
                        for IMG in \$(sudo docker images -q ekart); do
                            if [ "\$IMG" != "\$CURRENT_ID" ]; then
                                echo "Removing old image: \$IMG"
                                sudo docker rmi -f \$IMG || true
                            fi
                        done
                    """

                    sh """
                        sudo docker run -d --name ${containerName} -p 8083:8080 ${dockerImage}
                    """
                }
            }
        }

        /* ------------------ 5. SIMPLE SANITY TEST ------------------ */
        stage('Run sanity tests') {
            steps {
                echo "Running sanity tests..."
                sh "curl -I http://localhost:8083 || true"
            }
        }

        /* ------------------ 6. INSTALL TRIVY ------------------ */
        stage('Install Trivy') {
            steps {
                echo "Installing Trivy..."
                sh '''
                    sudo apt-get update -y
                    sudo apt-get install wget apt-transport-https gnupg lsb-release -y

                    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
                    echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list

                    sudo apt-get update -y
                    sudo apt-get install trivy -y
                '''
            }
        }

        /* ------------------ 7. TRIVY SCAN ------------------ */
        stage('Trivy Scan') {
            steps {
                script {
                    def dockerImage = "ekart:${env.BUILD_NUMBER}"

                    echo "Running Trivy scan and saving result to scan-output.txt"

                    sh """
                        sudo trivy image --severity HIGH,CRITICAL ${dockerImage} > scan-output.txt 2>&1 || true
                    """

                    sh "echo 'Trivy output saved. File contents:' && head scan-output.txt"
                }
            }
        }

        /* ------------------ 8. GENERATE CLEAN HTML REPORT ------------------ */
        stage('Generate HTML Report') {
            steps {
                script {
                    echo "Converting vulnerability scan to clean HTML..."

                    def inputFile = "scan-output.txt"
                    def outputFile = "vulnerability-report.html"

                    def raw = readFile(inputFile)

                    // CLEAN UNICODE & BOX DRAWING CHARACTERS → ASCII
                    def cleaned = raw
                        .replaceAll(/[\u2500-\u257F]/, '-')       // horizontal borders
                        .replaceAll(/[│┃║]/, '|')                 // vertical lines
                        .replaceAll(/[┌┐└┘├┤┬┴┼]/, '+')           // corners/junctions
                        .replaceAll(/[^\x00-\x7F]/, '')           // remove non ASCII chars
                        .replaceAll(/ +/, ' ')                    // extra spacing cleanup

                    // BUILD HTML
                    def html = """
                        <html>
                        <head>
                            <title>Vulnerability Report</title>
                            <style>
                                body { font-family: Arial; margin: 20px; }
                                pre {
                                    background: #1e1e1e;
                                    color: #00ff00;
                                    padding: 15px;
                                    border-radius: 10px;
                                    font-size: 14px;
                                    overflow-x: auto;
                                    white-space: pre-wrap;
                                }
                            </style>
                        </head>
                        <body>
                            <h2>Dependency Vulnerability Report</h2>
                            <pre>${cleaned}</pre>
                        </body>
                        </html>
                    """

                    writeFile file: outputFile, text: html

                    echo "HTML report generated: ${outputFile}"
                }
            }
        }

        /* ------------------ 9. PUSH DOCKER IMAGE ------------------ */
        stage('Push-Docker-Image') {
            steps {
                echo "Pushing Docker image..."
                script {
                    def dockerImage = "ekart:${env.BUILD_NUMBER}"
                    def remoteImage = "dockerkishore123/ekart:${env.BUILD_NUMBER}"

                    sh "sudo docker tag ${dockerImage} ${remoteImage}"
                    sh "sudo docker push ${remoteImage}"
                }
            }
        }

        /* ------------------ 10. PUBLISH ARTIFACTS ------------------ */
        stage('Publish Artifacts') {
            steps {
                echo "Archiving raw and HTML reports..."
                archiveArtifacts artifacts: 'scan-output.txt, vulnerability-report.html', fingerprint: true
            }
        }

       
        /* ------------------ 11B. SONARQUBE ANALYSIS (Maven) ------------------ */
stage('SonarQube Analysis (Maven)') {
    steps {
        script {
            def mvnHome = tool name: 'M3', type: 'maven'
            withSonarQubeEnv('Sonar-Server') {
                sh "${mvnHome}/bin/mvn clean verify sonar:sonar"
            }
        }
    }
}

/* ------------------ 12. SONARQUBE QUALITY GATE ------------------ */
stage('Quality Gate') {
    steps {
        timeout(time: 2, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }
}
    }
}