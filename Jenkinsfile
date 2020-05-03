pipeline {
    agent any 
    environment {
        registry = "ananthkannan/mywebapp"
        registryCredential = '1ae9f8ea-826b-4d2c-9a11-344647f3cdf3'
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b17870ac-fb7f-411e-8f33-574d5c8a22be', url: 'https://github.com/akannan1087/myPythonDockerRepo']]])       
            }
        }
        
    
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
         //dockerImage =  docker.build("ananthkannan/mypythonapp")
         //dockerImage.push()
        }
      }
    }
    
    stage('Upload Image') {
     steps{    
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
    
     stage('docker stop container') {
         steps {
            sh 'docker ps -f name=mypythonContainer -q | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -a -fname=mypythonContainer -q | xargs -r docker container rm'
         }
       }
       
    stage('Docker Run') {
     steps{
         script {
            dockerImage.run("-p 8096:5000 --rm --name mypythonContainer")
         }
      }
    }
  }
}
