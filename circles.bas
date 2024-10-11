
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
 sub ccircle(x as integer,y as integer,w as integer,a1 as double,a2 as double,colors as integer)
     circle(x,y),w,colors,a1,a2,,f
 end sub  
 sub percentbar(x as integer,y as integer,w as integer,w1 as integer , value as double,colors as integer)
    dim n as integer
    dim a as double=2*3.1415927/100*value
    
    
    
    for n= w to  w1  
        ccircle(x,y,n,0,a,colors)
    next
    
 end sub 

sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen (0,0)-(159,199)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window screen(0,0)-(159,199)
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
dim percs as double=0.00
DO
    percs=percs+10.00
    if percs>100.00 then percs=percs-100.00
    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then percentbar(160/2,200/2,10,30,percs,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()