
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub grids(x as integer,y as integer,x1 as integer,y1 as integer,sts as integer ,colors as integer)
    dim n as integer
    line(x,(y1-y)/2+y)-(x1,(y1-y)/2+y)
    for n=x to x1 step sts
        line(n,y)-((x1-x)/2+x,(y1-y)/2+y),colors
        line(n,y1)-((x1-x)/2+x,(y1-y)/2+y),colors
    next
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


    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then grids(0,0,3200/2,2000,200,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()