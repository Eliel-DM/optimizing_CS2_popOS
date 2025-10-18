# Otimização & Configurações CS2 no Pop!_OS

**Descrição:**  
Scripts e configurações para otimização do Pop!_OS visando melhorar a performance do **Counter-Strike 2**.
---

## 1. Script de criação de resolução personalizada

### Objetivo
O script permite criar uma resolução personalizada para o seu monitor com a **taxa de Hertz desejada**, adicionando-a como uma opção disponível no sistema. Isso é útil para jogos como o **CS2**, que podem se beneficiar de resoluções e taxas de atualização específicas para melhorar a performance e a fluidez.

> ⚠️ **Atenção:** Use resoluções e taxas de atualização que o seu monitor suporte. Valores incorretos podem causar instabilidade ou falha na exibição.

### Script criação de resolução: `ceatedMyPersonalResolution.sh`

1. **Início do script**
```bash
printf " ----START SCRIPT RESOLUTION---- \n"
```

2. **Definição do monitor**
```bash
MONITOR="HDMI-A-0"
printf "O nome do monitor a ser utilizado é o: $MONITOR \n"
```
- É possível identificar o nome correto do monitor usando:
```bash
xrandr
```

3. **Criação da nova resolução**
```bash
xrandr --newmode "1024x768_100.00" 112.25 1024 1096 1200 1376 768 771 775 816 -hsync +vsync 2>/dev/null
printf "RESOLUÇÃO CRIADA \n"
```

4. **Adição da resolução ao monitor**
```bash
xrandr --addmode $MONITOR "1024x768_100.00" 2>/dev/null
printf "RESOLUÇÃO ADICIONADA AO MONITOR \n ----END SCRIPT RESOLUTION---- \n"
```

5. **Aplicação opcional da resolução**
```bash
#xrandr --output $MONITOR --mode "1024x768_100.00"
```

---

## 2. Script de otimização de hardware: `optimizePersonalHardware.sh`

- Atualização de sistema e drivers Mesa/Vulkan
- Configuração de GameMode e MangoHud
- CPU em modo performance
- Instalação do Proton-GE mais recente

O objetivo é deixar o sistema preparado para rodar **CS2** de forma otimizada no Linux.

> ⚠️ **Atenção:** Ajuste as configurações conforme seu hardware. Este script foi testado com AMD RX 580 + Ryzen 5500.

### Passo a passo do script

1. **Atualização geral do sistema**
```bash
sudo apt update && sudo apt full-upgrade -y
```

2. **Instalação de drivers Vulkan/Mesa**
```bash
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt update && sudo apt install -y \
  mesa-vulkan-drivers \
  mesa-vulkan-drivers:i386 \
  vulkan-tools \
  libvulkan1 \
  vulkan-utils
```

3. **Instalação do GameMode e MangoHud**
```bash
sudo apt install -y gamemode mangohud libgamemode0 libgamemodeauto0
```

4. **Configuração de CPU em modo performance**
```bash
sudo apt install -y cpufrequtils
sudo cpufreq-set -r -g performance
sudo systemctl enable gamemoded
```

5. **Instalação do Proton-GE**
```bash
mkdir -p ~/.steam/root/compatibilitytools.d
cd ~/.steam/root/compatibilitytools.d
LATEST=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest \
  | grep "browser_download_url" | grep "tar.gz" | cut -d '"' -f 4)
wget -q "$LATEST" -O Proton-GE.tar.gz
tar -xvf Proton-GE.tar.gz && rm Proton-GE.tar.gz
```

6. **Teste do GameMode**
```bash
gamemoded -t || echo "⚠️ Algo deu errado com o GameMode, verifique logs."
```

7. **Mensagem final**
```bash
echo "✅ Otimização concluída!"
```

### Como usar o script
```bash
chmod +x optimizePersonalHardware.sh
./optimizePersonalHardware.sh
```

> Após a execução, reinicie o sistema para que todas as alterações tenham efeito.

---

## 3. Opções de inicialização CS2

Abaixo estão as opções de inicialização recomendadas para CS2 no Linux com hardware AMD (RX 580 + Ryzen 5500):

```bash
gamemoderun PROTON_NO_ESYNC=0 PROTON_NO_FSYNC=0 DXVK_ASYNC=1 RADV_PERFTEST=aco %command% -novid -nojoy -high +fps_max 400 +cl_forcepreload 1 -threads 6 -fullscreen -w 1024 -h 768 -refresh 100
```

### Explicação detalhada das opções

| Opção | Função |
|-------|--------|
| `gamemoderun` | Ativa o **GameMode**, otimizando CPU e GPU durante o jogo. |
| `PROTON_NO_ESYNC=0` | Permite **Esync** no Proton, reduzindo stutter. |
| `PROTON_NO_FSYNC=0` | Permite **Fsync**, melhor compatibilidade com kernels recentes. |
| `DXVK_ASYNC=1` | Reduz stutter e melhora a performance de shaders no **DXVK/Vulkan**. |
| `RADV_PERFTEST=aco` | Usa compilador **ACO** da AMD para melhor performance em RX 580. |
| `%command%` | Placeholder obrigatório da Steam para o comando do jogo. |
| `-novid` | Pula os vídeos de introdução. |
| `-nojoy` | Desativa suporte a joystick para liberar CPU. |
| `-high` | Define prioridade elevada do processo. |
| `+fps_max 400` | Limita o FPS máximo para 400. |
| `+cl_forcepreload 1` | Carrega assets antecipadamente para reduzir stutter. |
| `-threads 6` | Define o número de threads da CPU (Ryzen 5500). |
| `-fullscreen` | Força o jogo a abrir em **tela cheia**. |
| `-w 1024 -h 768` | Define a resolução do jogo para 1024x768 (4:3). |
| `-refresh 100` | Força a taxa de atualização para 100 Hz. |

> 💡 **Dica:** Ajuste `-threads` e `-refresh` conforme o seu hardware e monitor para obter o melhor desempenho.

### Observações finais

- Abra a Steam e configure: Configurações -> SteamPlay -> Selecione Proton-GE como padrão.
- Sempre verifique se o seu monitor suporta a resolução e a taxa de atualização antes de aplicar.
- Combine essas opções de inicialização com os scripts de resolução e otimização para obter o máximo desempenho no CS2 no Pop!_OS.