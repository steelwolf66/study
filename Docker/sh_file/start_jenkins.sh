#/bin/bash
docker run -d -p 10240:8080 -p 10241:50000 -v /home/jenkins/jenkins_mount:/var/jenkins_home -v /etc/localtime:/etc/localtime --name myjenkins jenkins/jenkins
