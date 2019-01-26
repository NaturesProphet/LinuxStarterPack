# Linux Starter Pack
Um script bash para ser executado após uma formatação limpa do sistema, para reinstalar automagicamente todos os principais pacotes que utilizo no meu set-up de desenvolvimento.

## Modo de usar

Abra um terminal, navegue até a pasta onde vc clonou esse repositório e execute esses dois comandos:

```bash
chmod +x script.sh
sudo ./script.sh
```
Digite o seu nome de usuário do Linux e vá tomar um café enquanto o script trabalha.

## Compatibilidade
Este script se baseia muito no gerenciador de pacotes APT, então o ideal é utiliza-lo em distribuições baseadas em debian/ubuntu (Desenvolvi o script no Linux Mint)

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
maven
ant
gradle
oracle-java8-installer
node + npm
modulo typescript global (npm)
Docker
VSCode
Postman
DBeaver
Eclipse
Umbrello
Nestjs Framework
sonar-scanner
```

