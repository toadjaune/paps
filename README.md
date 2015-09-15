Installation :
- Installer rvm (https://rvm.io/rvm/install)
  - Ne pas oublier de bien ajouter `source ~/.rvm/scripts/rvm` à votre .bashrc
- Se déplacer dans le dépôt, et faire ce que rvm dit jusqu'à ce qu'il arrête de gueuler
* Pour la suite, bien rester dans le dossier du dépôt
- gem install bundler
- sudo apt-get install mysql-server libmysqlclient
- bundle install
- configurer config/database.yml


Commandes utiles :

- rails server -> Lance le serveur web sur le port 3000
- bundle install : à lancer à chaque changement de gems
- rake db:migrate : à lancer à chaque changement de structure de bdd
