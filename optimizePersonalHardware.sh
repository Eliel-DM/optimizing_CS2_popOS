!/usr/bin/env bash
# ===========================================
# Faça a validação de qual as configurações mais fazem sentido com sua placa de vídeo /Processador.
# Hardware alvo: AMD RX 580 + Ryzen 5500
# ===========================================

echo "Iniciando otimização do sistema para CS2..."

# 1. Atualização geral do sistema
echo "Atualizando sistema..."
sudo apt update && sudo apt full-upgrade -y

# 2. Instalação de drivers e pacotes Vulkan/Mesa
echo "Instalando drivers Mesa e Vulkan..."
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt update && sudo apt install -y \
  mesa-vulkan-drivers \
  mesa-vulkan-drivers:i386 \
  vulkan-tools \
  libvulkan1 \
  vulkan-utils

# 3. GameMode + MangoHud
echo "Instalando GameMode e MangoHud..."
sudo apt install -y gamemode mangohud libgamemode0 libgamemodeauto0

# 4. Ferramentas de controle de CPU
echo "⚙️  Configurando modo performance da CPU..."
sudo apt install -y cpufrequtils
sudo cpufreq-set -r -g performance
sudo systemctl enable gamemoded

# 5. Instalar Proton-GE mais recente
echo "Instalando Proton-GE..."
mkdir -p ~/.steam/root/compatibilitytools.d
cd ~/.steam/root/compatibilitytools.d
LATEST=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest \
 | grep "browser_download_url" | grep "tar.gz" | cut -d '"' -f 4)
wget -q "$LATEST" -O Proton-GE.tar.gz
tar -xvf Proton-GE.tar.gz && rm Proton-GE.tar.gz

# 6. Testar GameMode
echo "Testando GameMode..."
gamemoded -t || echo " Algo deu errado com o GameMode, verifique logs."

# 7. Mostrar instruções finais

echo "✅ Otimização concluída!"


