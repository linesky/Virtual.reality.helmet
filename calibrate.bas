
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
SCREEN 13
COLOR 15, 0 ' Cor branca para linhas e fundo preto
CLS

' Variáveis para posição da linha X
DIM AS INTEGER left_x = 140  ' Posição inicial da linha no quadro esquerdo
DIM AS INTEGER right_x = 20 ' Posição inicial da linha no quadro direito
DIM AS INTEGER step_size = 2 ' Tamanho do passo de movimento

' Função para desenhar o ambiente de calibração
SUB DrawCalibrationScreen(left_x AS INTEGER, right_x AS INTEGER)
    ' Limpa a tela
    SCREENlock()
	CLS
    
    ' Desenha as linhas divisórias horizontais e verticais
    LINE (160, 0) - (160, 200), 15 ' Linha vertical que divide ao meio
    LINE (0, 100) - (320, 100), 15 ' Linha horizontal que divide ao meio
    
    ' Desenha a linha "X" vertical no lado esquerdo
    LINE (left_x, 0) - (left_x, 200), 15
    
    ' Desenha a linha "X" vertical no lado direito
    LINE (right_x + 160, 0) - (right_x + 160, 200), 15
    
    ' Desenha a pequena esfera no centro da tela
    CIRCLE (left_x, 100), 20, 15,,,,F ' Esfera central no meio da tela
    CIRCLE (right_x+160, 100), 20, 15,,,,F ' Esfera central no meio da tela
    SCREENunlock()
END SUB

' Loop principal
DO
    ' Desenha a tela de calibração com as linhas "X" nas posições atuais
    DrawCalibrationScreen(left_x, right_x)
    
    ' Movimento da linha "X" para a esquerda ou direita com as teclas de seta
    IF MULTIKEY(SC_LEFT) THEN
        left_x += step_size
        right_x -= step_size
    ELSEIF MULTIKEY(SC_RIGHT) THEN
        left_x -= step_size
        right_x += step_size
    END IF
    
    ' Limites para evitar que as linhas saiam das bordas
    IF left_x < 0 THEN left_x = 0
    IF left_x > 160 THEN left_x = 160
    IF right_x < 0 THEN right_x = 0
    IF right_x > 160 THEN right_x = 160
    
    ' Pausa para suavizar a animação
    SLEEP 10

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar a tecla ESC
SCREENunlock()