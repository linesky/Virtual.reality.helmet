
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub linesg(x as integer,y as integer,r as double,sts as integer ,colors as integer)
    dim n as integer
    dim rr as double=r
    dim rrr as double=15/r
    for n=0 to r 
        
        line(x-n,y-rr)-(x-n,y+rr),colors
        line(x+n,y-rr)-(x+n,y+rr),colors
        rr=rr-rrr
        rrr=rrr*1.032
    next
 end sub 

sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen(0,0)-(159,199)
    end if 
    if ssss=1 then
        view  (160,0)-(319,199)
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


    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        linesg(160/2,200/2,70,1.0,16+6)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()