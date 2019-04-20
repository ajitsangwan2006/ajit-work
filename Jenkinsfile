pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -f complete/pom.xml -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn -f complete/pom.xml test'
            }
        }
        stage('Deliver') {
            steps {
                sh 'java -jar complete/target/gs-spring-boot-0.1.0.jar'
            }
        }
    }
}
