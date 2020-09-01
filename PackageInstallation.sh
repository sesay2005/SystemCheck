#!/bin/bash
#Discription:Script to configure firewall
#Author:Aruna Bakarr Sesay
#Date:04-19-2017
echo "System check"
sleep 3
grep centos /etc/*release

if [ $? -eq 0 ]
then
echo "This server is centos"
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
else
echo "This server is ubuntu"
apt update -y
apt install apache2
systemctl start apache2
ufw allow 80/tcp

