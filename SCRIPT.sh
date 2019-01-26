#Pegar as informações de usuário
read -p 'DIGITE O NOME DE USUÁRIO PARA A CONFIGURAÇÃO: ' usuario

# update do apt
yes | apt-get update

# upgrade do sistema
yes | apt-get upgrade

# Pacotes básicos
yes | apt-get install build-essential xz-utils curl apt-utils git

# Kernel headers
yes | apt-get install linux-headers-$(uname -r)

# instalação do meu terminal favorito
yes | apt-get install guake

# instalação do Oracle Java 8
yes | apt-get purge openjdk*
yes | add-apt-repository ppa:webupd8team/java
yes | apt-get update
yes | apt-get install oracle-java8-installer

# instalação do Nodejs e NPM
mkdir /usr/local/bin/node
cd /usr/local/bin/node
curl https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz --output node.tar.xz
tar -Jxxvf node.tar.xz
rm node.tar.xz
cp node-v10.15.0-linux-x64/* . -R
chown $usuario * -R
echo 'export PATH="$PATH:/usr/local/bin/node/bin"' >> /home/$usuario/.profile
export PATH="$PATH:/usr/local/bin/node/bin"
npm install -g npm

# Docker
cd /$usuario/Downloads
curl get.docker.com -Lo - | sh
usermod -aG docker $usuario
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#VSCode
curl https://az764295.vo.msecnd.net/stable/61122f88f0bf01e2ac16bdb9e1bc4571755f5bd8/code_1.30.2-1546901646_amd64.deb --output vscode.deb
dpkg -i vscode.deb