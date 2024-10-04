
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS

' Dimensões da bola


' Tamanho da janela e metade do ecrã para VR
DIM shared half_width AS INTEGER = 160 ' Metade do ecrã para VR
DIM shared height AS INTEGER = 200



' Loop principal

DO
    SCREENlock()
    line(160,0)-(160,200),15
    line(70,50)-(90,150),15,b
    paint(80,100),15
    line(70+160,50)-(90+160,150),15,b
    paint(80+160,100),15
    SCREENunlock()
    SLEEP 200

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()