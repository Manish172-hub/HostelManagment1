pipeline {
    agent any

    environment {
        IMAGE_NAME = "hostelmanagement1"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }

        stage('Set up JDK and Maven') {
            steps {
                echo "Setting up Java and Maven..."
                sh 'java -version'
                sh 'mvn -version'
            }
        }

        stage('Build with Maven') {
            steps {
                echo "Building project with Maven..."
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo "Running unit tests..."
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t ${IMAGE_NAME}:latest .'
            }
        }

     
    }

    post {
        success {
            echo '✅ Build and deployment successful!'
        }
        failure {
            echo '❌ Build or deployment failed.'
        }
    }
}
