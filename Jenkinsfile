pipeline {
  agent any

  tools {
    jdk 'jdk-8'
    maven 'mvn-3.6.3'
  }

  stages {
    stage('Build') {
      steps {
        withMaven(maven : 'mvn-3.6.3') {
          sh "mvn package"
        }
      }
    }
    stage('Docker Build') {
      steps {
        sh '/usr/local/bin/docker build -t ashokshingade24/spring-petclinic:${BUILD_NUMBER} .'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "/usr/local/bin/docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh '/usr/local/bin/docker push ashokshingade24/spring-petclinic:${BUILD_NUMBER}'
        }
      }
    }
  }
}