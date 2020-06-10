pipeline {
    agent any
        environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "ananthkannan/mypython-app-may20"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {

        stage ('checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/akannan1087/myPythonDockerRepo']]])
            }
        }
       
        stage ('Build docker image') {
            steps {
                script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                //dockerImage = docker.build registry + ":$BUILD_NUMBER"

                }
            }
        }
       
         // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{   
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }

    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
   
    stage ('K8S Deploy') {
        steps {
            script {
                kubernetesDeploy(
                    configs: 'k8s-deployment.yaml',
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    )           
               
            }
        }
    }
  
    }  
}

always {
  // remove built docker image and prune system
  print 'Cleaning up the Docker system.'
  sh 'docker system prune -f'
}
