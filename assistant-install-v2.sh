#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá usuário, serei seu assistente para instalação do Projeto Quatro!"
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Antes de iniciar, tenho uma pergunta:"
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) O diretório na qual será feito o download está em Documents (S/N)?"
read direct

if [ \"$direct\" == \"n\" ]
	then
	echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Certo, peço que leia nosso README.TXT para saber como entrar no diretório correto e inicializar as instalações."
	echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Até a próxima!"
	exit
fi

echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Muito bem, inicializaremos as instalações!"
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Verificando aqui se você possui o Java instalado..."
java --version

if [ $? -eq 0 ]
	then
	echo ""
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o java instalado em sua máquina. Vamos a instalação do Projeto Quatro..."
	sleep 2
	git clone https://github.com/AmVittor/Java
	#clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalação realizada com sucesso!"
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Executando o projeto..."
	sudo apt install default-jre
	sleep 2
	java -jar Quatro-1.1-SNAPSHOT-jar-with-dependencies.jar
	#clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pronto, caso deseje executar novamente, leia o README.TXT do projeto!"
else
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Adicionando o repositório..."
	sleep 2
	sudo add-apt-repository ppa:webupd8team/java -y
	#clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Atualizando! Quase lá..."
	sleep 2
	sudo apt update && sudo apt upgrade -y
	#clear 
	
if [ $VERSAO -eq 11 ]
	then
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java..."
	sleep 2
	sudo apt install default-jre -y ; apt install openjdk-11-jre -y;
	clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora, vamos instalar o projeto da QUATRO!"
	sleep 2
	git clone https://github.com/AmVittor/Java
	clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Instalação realizada com sucesso!"
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Executando o projeto..."
	sleep 2
	java -jar Quatro-1.0-SNAPSHOT-jar-with-dependencies.jar
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pronto, caso deseje executar novamente, leia o README.TXT do projeto!"
		fi
	fi
fi

echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Agora irei ver se você possui o docker instalado...;"
docker --version

if [ $? -eq 0 ]
	then
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o docker instalado!"
	else
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Opa! Não identifiquei nenhuma versão do Docker instalado, mas sem problemas, irei resolver isso agora!"
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Confirme para mim se realmente deseja instalar o Docker (S/N)?"
	read inst

if [ \"$inst\" == \"s\" ]
	then
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você escolheu instalar o Docker ;D"
	sleep 2
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Confirme a instalação quando for solicitado."
	sleep 2
	sudo apt install docker.io
	sudo apt install docker-compose
	clear
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Configurando! Quase lá."
	sleep 2
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo usermod -aG docker $USER
	sudo service docker restart
	sleep 2
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pronto! Docker instalado com sucesso."
else 	
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você optou por não instalar o Docker por enquanto, até a próxima então!"
	fi
fi

if [ -d javadocker/ ];
then
	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora, vamos dar um pull no arquivo."
	cd javadocker; 
	git pull;
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora, vamos clonar o repositório."
	 git clone https://github.com/luizekstein/javadocker.git;
	cd javadocker;
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pronto! Irei criar seu container para executar o mesmo."
	sleep 5
	sudo docker-compose up -d --build;
	sleep 5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Container criado com sucesso! Vamos entrar nele agora."
	sudo docker exec -it java-docker bash;

else 
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Agora, vamos clonar o repositório."
	 git clone https://github.com/luizekstein/javadocker.git;
	sleep 5
	cd javadocker
	sleep 5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Pronto! Irei criar seu container para executar o mesmo."
	sleep 5
	sudo docker-compose up -d --build;
	sleep 5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Container criado com sucesso! Vamos entrar nele agora."
	sudo docker exec -it java-docker bash;
fi