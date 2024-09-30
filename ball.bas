
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS

' Dimensões da bola
DIM shared ball_x AS INTEGER = 20
DIM shared ball_y AS INTEGER = 100
DIM shared ball_dx AS INTEGER = 2
DIM shared ball_dy AS INTEGER = 2
DIM shared radius AS INTEGER = 10

' Tamanho da janela e metade do ecrã para VR
DIM shared half_width AS INTEGER = 160 ' Metade do ecrã para VR
DIM shared height AS INTEGER = 200

' Função para desenhar a bola
SUB DrawBall(x AS INTEGER, y AS INTEGER, r AS INTEGER, colors AS INTEGER)
    CIRCLE (x, y), r, colors
END SUB

' Função para limpar a bola anterior
SUB ClearBall(x AS INTEGER, y AS INTEGER, r AS INTEGER)
    CIRCLE (x, y), r, 0 ' Desenha uma bola preta para limpar
END SUB

' Função para atualizar a posição da bola
SUB UpdateBall
    ball_x = ball_x + ball_dx
    ball_y = ball_y + ball_dy

    ' Verifica colisões com os limites do ecrã
    IF ball_x - radius <= 0 OR ball_x + radius >= half_width THEN
        ball_dx = -ball_dx
    END IF
    IF ball_y - radius <= 0 OR ball_y + radius >= height THEN
        ball_dy = -ball_dy
    END IF
END SUB

' Loop principal

DO
    ' Limpa as bolas anteriores
    ClearBall(ball_x, ball_y, radius)
    ClearBall(ball_x + half_width, ball_y, radius)
    line(160,0)-(160,200),15
    ' Atualiza a posição da bola
    UpdateBall

    ' Desenha a bola no lado esquerdo e direito (realidade virtual)
    DrawBall(ball_x, ball_y, radius, 15) ' Lado esquerdo
    DrawBall(ball_x + half_width, ball_y, radius, 15) ' Lado direito

    ' Espera um curto período para suavizar a animação
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
