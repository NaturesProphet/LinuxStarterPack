# Linux Starter Pack
Um script bash para ser executado após uma formatação limpa do sistema, para re-instalar automagicamente todos os principais pacotes que utilizo no meu set-up de desenvolvimento.

## Modo de usar

Crie um arquivo com extensão .sh e copie o conteúdo do script.sh que está neste repositório para esse arquivo, depois basta rodar esses dois comandos no terminal, no local onde você criou o arquivo:

```bash
chmod +x seuScript.sh
sudo ./seuScript.sh
```
Ao iniciar, digite o seu nome de usuário do Linux e vá tomar um café enquanto o script trabalha.

## Compatibilidade
Este script se baseia muito no gerenciador de pacotes APT, então o ideal é utiliza-lo em distribuições baseadas em debian/ubuntu (Desenvolvi o script no Linux Mint, kernel 4.15.0)

## Pacotes inclusos

__Básicos__
```bash
build-essential 
xz-utils
unzip
curl
wget
apt-utils
linux-headers
net-tools
Google Chrome Stable
```

__Virtualização Básica__
```bash
virtualbox
virtualbox-ext-pack
virtualbox-guest-additions-iso
virtualbox-guest-utils
```

__Desenvolvimento__
```bash
git
guake
postgresql-client
sqlite3
mongodb-clients
mysql-workbench
Pentaho Data Integration - PDI
maven
ant
gradle
node + npm
modulo typescript global (npm)
Docker
VSCode
Postman
DBeaver
robo3t
Heroku CLI
Terraform CLI
Eclipse
Umbrello
Nestjs Framework
sonar-scanner
DotNet Core SDK 2.1
Android Studio
Logstash
ArgoUML
```
__Jogos__
```bash
Steam
```