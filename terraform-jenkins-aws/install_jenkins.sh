#!/bin/bash
echo Step:1 Add Jenkins Repository
yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
echo Step:2 Install Jenkins and Java
yum install jenkins java-1.8.0-openjdk -y
echo Step:3 Start and Enable Jenkins Service
systemctl start jenkins
systemctl enable jenkins
sudo chmod 777 /var/lib/jenkins/jenkins.war
sudo java -jar /var/lib/jenkins/jenkins.war
echo Step:4 install Firewall
sudo yum install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
echo Step:5 Open the ports 80 and 8080 in OS firewall.
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload

