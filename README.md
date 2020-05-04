# myPythonDockerRepo
This a python based app and containerized.
you can clone - https://github.com/akannan1087/myPythonDockerRepo/.
This repo also have Jenkinsfile for automating the following:

- Automating Docker image creation
- Automating Docker image upload
- Automating Docker container provisioning

You can configure pipeline in your Jenkins instance(Docker also installed) by creating a Declarative pipeline.

Make sure you do the following:
1. Create Credentials for connecting to Docker registry
2. Create scripted pipeline using Jenkinsfile from this repo
3. Change registry per your user name = "your_username/mypython-app-may20"
4. Update your credentials ID in Pipeline you are creating.
5. Open port 8096 in Ec2 instance.
