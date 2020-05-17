pipeline {
    agent any
    stages {
        stage('Deps') {
            steps {
	            sh 'make deps'
            }
          }
          stage('Tese') {
            steps{
              sh 'make test'
        	}
        }
    }
}
