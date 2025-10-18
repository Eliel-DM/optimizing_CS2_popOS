
#Criar uma resolução personalizada com a taxa de Hertz desejada. (Cuidado para não criar com resoluções e taxas que o monitor não suporte).
    printf " ----START SCRIPT RESOLUTION---- \n"
    #Aqui se tu for criar uma resolução personalizada precisa utilizar o xrandr para ver o nome do seu monitor e qual, caso tenha mais de um.
        MONITOR="HDMI-A-0" 
        printf "O nome do monitor a ser utilizado é o: $MONITOR \n"

    #Vai criar a nova resolução com o hz desejado adicionar ao monitor desejado
        xrandr --newmode "1024x768_100.00" 112.25 1024 1096 1200 1376 768 771 775 816 -hsync +vsync 2>/dev/null
        printf "RESOLUÇÃO CRIADA \n"
        xrandr --addmode $MONITOR "1024x768_100.00" 2>/dev/null
        printf "RESOLUÇÃO ADICIONADA AO MONITOR \n ----END SCRIPT RESOLUTION---- \n"

#Deixei comentado pq não quero que ela seja renderizada no meu uso comum, somente fique disponível para ser utilizada no jogo.
#xrandr --output $MONITOR --mode "1024x768_100.00"

