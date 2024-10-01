' Configura a janela no modo gráfico 320x200 com 256 cores
SCREEN 13
COLOR 15, 0 ' Texto branco, fundo preto
CLS

' Texto a ser exibido
DIM shared texto AS STRING
texto = "FreeBasic "

' Variáveis para posição do texto
DIM shared texto_x AS INTEGER = 320 ' Começa fora da tela à direita
DIM shared texto_y AS INTEGER = 100 ' Altura do texto (meio do ecrã)

DIM shared half_width AS INTEGER = 160 ' Metade do ecrã

' Loop principal
DO
    ' Limpa a tela
    CLS
    
    ' Exibe o texto no lado esquerdo (realidade virtual)
    LOCATE texto_y / 8, (texto_x \ 8) + 1
    PRINT texto
    
    ' Exibe o texto no lado direito (realidade virtual), deslocado
    LOCATE texto_y / 8, ((texto_x + half_width) \ 8) + 1
    PRINT texto

    ' Move o texto para a esquerda
    texto_x -= 1
    
    ' Quando o texto sair completamente da tela, reinicia do lado direito
    IF texto_x + LEN(texto) * 8 < 0 THEN
        texto_x = 320
    END IF

    ' Pausa para suavizar a animação
    SLEEP 20
    
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc

