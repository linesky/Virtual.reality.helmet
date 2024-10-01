
' Configuração da janela gráfica
SCREEN 13
COLOR 15, 0 ' Branco para contornos e preto para fundo
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
' Variáveis para controlar a posição do X e do retângulo
DIM AS INTEGER x_pos = 80 ' Posição inicial do X no centro da tela (metade esquerda)
DIM AS INTEGER move_speed = 5
DIM AS INTEGER offset = 30 ' Diferença angular entre o lado esquerdo e o direito (VR)

' Função para desenhar o X em uma posição específica
SUB DrawX(x AS INTEGER, y AS INTEGER)
    LINE (0,0) - (x - 20, y - 20), 15 ' Diagonal \
    LINE (159,0) - (x +20, y - 20), 15 ' Diagonal /
    LINE (0,199) - (x - 20, y + 20), 15 ' Diagonal \
    LINE (159,199) - (x + 20, y + 20), 15 ' Diagonal /
END SUB

' Função para desenhar o quadrado sobre o X, simulando uma parede de fundo
SUB DrawSquare(x AS INTEGER, y AS INTEGER, size AS INTEGER)
    LINE (x - size, y - size) - (x + size, y + size), 15, B ' Quadrado ao redor
END SUB

' Loop principal
DO
    screenlock()
    CLS ' Limpa a tela
    line (160,0)-(160,200),15
    ' Desenha o X e o quadrado no lado esquerdo da tela (com diferença de 30 graus para o VR)
    view (0,0)-(159,199)
    window  (0,0)-(159,199)
    DrawX(x_pos, 100)
    DrawSquare(x_pos, 100, 20)
    
    ' Desenha o X e o quadrado no lado direito da tela, com deslocamento horizontal
    view (159,0)-(319,199)
    window  (0,0)-(159,199)
    DrawX(x_pos  , 100)
    DrawSquare(x_pos, 100, 20)

    ' Atualiza a posição do X com as teclas de seta esquerda e direita
    IF MULTIKEY(SC_LEFT) THEN
        x_pos -= move_speed
    ELSEIF MULTIKEY(SC_RIGHT) THEN
        x_pos += move_speed
    END IF

    ' Limites para evitar que o X saia da tela
    IF x_pos < 0 THEN x_pos = 0
    IF x_pos > 160 - 40 THEN x_pos = 160 - 40

    ' Pausa para suavizar a animação
    screenunlock()
    SLEEP 20
    view (0,0)-(319,199)
    window  (0,0)-(319,199)
LOOP UNTIL INKEY$ = CHR$(27) ' Sai do loop ao pressionar a tecla ESC
screenunlock()