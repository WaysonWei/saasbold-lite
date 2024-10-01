pipeline {
    agent {
        kubernetes {
            yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          volumes:
            - name: build-cache
              persistentVolumeClaim: 
                claimName: build-cache
          serviceAccountName: jenkins-agents
          containers:
         - name: docker
            image: myreg/docker:1
            volumeMounts:
            - name: build-cache
              mountPath: /var/lib/docker
              subPath: docker
            command:
            - cat
            tty: true
            securityContext:
              privileged: true
       '''
        }
    }
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
