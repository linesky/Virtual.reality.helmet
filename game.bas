
' Configuração da tela no modo gráfico 320x200 com 256 cores
SCREEN 13
COLOR 15, 0 ' Linhas brancas, fundo preto
CLS
enum
		SC_ESCAPE     = &h01
		SC_1
		SC_2
		SC_3
		SC_4
		SC_5
		SC_6
		SC_7
		SC_8
		SC_9
		SC_0
		SC_MINUS
		SC_EQUALS
		SC_BACKSPACE
		SC_TAB
		SC_Q
		SC_W
		SC_E
		SC_R
		SC_T
		SC_Y
		SC_U
		SC_I
		SC_O
		SC_P
		SC_LEFTBRACKET
		SC_RIGHTBRACKET
		SC_ENTER
		SC_CONTROL
		SC_A
		SC_S
		SC_D
		SC_F
		SC_G
		SC_H
		SC_J
		SC_K
		SC_L
		SC_SEMICOLON
		SC_QUOTE
		SC_TILDE
		SC_LSHIFT
		SC_BACKSLASH
		SC_Z
		SC_X
		SC_C
		SC_V
		SC_B
		SC_N
		SC_M
		SC_COMMA
		SC_PERIOD
		SC_SLASH
		SC_RSHIFT
		SC_MULTIPLY
		SC_ALT
		SC_SPACE
		SC_CAPSLOCK
		SC_F1
		SC_F2
		SC_F3
		SC_F4
		SC_F5
		SC_F6
		SC_F7
		SC_F8
		SC_F9
		SC_F10
		SC_NUMLOCK
		SC_SCROLLLOCK
		SC_HOME
		SC_UP
		SC_PAGEUP
		'' &h4A unused (?)
		SC_LEFT       = &h4B
		SC_CLEAR      = &h4C
		SC_CENTER     = &h4C
		SC_RIGHT
		SC_PLUS
		SC_END
		SC_DOWN
		SC_PAGEDOWN
		SC_INSERT
		SC_DELETE
		'' &h54
		'' &h55
		'' &h56
		SC_F11        = &h57
		SC_F12
		'' &h59
		'' &h5A
		SC_LWIN       = &h5B
		SC_RWIN
		SC_MENU
		'' &h5E
		'' &h5F
		'' &h60
		'' &h61
		'' &h62
		'' &h63
		SC_ALTGR      = &h64
	end enum
' Dimensões e propriedades da plataforma (paddle)
DIM shared AS INTEGER paddle_width = 30, paddle_height = 5
DIM shared  AS INTEGER paddle_x = 145, paddle_y = 180
DIM shared  AS INTEGER paddle_speed = 4

' Dimensões e propriedades da bola
DIM shared  AS INTEGER ball_x = 20, ball_y = 100
DIM shared  AS INTEGER ball_dx = 2, ball_dy = 2
DIM shared  AS INTEGER ball_radius = 3

' Dimensões da tela
DIM shared  AS INTEGER screen_width = 320, screen_height = 200
DIM shared  AS INTEGER half_width = 160 ' Metade da tela para VR

' Função para desenhar a bola
SUB DrawBall(x AS INTEGER, y AS INTEGER, radius AS INTEGER)
    CIRCLE (x, y), radius, 15
END SUB

' Função para desenhar a plataforma
SUB DrawPaddle(x AS INTEGER, y AS INTEGER, widths AS INTEGER, height AS INTEGER)
    LINE (x, y) - (x + widths, y + height), 15, BF
END SUB

' Função para atualizar a posição da bola
SUB UpdateBall()
    ' Atualiza a posição da bola
    ball_x += ball_dx
    ball_y += ball_dy
    
    ' Verifica colisões com os limites da tela (incluindo a metade esquerda da tela)
    IF ball_x - ball_radius <= 0 OR ball_x + ball_radius >= half_width THEN
        ball_dx = -ball_dx
    END IF
    IF ball_y - ball_radius <= 0 OR ball_y + ball_radius >= screen_height THEN
        ball_dy = -ball_dy
    END IF
    
    ' Verifica colisão com a plataforma
    IF ball_y + ball_radius >= paddle_y AND ball_x >= paddle_x AND ball_x <= paddle_x + paddle_width THEN
        ball_dy = -ball_dy
    END IF
END SUB

' Função para atualizar a posição da plataforma com as teclas
SUB UpdatePaddle()
    IF MULTIKEY(SC_LEFT) AND paddle_x > 0 THEN
        paddle_x -= paddle_speed
    ELSEIF MULTIKEY(SC_RIGHT) AND paddle_x + paddle_width < half_width THEN
        paddle_x += paddle_speed
    END IF
END SUB

' Loop principal
DO
    CLS ' Limpa a tela
    line (160,0)-(160,200),15
    ' Atualiza a posição da bola e da plataforma
    UpdateBall()
    UpdatePaddle()

    ' Desenha o jogo no lado esquerdo da tela (realidade virtual)
    DrawBall(ball_x, ball_y, ball_radius)
    DrawPaddle(paddle_x, paddle_y, paddle_width, paddle_height)
    
    ' Desenha o jogo no lado direito da tela (realidade virtual)
    DrawBall(ball_x + half_width, ball_y, ball_radius)
    DrawPaddle(paddle_x + half_width, paddle_y, paddle_width, paddle_height)

    ' Espera um curto período para suavizar a animação
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar a tecla Esc
