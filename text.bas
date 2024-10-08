' Configura a janela no modo gráfico 320x200 com 256 cores
SCREEN 13
COLOR 15, 0 ' Texto branco, fundo preto
CLS

' Texto a ser exibido
DIM shared texto AS STRING
texto = "FreeBasic "

' Variáveis para posição do texto
DIM shared texto_x AS INTEGER = 159 ' Começa fora da tela à direita
DIM shared texto_y AS INTEGER = 100 ' Altura do texto (meio do ecrã)

DIM shared half_width AS INTEGER = 160 ' Metade do ecrã

' Loop principal
DO
    ' Limpa a tela
    screenlock()
    CLS
    line(160,0)-(160,200)
    view  (0,0)-(159,199)
    window (0,0)-(159,199)
    ' Exibe o texto no lado esquerdo (realidade virtual)
    draw string ((texto_x) + 1, texto_y ) ,texto
    view  (159,0)-(319,199)
    window (0,0)-(159,199)
    ' Exibe o texto no lado direito (realidade virtual), deslocado
    draw string ( (texto_x) + 1, texto_y ) ,texto
    

    ' Move o texto para a esquerda
    texto_x -= 1
    
    ' Quando o texto sair completamente da tela, reinicia do lado direito
    IF texto_x + LEN(texto) * 8 < 0 THEN
        texto_x = 160
    END IF

    ' Pausa para suavizar a animação
    screenunlock()
    SLEEP 20
    view  (0,0)-(319,199)
    window  (0,0)-(319,199)
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
screenunlock()
