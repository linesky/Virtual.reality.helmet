
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
 sub boxs(x as integer,y as integer,w as integer,h as integer,colors as integer)
     line(x,y)-(x+w,y+h),colors,bf
 end sub  
 sub percentbar(x as integer,y as integer,w as integer , h as integer,value as double,colors as integer)
    dim k as double=h
    dim a as double=1.00/100.00*value
    dim b as integer=k*a
    dim xx as integer=x
    dim yy as integer=y+h-int(b)
    dim xn as integer=w
    dim yn as integer=h
    dim n as integer=0
    
        
    boxs(xx,yy,xn,yn,colors)
        
    
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
        
        if n<>2 then percentbar(160/2-20,200/2-190/2,40,190,percs,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()