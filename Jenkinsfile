pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sekarfeb/jenkinsdemo.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
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
