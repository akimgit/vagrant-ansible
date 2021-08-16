## Guide

Pour lancer le microservice Vagrant up !

# Utiliser visual studio pour visualiser les dossier sur la vm vagrant crée

Acces au dossier du server vagrant modif du ssh config

    vagrant ssh-config > some-file.txt
    Copier le contenu dans le ssh config de visual studio via f1
    Copiez le contenu some-file.txt dans le fichier de configuration SSH. 
    Ce fichier peut être modifié directement à partir de vscode en cliquant F1 et en écrivant Remote-SSH: Open Configuration File...,
    puis en sélectionnant le fichier que vous utilisez pour configurer ssh. Une fois ce fichier ouvert, 
    copiez-y simplement le contenu some-file.txt.

# Modification de la configuration de l'infrastructure
Création d'un vm docker directement instalation de tout les prerequis et 

## Problème rencontré
# Utilisateur
La création d'utilisateur est configurer de base pour vagrant et root avec le mdp vagrant.
L'ajout d'utilisateur peut se faire via ansible avec le provisionning ou en ligne de commande shell .
Toutefois l'utilisateur crée ne peut pas etre utiliser pour se connecter en ssh .

Solution envisagé: 
Utiliser par l'utilisateur vagrant ou root pour lancer les playbook

# Visual studio

L'utilisateur crée (stagiaire) ne peut pas etre utiliser pour se connecter via ssh . le ping sur l'adresse ip ce fait et réponds bien ,problème de ports?
Utilisation de visual studio via l'utilisateur vagrant.

# Réseau
La vm crée sur vagrant n'a pas la connection par pont de base ,pour ce faire on doit passer par la configuration ip .
Des problemes d'ip fixe ont eu lieu ,je n'ai pas compris aucune autre source ne partagé la meme ip .
Résolution du probleme en passant pas 192.168."1" au lieu de 192.168.0
# Lancement du playbook

Le lancement du playbook docker entraine le bug de la vm lors du lancement de nginx,un problem avec  la config vagrant 

# Utilisation d'ansible via visual studio sur windows

Je n'ai pas reussi a l'utiliser ..



## Essai 
# config.vm.provision:shell, inline: <<-SHELL
-Essai d'installer directement sur la vm lors de la création >echoué
sudo apt update
sudo apt install -y docker
sudo apt install -y docker-compose
sudo apt install -y ansible
sudo apt install -y git
sudo systemctl enable ssh

-Ajout de la cle ssh directement  ddans le dossier stagiaire pour y acceder via visual studio > echoué
      echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFJA7ZIbcjMK2K7dJblIHBRya6AZKUfiJTyJWMHezqj admin stagiaire@7720-721">id_ed25519.pub
      cp id_ed25519.pub /home/stagiaire
    
=============Un autre moyen pour ajouter le fichier deploy-docker-git.yml sur la vm Créé=============================
     echo "---
     - name: PLAY Déploiement nginx avec Ansible
       hosts: ubuntuProjet
      
       tasks:
      
         # Déclaration d'une task qui appelle le module git
         - name: Utilisation du module git pour cloner le contenu du repot git
           ansible.builtin.git:
             repo: 'https://github.com/akimgit/projet_docker_groupevert.git' 
             dest: /
    
         - name: Deploiement
           ansible.builtin.command: docker-compose up -d
           args:
             chdir: /home/stagiaire/projetFinal">playbook.yml

=================Résoudre le probleme de clavier qwerty si on souhaite ce connecter directement sur la vm===============
      
      sudo apt-get install console-data
      sudo dpkg-reconfigure console-setup


     cp -r /home/vagrant/.ssh/ /home/stagiaire/
     chown -R stagiaire:stagiaire  /home/stagiaire/.ssh
