pipeline {
    agent {
    docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build0') {
            steps {
                echo "sekar"
            }
        }
        stage('Build') {
            steps {
                sh 'sudo npm install'
                sh 'sudo npm run build'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh 'docker build -t your-docker-repo/react-app:latest .'
                withAWS(credentials: 'your-aws-credentials', region: 'your-aws-region') {
                    sh 'docker push your-docker-repo/react-app:latest'
                }
            }
        }
        
        stage('Deploy to EKS') {
            steps {
                withAWS(credentials: 'your-aws-credentials', region: 'your-aws-region') {
                    sh 'kubectl apply -f kubernetes/deployment.yaml'
                    sh 'kubectl apply -f kubernetes/service.yaml'
                }
            }
        }
    }
}
