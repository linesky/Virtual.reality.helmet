
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS

type objs
    x as integer
    y as integer
    w as integer
    h as integer
    colors as integer
end type

' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub objc(x as integer,y as integer,w as integer,h as integer ,scales as double,colors as integer)
    dim n as integer
    dim ww as double=w
    dim hh as double=h
    ww=ww*scales
    hh=hh*scales
    line(x,y)-(x+ww,y+hh),colors,bf
    
 end sub 


sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen(0,0)-(1590,1990)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window screen(0,0)-(1590,1990)
    end if
    if ssss=2 then
        view
        window
        CLS
        line(160,0)-(160,200)
    end if 
end sub
dim n as integer
' Loop principal
    dim objss as objs=type(0,0,100,2000,0)

DO
    SCREENlock()
    scrs(2)
    
    
    objss.w=objss.w +10
    if objss.w > 1400 then objss.w=100
    for n= 0 to 1
        scrs(n)
        circle(3200/4,2000/2),500,15,,,,f
        objc(objss.x,objss.y,objss.w,objss.h,1,objss.colors)
    next
    
    
    SCREENunlock()
    
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()