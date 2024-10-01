
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
DIM shared AS double size = 19

' Vertices do cubo 3D
DIM cube(7) AS Point3D

' Inicializa os vértices do cubo
cube(0) = TYPE( -size, -size, -size)
cube(1) = TYPE( size, -size, -size)
cube(2) = TYPE( size, size, -size)
cube(3) = TYPE( -size, size, -size)
cube(4) = TYPE( -size, -size, size)
cube(5) = TYPE( size, -size, size)
cube(6) = TYPE( size, size, size)
cube(7) = TYPE( -size, size, size)

' Função de rotação 3D
SUB RotateCube (BYREF angle AS double, cube() AS Point3D)
    DIM AS double cosA, sinA
    cosA = COS(angle)
    sinA = SIN(angle)
    
    FOR i AS INTEGER = 0 TO 7
        ' Rotacionar ao redor do eixo Y
        DIM AS double x = cube(i).x * cosA - cube(i).z * sinA
        DIM AS double z = cube(i).x * sinA + cube(i).z * cosA
        cube(i).x = x
        cube(i).z = z
    NEXT
END SUB

' Função para projetar um ponto 3D em 2D
FUNCTION ProjectPoint(p AS Point3D, screen_width AS INTEGER, screen_height AS INTEGER) AS POINT
    DIM AS POINT projected
    projected.x = screen_width \ 2 + INT((1+p.x)*((size+1-p.z)*0.06))
    projected.y = screen_height \ 2 - INT((p.y+1)*((size+1-p.z)*0.1))
    RETURN projected
END FUNCTION

' Função para desenhar o cubo em arame
SUB DrawWireframeCube(cube() AS Point3D, screen_x AS INTEGER, screen_y AS INTEGER)
    DIM edges(11, 1) AS INTEGER
    edges(0, 0) = 0: edges(0, 1) = 1
    edges(1, 0) = 1: edges(1, 1) = 2
    edges(2, 0) = 2: edges(2, 1) = 3
    edges(3, 0) = 3: edges(3, 1) = 0
    edges(4, 0) = 4: edges(4, 1) = 5
    edges(5, 0) = 5: edges(5, 1) = 6
    edges(6, 0) = 6: edges(6, 1) = 7
    edges(7, 0) = 7: edges(7, 1) = 4
    edges(8, 0) = 0: edges(8, 1) = 4
    edges(9, 0) = 1: edges(9, 1) = 5
    edges(10, 0) = 2: edges(10, 1) = 6
    edges(11, 0) = 3: edges(11, 1) = 7

    FOR i AS INTEGER = 0 TO 11
        DIM AS POINT p1 = ProjectPoint(cube(edges(i, 0)), screen_x, screen_y)
        DIM AS POINT p2 = ProjectPoint(cube(edges(i, 1)), screen_x, screen_y)
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
    RotateCube(angle, cube())
    
    ' Desenha o cubo no lado esquerdo da tela (VR)
    DrawWireframeCube(cube(), half_width, screen_height)
    
    ' Desenha o cubo no lado direito da tela (VR)
    DrawWireframeCube(cube(), half_width *100 / 35, screen_height)
    
    ' Incrementa o ângulo de rotação
    angle += 0.05
    IF angle > 2 * 3.14159 THEN angle = angle - 2 * 3.14159
    
    ' Pausa para suavizar a animação
    screenunlock()
    SLEEP 150

LOOP UNTIL INKEY$ = CHR$(27) ' Sai do loop ao pressionar a tecla ESC
screenunlock()