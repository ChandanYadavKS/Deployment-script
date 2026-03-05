# #!/bin/bash
# # USE UBUNTU20.04 - INSTANCE: 2GB RAM + 2VCPU MIN - WILL ONLY WORK
# sudo apt update -y
# sudo apt install openjdk-17-jdk -y
# sudo apt update -y
# sudo apt install maven -y
# curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
#   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
# echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#   https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#   /etc/apt/sources.list.d/jenkins.list > /dev/null
# sudo apt update -y
# sudo apt install jenkins -y
# service jenkins start
# cat /var/lib/jenkins/secrets/initialAdminPassword
# #chmod 777 jenkins.sh
# #./jenkins.sh


#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing Java..."
sudo apt install openjdk-17-jdk -y

echo "Installing wget..."
sudo apt install wget -y

echo "Downloading Jenkins..."
wget https://get.jenkins.io/war-stable/latest/jenkins.war

echo "Starting Jenkins..."
nohup java -jar jenkins.war --httpPort=8080 > jenkins.log 2>&1 &

sleep 15

echo "Jenkins started on port 8080"

echo "Jenkins URL:"
curl ifconfig.me
echo ":8080"

echo "Getting Initial Admin Password..."
cat ~/.jenkins/secrets/initialAdminPassword



----------------------------------------------------------------------------------------------------------------------
another upadted script




#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing Java..."
sudo apt install openjdk-17-jdk -y

echo "Installing Maven..."
sudo apt install maven -y

echo "Installing required tools..."
sudo apt install curl gnupg -y

echo "Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install jenkins -y

echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Jenkins Status:"
sudo systemctl status jenkins --no-pager

echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
