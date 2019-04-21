node {

    def dockerImage
    def dockerRepoUrl = '639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository'
    def dockerImageName = 'spring-boot-docker-image'
    def dockerImageTag = '${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}'
    stage('Clone Repo') {
          git 'https://github.com/ajitsangwan2006/ajit-work.git'
        }
    stage('Build') {
        sh 'mvn -f complete/pom.xml -B -DskipTests clean package'
    }
    stage('Build Docker Image') {
        //sh 'mv complete/target/gs-spring-boot-*.jar ./data/'

        dockerImage = docker.build("spring-boot-docker-image")
    }
    stage('Publish Docker Image') {
        echo "Docker Image Tag Name: ${dockerImageTag}"
        sh 'docker login -u AWS -p eyJwYXlsb2FkIjoiZU91cTVoVTRZVk5pd09qemVkSzBWRm4yMGI4WkFXbElpRi8zelVTSWxSVlZ2Q0FTS09wNnlCTzB1dktDWVYydlE4S0hUVHlmNCtvYUpueHNRdHJ1b1laRC9ZMGVMRkwybEozcUFyQjlReUszeVVBeW9BT0NBa0lGWm1RS2pWODBKeGNLMm4wMFUwd29ZL3FZVFlpQm1hY2pzcVhkN0dmeXhJeElzV29obFBXKzNWb0E5MFZIRmFDN01KRFFuME1LWEltUm4wRWVlUjRXdWtNeTBYdTBWLzZCWkVaWnczNkx4aVU0TmNUcHpKLzFHZUQzMnJkeXYwOXR6cjd6SFZOWmxqUG5SM0RTUTdlUk0xcUQwNXF2UFZISEJ2WklIS2NsYUlwVklLWmo5VDgzelEvREJ4bjFiRHJPcWx1NkowQWd6VVJOaEN5SmtuMTh0Z3NkTmIvOEY1U053WjE0UWVJZkZnNWk2RnVNQk53YVVoTTYyZnpyNEtXb251Zmw5aWJ0VVlnUFZ1clM5c0ZTTmJHanYxQmVMVFIvc0ZWYjdvUkF2UG43US90TDQ5aTRPTzVIRkJWeHRwNlFaSTZNL0plK2JQMHd5K1BwcmNFNnhOODBBTkhPZnBNR3crUTIvY3oxSVFBb1p2K0c4SHE5Q0NnRVdvNlNReUdWbmxpbk5SNlovY0NjTURzYkR5WHlvN2Z1VmhtSjZ5dGdtNTdqWkNKdWxzajFyakl5SE5QQ3FNQnAyc0dJSXc3Wjcva1ViYjJKWUZZeXZTRVE5ckwvSmFsMThVY3NEVXpNZzJZY0IxTndrU014NWluSnhFRHhDVXVBbjN1Y0NTU0ZnQXJzTkNnYmIxdGhHSG9XZzFVQXgydldhaG9hbHpwbVZBSnQyd2NPTk5ucXNSRklnWUJBcjJhclhhdUtVcGNpeU1pSXJuVlVTQm9qNkRsdWdoRGlOVEN5d2pqNzZOVGJqR3lZWk56T013TFdNV1lSTnBQZG1uTFdyY1VhK3BUTzdET041NlM3UEI1LzZ3RWpMSWhETll4UkFtVnFXQkJhb2JLNHZ5Tjk4eGErYWhoQUlWRnlEWlV2YnJOZWpvVG5GTUY0bHh3ckZmV0g4SGZSMVNIQVlmSkd1N3BKV28vdmgzdEJjOTdad3VKdFcvWDlKSWo5WkV0S3p0K01HekJPd3ZIc3JGMTFMYmoxNGVwSC9sdU1rSnQzNjRwMkxEdjB5dm84NlZrVjVmS25YTlBsWXl1YVgzdks3WmZzdHJ6ajVFZW8xeldZZ0ptSlQwd215RHZmZkhZcWhxTFNPaWRuMHFzM3BvWG5uQ2ZCN000STNHZ3Iyb3N6Q3pMTzg2bGZmdldpKzN1aCtsa3I5TDJHMDEwQVp6RzIzWjFGaGtpcGJyRFFzRlBGc1BYdUFHWitHY2x4aWtpWHRSa3o4VDdZYlhUa2lNWDFNYUNGZVU3MzRhSDNaZXNBaDJYcmEvRFp3MzR5N2FINEViUXMvZGlGIiwiZGF0YWtleSI6IkFRRUJBSGh3bTBZYUlTSmVSdEptNW4xRzZ1cWVla1h1b1hYUGU1VUZjZTlScTgvMTR3QUFBSDR3ZkFZSktvWklodmNOQVFjR29HOHdiUUlCQURCb0Jna3Foa2lHOXcwQkJ3RXdIZ1lKWUlaSUFXVURCQUV1TUJFRURFUHhtejVPNTU2M1R4Y3RwQUlCRUlBN2FHaEU5Sm1WT1VEditsS1gyQjRhZXJnMFlYTER6bWJlRkdkSzB2UkxNVmdtZk04VWthRi9YcEVrc0t3d25sQXhGMGNuWkhTQ0dvRk9CQVk9IiwidmVyc2lvbiI6IjIiLCJ0eXBlIjoiREFUQV9LRVkiLCJleHBpcmF0aW9uIjoxNTU1ODgwODg3fQ== https://639760561846.dkr.ecr.us-east-1.amazonaws.com'
        sh 'docker tag spring-boot-docker-image 639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository:0.1.0'
        sh 'docker push 639760561846.dkr.ecr.us-east-1.amazonaws.com/docker-aws-repository:0.1.0'
    }
}