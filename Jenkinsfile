pipeline {
  environment {
    repo = "surajphuyal/demo"
  }
  agent any
  stages {
    stage('Docker Build') {
      steps {
        sh 'docker build -t $repo:v$BUILD_NUMBER .'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'dockeruser', passwordVariable: 'dockerpassword' )]) {
          sh "docker login -u ${env.dockeruser} -p ${env.dockerpassword}"
          sh 'docker push $repo:v$BUILD_NUMBER'
        }
      }
    }
    stage('Clean docker image') {
      steps {
        sh 'docker rmi $repo:v$BUILD_NUMBER'
      }
    }
    stage('Install Docker') {
      steps {
        sh 'ansible-playbook Ansible/dockerinstall.yaml'
      }
    }
    stage('Deploy Container') {
      steps {
        sh 'ansible-playbook Ansible/pipeline.yaml -e "image_name=$repo image_tag=v$BUILD_NUMBER"'
      }
    }
    
    
  }
}
