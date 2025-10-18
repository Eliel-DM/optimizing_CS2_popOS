
# Otimização & Configurações CS2 no Pop!_OS

**Descrição:**  
Scripts e configurações para otimização do Pop!_OS visando melhorar a performance do **Counter-Strike 2**. Este repositório contém, atualmente, um script para criação de resoluções personalizadas com taxa de atualização (Hz) específica.

---

## Script de criação de resolução personalizada

### Objetivo
O script permite criar uma resolução personalizada para o seu monitor com a **taxa de Hertz desejada**, adicionando-a como uma opção disponível no sistema. Isso é útil para jogos como o **CS2**, que podem se beneficiar de resoluções e taxas de atualização específicas para melhorar a performance e a fluidez.

> ⚠️ **Atenção:** Use resoluções e taxas de atualização que o seu monitor suporte. Valores incorretos podem causar instabilidade ou falha na exibição.

---

### Passo a passo do script

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
