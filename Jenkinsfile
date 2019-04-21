pipeline {
  agent none
  stages {
    stage('Build') {
      steps {
        sh 'sh "mvn -f complete/pom.xml -B -DskipTests clean package"'
      }
    }
    stage('Test') {
      steps {
        sh 'sh "mvn -f complete/pom.xml test"'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh '''sh "mv complete/target/gs-spring-boot-*.jar ./data"

dockerImage = docker.build("spring-boot-docker-image")'''
      }
    }
    stage('Publish Docker Image') {
      steps {
        sh '''echo "Docker Image Tag Name: ${dockerImageTag}"
sh "docker login -u admin -p admin123 ${dockerRepoUrl}"
sh "docker tag ${dockerImageName} ${dockerImageTag}"
sh "docker push ${dockerImageTag}"'''
      }
    }
  }
  environment {
    dockerImage = ''
    dockerRepoUrl = '639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository'
    dockerImageName = 'spring-boot-docker-image'
    dockerImageTag = '${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}'
  }
}