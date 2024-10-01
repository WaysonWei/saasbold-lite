pipeline {
    agent any
    environment {
        HOME = '.'
    }
    tools {nodejs "node"}
    
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('App Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Docker Build and Push') {
        agent any
            steps {
                script {
                    /* Build the container image */            
                    def dockerImage = docker.build("beos2020/saasbold2:latest")

                    /* Push the container to the docker Hub */
                    dockerImage.push()
                }
            }
        }
    }   
}
