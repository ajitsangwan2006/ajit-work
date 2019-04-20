pipeline {
    // holds reference to docker image
    def dockerImage
    // ip address of the docker private repository(nexus)

    def dockerRepoUrl = "639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository"
    def dockerImageName = "spring-boot-docker-image"
    def dockerImageTag = "${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}"
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
        stage('Build Docker Image') {
            steps {
                sh "mv complete/target/gs-spring-boot-*.jar ./data"
                sh 'cd complete'
                dockerImage = docker.build("spring-boot-docker-image")
            }
        }
        stage('Publish Docker Image') {
            steps {
                echo "Docker Image Tag Name: ${dockerImageTag}"
                sh "docker login -u admin -p admin123 ${dockerRepoUrl}"
                sh "docker tag ${dockerImageName} ${dockerImageTag}"
                sh "docker push ${dockerImageTag}"
            }
        }
    }
}
