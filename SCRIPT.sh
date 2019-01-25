# update do apt
yes | apt-get update

# upgrade do sistema
yes | apt-get upgrade

# instalação do meu terminal favorito
yes | apt-get install guake

# instalação do Oracle Java 8
yes | apt-get purge openjdk*
yes | add-apt-repository ppa:webupd8team/java
yes | apt-get update
yes | apt-get install oracle-java8-installer

# instalação do Nodejs e NPM
