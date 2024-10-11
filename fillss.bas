
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
 
 sub fillls(x as integer,y as integer,x1 as integer,y1 as integer,w as integer,colors as integer)
    dim nx as integer
    dim ny as integer
    for ny=y+w to y1-w step w
        for nx=x+w to x1-w step w
            circle(nx,ny),w,colors
        next
    next
 end sub 

sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen(0,0)-(159,159)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window screen(0,0)-(159,159)
    end if
    if ssss=2 then
        view
        window
        CLS
        line(160,0)-(160,200)
    end if 
end sub
dim n as integer
dim nn as integer

' Loop principal


    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then 
            fillls(0,0,159,199,15,15)
        end if 
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
scrs(2)
SCREENunlock()