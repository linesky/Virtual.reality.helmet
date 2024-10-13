
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


sub linesgg1(x as integer,y as integer,r as double,sts as integer ,i as integer,colors as integer)
    dim n as integer
    dim rr as double=r
    dim rrr as double=15/r
    if rr > 99 then rrr=12/r
    if rr < 25 then rrr=10/r
    if rr < 10 then rrr=8/r
    for n=0 to r 
        
        if n>i then line(x-rr,y-n)-(x+rr,y-n),colors
        
        rr=rr-rrr
        rrr=rrr*1.032
        if rr<0.1 then rr=0.1
    next
 end sub     
    
  sub linesgg(x as integer,y as integer,r as double,sts as integer ,colors as integer)
    dim n as integer
    dim rr as double=r
    dim rrr as double=15/r
    if rr > 99 then rrr=12/r
    if rr < 25 then rrr=10/r
    if rr < 10 then rrr=8/r
    for n=0 to r 
        
        line(x-rr,y-n)-(x+rr,y-n),colors
        
        rr=rr-rrr
        rrr=rrr*1.032
        if rr<0.1 then rr=0.1
    next
 end sub 
 sub linesg1(x as integer,y as integer,r as double,sts as integer ,i as integer,colors as integer)
    dim n as integer
    dim rr as double=r
    dim rrr as double=15/r
    if rr > 99 then rrr=12/r
    if rr < 25 then rrr=10/r
    if rr < 10 then rrr=8/r
    for n=0 to r 
        
        
        if n>i then line(x-rr,y+n)-(x+rr,y+n),colors
        rr=rr-rrr
        rrr=rrr*1.032
        if rr<0.1 then rr=0.1
    next
 end sub  
  
 sub linesg(x as integer,y as integer,r as double,sts as integer ,colors as integer)
    dim n as integer
    dim rr as double=r
    dim rrr as double=15/r
    if rr > 99 then rrr=12/r
    if rr < 25 then rrr=10/r
    if rr < 10 then rrr=8/r
    for n=0 to r 
        
        
        line(x-rr,y+n)-(x+rr,y+n),colors
        rr=rr-rrr
        rrr=rrr*1.032
        if rr<0.1 then rr=0.1
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
        
        linesg(160/2,200/2,50,1.0,15+6)
        circle(160/2,200/2-20),70,15+6,,,0.4,f
        circle(160/2,200/2-20),50,0,,,0.4,f
        linesgg(160/2,200/2-20,50,1.0,15+6)
       
        
        paint(160/2,200/2-10),15+6,15+6
        linesg1(160/2,200/2,50,1.0,50-46,15+5)
        linesgg1(160/2,200/2-20,50,1.0,50-46,15+5)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()