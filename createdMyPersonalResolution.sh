
#Criar uma resolução personalizada com a taxa de Hertz desejada. (Cuidado para não criar com resoluções e taxas que o monitor não suporte).

#Aqui se tu for criar uma resolução personalizada precisa utilizar o xrandr para ver o nome do seu monitor e qual caso tenha mais de um.
MONITOR="HDMI-A-0" 

#Vai criar a nova resolução com o hz desejado adicionar ao monitor desejado
xrandr --newmode "1024x768_100.00" 112.25 1024 1096 1200 1376 768 771 775 816 -hsync +vsync 2>/dev/null
xrandr --addmode $MONITOR "1024x768_100.00" 2>/dev/null

#Deixei ativo para setar no linux por padrão a taxa de 100hz qnd for jogar
#xrandr --output $MONITOR --mode "1024x768_100.00"

