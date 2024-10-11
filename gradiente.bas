
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
 sub boxs(x as integer,y as integer,w as integer,h as integer,colors as integer)
     line(x,y)-(x+w,y+h),colors,bf
 end sub   
 sub gradiente(x as integer,y as integer,colors as integer)
    dim xx as integer=x/16
    dim yy as integer=y/16
    dim xn as integer
    dim yn as integer

    for yn=0 to 15
        for xn=0 to 15
            boxs(xn*xx,yn*yy,xx,yy,colors+xn)
        next
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

DO
    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then gradiente(320,200,16)
    next
    
    
    SCREENunlock()
    
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()