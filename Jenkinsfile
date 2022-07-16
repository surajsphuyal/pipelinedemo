pipeline {
  environment {
    repo = "surajphuyal/pipelinedemo"
  }
  agent any
  stages {
    stage('Install Docker') {
      steps {
        sh 'ansible-playbook Ansible/dockerinstall.yaml'
      }
    }
    stage('Deploy Container') {
      steps {
        sh 'ansible-playbook Ansible/deploycontainer.yaml -e "image_name=$repo image_tag=v3"'
      }
    }
    
    
  }
}
