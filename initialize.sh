#!/bin/bash

# Atualiza o sistema e instala as dependências necessárias
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release ufw

# Adiciona a chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adiciona o repositório do Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instala o Docker e o Docker Compose
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose

# Configura o firewall para permitir tráfego na porta 25565
sudo ufw allow 25565/tcp

# Cria um usuário para rodar o servidor Minecraft
sudo adduser --disabled-password --gecos "" minecraft

# Adiciona o usuário ao grupo docker para permitir a execução do Docker sem sudo
sudo usermod -aG docker minecraft

# Define as permissões para a pasta de dados do Minecraft
sudo chown -R minecraft:minecraft ~/minecraft_server/data

echo "Inicialização concluída!"