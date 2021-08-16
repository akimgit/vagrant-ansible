#!/bin/bash   
              
set -ex                            
                                   
sudo apt-get update     
echo "Mise à jour des logiciels"         
echo "=========================================Installation apache2========================="
sudo apt-get -y install apache2 
echo "=========================================Installation ansible========================="
sudo apt-get -y install ansible
echo "=========================================Installation git    ========================="
sudo apt-get -y install git
echo "=========================================Installation docker ========================="
sudo apt-get -y install docker
echo "=========================================Installation docker-compose========================="
sudo apt-get -y install docker-compose    
echo " ______________________________________ "
 