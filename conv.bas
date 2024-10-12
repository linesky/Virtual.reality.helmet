
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub grids(x as integer,y as integer,x1 as integer,y1 as integer,sts as integer ,colors as integer)
    dim n as integer
    
    for n=x to x+x1 step sts
        line(x,n)-(n,y1),colors
        
    next
 end sub 

sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen(0,0)-(159,199)
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


    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then grids(0,0,160,160,20,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()