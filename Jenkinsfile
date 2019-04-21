node {

    def dockerImage
    def dockerRepoUrl = '639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository'
    def dockerImageName = 'spring-boot-docker-image'
    def dockerImageTag = '${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}'
    stage('Build') {
        sh 'mvn -f complete/pom.xml -B -DskipTests clean package'
    }
    stage('Build Docker Image') {
        sh 'mv complete/target/gs-spring-boot-*.jar ./data'

        dockerImage = docker.build("spring-boot-docker-image")
    }
    stage('Publish Docker Image') {
        echo "Docker Image Tag Name: ${dockerImageTag}"
        sh 'docker login -u admin -p admin123 ${dockerRepoUrl}'
        sh 'docker tag ${dockerImageName} ${dockerImageTag}'
        sh 'docker push ${dockerImageTag}'
    }
}