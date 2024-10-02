
' Configuração da janela gráfica
SCREEN 13
COLOR 15, 0 ' Define texto/linhas brancos e fundo preto
CLS

' Define a estrutura de um ponto 3D
TYPE Point3D
    x AS double
    y AS double
    z AS double
END TYPE
TYPE Point
  x as double
  y as double
end type


' Tamanho do cubo
DIM shared AS double size = 150

' Vertices do cubo 3D
DIM pYramid(5) AS Point3D

' Inicializa os vértices do cubo
pYramid(0) = TYPE( -1, -1, -1)
pYramid(1) = TYPE( 1, -1, -1)
pYramid(2) = TYPE( 1, -1, 1)
pYramid(3) = TYPE( -1, -1, 1)
pYramid(4) = TYPE( 0, 1, 0)


' Função de rotação 3D
SUB RotatepYramid (BYREF angle AS double, pYramid() AS Point3D)
    DIM AS double cosA, sinA
    cosA = COS(angle)
    sinA = SIN(angle)
    
    FOR i AS INTEGER = 0 TO 5
        ' Rotacionar ao redor do eixo Y
        DIM AS double x = pYramid(i).x * cosA - pYramid(i).z * sinA
        DIM AS double z = pYramid(i).x * sinA + pYramid(i).z * cosA
        
        pYramid(i).x = x
        pYramid(i).z = z
    NEXT
END SUB

' Função para projetar um ponto 3D em 2D
FUNCTION ProjectPoint(p AS Point3D, screen_width AS INTEGER, screen_height AS INTEGER) AS POINT
    DIM AS POINT projected
    dim factor as double =size /(p.z + 5)
    projected.x = INT(p.x*factor+screen_width/2)
    projected.y =  INT(p.y*factor+screen_height/2)
    RETURN projected
END FUNCTION

' Função para desenhar o cubo em arame
SUB DrawWireframepYramid(pYramid() AS Point3D, screen_x AS INTEGER, screen_y AS INTEGER)
    DIM edges(8, 1) AS INTEGER
    edges(0, 0) = 0: edges(0, 1) = 1
    edges(1, 0) = 1: edges(1, 1) = 2
    edges(2, 0) = 2: edges(2, 1) = 3
    edges(3, 0) = 3: edges(3, 1) = 0
    edges(4, 0) = 0: edges(4, 1) = 4
    edges(5, 0) = 1: edges(5, 1) = 4
    edges(6, 0) = 2: edges(6, 1) = 4
    edges(7, 0) = 3: edges(7, 1) = 4
    
    FOR i AS INTEGER = 0 TO 8
        DIM AS POINT p1 = ProjectPoint(pYramid(edges(i, 0)), screen_x, screen_y)
        DIM AS POINT p2 = ProjectPoint(pYramid(edges(i, 1)), screen_x, screen_y)
        LINE (p1.x, p1.y) - (p2.x, p2.y), 15 ' Desenha a linha em branco
    NEXT
END SUB

' Variáveis de rotação
DIM AS double angle = 0
DIM AS INTEGER screen_width = 320
DIM AS INTEGER screen_height = 200
DIM AS INTEGER half_width = 160

' Loop principal
DO
    screenlock()
    CLS ' Limpa a tela
    line (160,0)-(160,200)
    ' Rotaciona o cubo
    RotatepYramid(angle, pYramid())
    
    ' Desenha o cubo no lado esquerdo da tela (VR)
    DrawWireframepYramid(pYramid(), half_width, screen_height)
    
    ' Desenha o cubo no lado direito da tela (VR)
    DrawWireframepYramid(pYramid(), half_width *100 / 35, screen_height)
    
    ' Incrementa o ângulo de rotação
    angle += 0.01
    IF angle > 2 * 3.14159 THEN angle = angle - 2 * 3.14159
    
    ' Pausa para suavizar a animação
    screenunlock()
    SLEEP 150

LOOP UNTIL INKEY$ = CHR$(27) ' Sai do loop ao pressionar a tecla ESC
screenunlock()