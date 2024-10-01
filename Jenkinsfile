pipeline {
    agent any
    environment {
        HOME = '.'
    }
    tools {nodejs "node"}
    
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
}
