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
          sh "mvn -f complete/pom.xml package"
        }
      }
    }
  }
}