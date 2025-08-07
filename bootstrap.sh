#!/bin/bash

# Configurações
REPO_URL="https://github.com/lscosta90br/provisioning.git"
BRANCH="main"

# Função para instalar pré-requisitos
install_prerequisites() {
    echo "Detectando distribuição..."
    if [ -f /etc/redhat-release ]; then
        echo "Instalando para RHEL/CentOS..."
        sudo dnf install -y python3 git ansible-core || {
            echo "Falha na instalação para RHEL/CentOS"
            exit 1
        }
    elif [ -f /etc/arch-release ]; then
        echo "Instalando para Arch Linux..."
        sudo pacman -Sy --noconfirm python git ansible || {
            echo "Falha na instalação para Arch Linux"
            exit 1
        }
    elif [ -f /etc/debian_version ]; then
        echo "Instalando para Debian/Ubuntu..."
        sudo apt update && sudo apt install -y python3 git ansible || {
            echo "Falha na instalação para Debian/Ubuntu"
            exit 1
        }
    else
        echo "Distribuição não suportada"
        exit 1
    fi
}

# Função principal
main() {
    # Instala pré-requisitos
    install_prerequisites
    
    # Executa o ansible-pull
    echo "Executando ansible-pull..."
    # ansible-pull -U "$REPO_URL" -C "$BRANCH" -i localhost, playbooks/bootstrap_ansible.yml || {
    #     echo "Falha ao executar ansible-pull"
    #     exit 1
    # }
    ansible-pull -U https://github.com/lscosta90br/provisioning.git -l local || {
        echo "Falha ao executar ansible-pull"
        exit 1
    }
    echo "Configuração concluída com sucesso!"
}

# Executa a função principal
main