#!/bin/bash
###################################################
###################################################
######### Script atualizado em 12/07/2019 #########
###################################################
###################################################

echo 'HORARIO DE INICIO'
timedatectl

#Pegar as informações de usuário
read -p 'DIGITE O NOME DE USUÁRIO PARA A CONFIGURAÇÃO: ' usuario
#####################################################################
# update do apt
yes | apt-get update

#####################################################################
# upgrade do sistema
yes | apt-get upgrade

#####################################################################
# Pacotes básicos
apt-get install build-essential autoconf automake software-properties-common xz-utils curl apt-utils git wget postgresql-client guake mongodb-clients sqlite3 umbrello net-tools unzip steam mysql-workbench maven ant gradle -y

#####################################################################
# Google Chrome
yes | sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt-get update
apt-get install google-chrome-stable

#####################################################################
# Kernel headers
yes | apt-get install linux-headers-$(uname -r)

#####################################################################
# instalação do Nodejs e NPM

# cd /home/$usuario/Downloads
# wget https://nodejs.org/dist/v10.16.0/node-v10.16.0.tar.gz -O node.tar.gz
# tar -zxvf node.tar.gz
# rm node.tar.gz
# cd node*
# ./configure
# make
# make install
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo "deb https://deb.nodesource.com/node_10.x bionic main" | tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node_10.x bionic main" | tee -a /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs
chown $usuario /home/$usuario/.npm -R

#####################################################################
# Nestjs Framework
npm i -g @nestjs/cli typescript

#####################################################################
# Docker
cd /$usuario/Downloads
curl get.docker.com -Lo - | sh
usermod -aG docker $usuario
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#####################################################################
#VSCode
curl https://az764295.vo.msecnd.net/stable/61122f88f0bf01e2ac16bdb9e1bc4571755f5bd8/code_1.30.2-1546901646_amd64.deb --output vscode.deb
dpkg -i vscode.deb

#####################################################################
#Postman
cd /usr/share
curl https://dl.pstmn.io/download/latest/linux64 --output postman.tar.gz
tar -zxvf postman.tar.gz
rm postman.tar.gz
chmod +x Postman/Postman
chown $usuario Postman -R
echo 'export PATH="$PATH:/usr/share/Postman"' >> /etc/profile

# Gerando o ícone do Postman
touch /usr/share/applications/Postman.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Postman.desktop
echo "Type=Application" >> /usr/share/applications/Postman.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Postman.desktop
echo "Name=Postman" >> /usr/share/applications/Postman.desktop
echo "Comment=Postman" >> /usr/share/applications/Postman.desktop
echo "Exec=/usr/share/Postman/Postman" >> /usr/share/applications/Postman.desktop
echo "Icon=/usr/share/Postman/app/resources/app/assets/icon.png" >> /usr/share/applications/Postman.desktop
echo "Terminal=false" >> /usr/share/applications/Postman.desktop
echo "Type=Application" >> /usr/share/applications/Postman.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Postman.desktop
echo "StartupNotify=true" >> /usr/share/applications/Postman.desktop

#####################################################################
#DBeaver
yes | echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
apt-get update
apt-get install dbeaver-ce -y

#####################################################################
# Eclipse
cd /usr/share
curl http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2018-12/R/eclipse-jee-2018-12-R-linux-gtk-x86_64.tar.gz --output eclipse.tar.gz
tar -zxvf eclipse.tar.gz
rm eclipse.tar.gz
chmod +x eclipse/eclipse
chown $usuario eclipse -R
echo 'export PATH="$PATH:/usr/share/eclipse"' >> /etc/profile
# Gerando o ícone do Eclipse
touch /usr/share/applications/Eclipse.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Eclipse.desktop
echo "Type=Application" >> /usr/share/applications/Eclipse.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Eclipse.desktop
echo "Name=Eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Comment=Eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Exec=/usr/share/eclipse/eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Icon=/usr/share/eclipse/icon.xpm" >> /usr/share/applications/Eclipse.desktop
echo "Terminal=false" >> /usr/share/applications/Eclipse.desktop
echo "Type=Application" >> /usr/share/applications/Eclipse.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Eclipse.desktop
echo "StartupNotify=true" >> /usr/share/applications/Eclipse.desktop

#####################################################################
# sonar-scanner
cd /usr/share
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
unzip sonar-scanner-cli-4.0.0.1744-linux.zip
rm sonar-scanner-cli-4.0.0.1744-linux.zip
chmod +x sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner
chown $usuario sonar-scanner-4.0.0.1744-linux -R
echo 'export PATH="$PATH:/usr/share/sonar-scanner-4.0.0.1744-linux/bin"' >> /etc/profile

#####################################################################
# robo 3t
cd /usr/share
wget https://download.robomongo.org/1.2.1/linux/robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
tar -zxvf robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
rm robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
chown $usuario robo3t-1.2.1-linux-x86_64-3e50a65/ -R
cd robo3t-1.2.1-linux-x86_64-3e50a65/
chmod +x bin/robo3t
chown $usuario sonar-scanner-3.3.0.1492-linux -R
echo 'export PATH="$PATH:/usr/share/robo3t-1.2.1-linux-x86_64-3e50a65/bin"' >> /etc/profile

# Gerando o ícone do robo3t
touch /usr/share/applications/Robo3t.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Robo3t.desktop
echo "Type=Application" >> /usr/share/applications/Robo3t.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Robo3t.desktop
echo "Name=Robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Comment=Robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Exec=/usr/share/robo3t-1.2.1-linux-x86_64-3e50a65/bin/robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Terminal=false" >> /usr/share/applications/Robo3t.desktop
echo "Type=Application" >> /usr/share/applications/Robo3t.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Robo3t.desktop
echo "StartupNotify=true" >> /usr/share/applications/Robo3t.desktop
#####################################################################

# DotNet Core 2.1 SDK
cd /home/$usuario/Downloads
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
yes | add-apt-repository universe
yes | apt-get install apt-transport-https
yes | apt-get update
yes | apt-get install dotnet-sdk-2.1

#####################################################################
# Heroku CLI
curl https://cli-assets.heroku.com/install.sh | sh

#####################################################################
# Android Studio
cd /usr/share
wget https://dl.google.com/dl/android/studio/ide-zips/3.4.2.0/android-studio-ide-183.5692245-linux.tar.gz
tar -zxvf android-studio-ide-183.5692245-linux.tar.gz
rm android-studio-ide-183.5692245-linux.tar.gz
cd android-studio
chmod +x bin/* -R 
echo 'export PATH="$PATH:/usr/share/android-studio/bin"' >> /etc/profile
chown $usuario /usr/share/android-studio -R
touch /usr/share/applications/AndroidStudio.desktop
echo "[Desktop Entry]" >> /usr/share/applications/AndroidStudio.desktop
echo "Type=Application" >> /usr/share/applications/AndroidStudio.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/AndroidStudio.desktop
echo "Name=Android Studio" >> /usr/share/applications/AndroidStudio.desktop
echo "Comment=Android Studio" >> /usr/share/applications/AndroidStudio.desktop
echo "Exec=/usr/share/android-studio/bin/studio.sh" >> /usr/share/applications/AndroidStudio.desktop
echo "Path=/usr/share/android-studio/bin" >> /usr/share/applications/AndroidStudio.desktop
echo "Icon=/usr/share/android-studio/bin/studio.png" >> /usr/share/applications/AndroidStudio.desktop
echo "Terminal=false" >> /usr/share/applications/AndroidStudio.desktop
echo "Type=Application" >> /usr/share/applications/AndroidStudio.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/AndroidStudio.desktop
echo "StartupNotify=true" >> /usr/share/applications/AndroidStudio.desktop

#####################################################################
echo 'HORARIO SEMI-FINAL'
timedatectl

# Os próximos pacotes necessitam de confirmação do usuário durante a execução e foram deixados por último
#####################################################################
# VirtualBox
apt-get install virtualbox virtualbox-qt virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-utils -y

#####################################################################
# instalação manual do Oracle Java 8
# Baixe manualmente o JDK e posicione-o na pasta /usr/lib/jvm para continuar

cd /usr/lib/jvm
tar -zxvf jdk-8u221-linux-x64.tar.gz
rm jdk-8u221-linux-x64.tar.gz
mv jdk-8* oracle-jdk-8
ln -s /usr/lib/jvm/oracle-jdk-8 /usr/lib/jvm/java-oracle
echo 'export PATH="$PATH:/usr/lib/jvm/java-oracle/bin"' >> /etc/profile
echo "export JAVA_HOME=/usr/lib/jvm/java-oracle" >> /etc/profile
echo "export CLASSPATH=.:/usr/lib/jvm/java-oracle/lib/tools.jar" >> /etc/profile

#####################################################################
# instalação do PDI
cd /usr
wget https://ufpr.dl.sourceforge.net/project/pentaho/Pentaho%208.2/client-tools/pdi-ce-8.2.0.0-342.zip
unzip pdi-ce-8.2.0.0-342.zip
rm pdi-ce-8.2.0.0-342.zip
chown $usuario /usr/data-integration -R
chmod +x /usr/data-integration/spoon.sh

# Gerando o ícone do PDI
touch /usr/share/applications/pdi.desktop
echo "[Desktop Entry]" >> /usr/share/applications/pdi.desktop
echo "Type=Application" >> /usr/share/applications/pdi.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/pdi.desktop
echo "Name=Pentaho Data Integration" >> /usr/share/applications/pdi.desktop
echo "Comment=PDI" >> /usr/share/applications/pdi.desktop
echo "Exec=/usr/data-integration/spoon.sh" >> /usr/share/applications/pdi.desktop
echo "Icon=/usr/data-integration/spoon.ico" >> /usr/share/applications/pdi.desktop
echo "Terminal=false" >> /usr/share/applications/pdi.desktop
echo "Type=Application" >> /usr/share/applications/pdi.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/pdi.desktop
echo "StartupNotify=true" >> /usr/share/applications/pdi.desktop

#####################################################################
# logstash
cd /usr/share/
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.2.0.tar.gz
tar -zxvf logstash-7.2.0.tar.gz
rm logstash-7.2.0.tar.gz
mv logstash-7.2.0/ logstash
chmod +x logstash/bin/ -R
chown $usuario logstash -R
echo 'export PATH="$PATH:/usr/share/logstash/bin"' >> /etc/profile
source /etc/profile
mkdir logstash/activemq
curl http://central.maven.org/maven2/org/apache/activemq/activemq-all/5.15.8/activemq-all-5.15.8.jar -o /usr/share/logstash/activemq/activemq-all-5.15.8.jar
logstash-plugin install logstash-output-jdbc
logstash-plugin install logstash-filter-json_encode
logstash-plugin install logstash-output-mongodb
logstash-plugin install logstash-input-jms
wget https://github.com/Microsoft/mssql-jdbc/releases/download/v7.0.0/mssql-jdbc-7.0.0.jre8.jar -o /usr/share/logstash/mssql-jdbc-7.0.0.jre8.jar

#####################################################################
# updates
apt-get update -y
apt-get upgrade -y
#####################################################################
# 


echo 'HORARIO FINAL'
timedatectl



##################################
# GAMBIARRAS DO PHP 
# Execute esta parte manualmente:

# cd /home/$USER/Downloads
# wget https://www.apachefriends.org/xampp-files/7.3.8/xampp-linux-x64-7.3.8-2-installer.run
# chmod +x xampp-linux-x64-7.3.8-2-installer.run
# sudo ./xampp-linux-x64-7.3.8-2-installer.run

# wget http://xdebug.org/files/xdebug-2.7.2.tgz
# tar -xvzf xdebug-2.7.2.tgz
# rm xdebug-2.7.2.tgz
# cd xdebug-2.7.2
# /opt/lampp/bin/phpize
# ./configure --with-php-config=/opt/lampp/bin/php-config
# make
# cp modules/xdebug.so /opt/lampp/lib/php/extensions/no-debug-non-zts-20180731

# editar /opt/lampp/etc/php.ini
# adicionar:
# zend_extension = /opt/lampp/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so