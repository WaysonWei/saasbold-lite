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
        stage('Docker Build') {
        agent any
            steps {
                sh 'docker build -t beos2020/saasbold2:latest .'
            }
        }
        stage('Docker Push') {
        agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                sh 'docker push beos2020/saasbold2:latest'
                }
            }
        }
    }   
}
