
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
 function rndss(w as integer)as integer
     dim r as integer=-(w/2)+rnd()*w
     return r
 end function   
 sub centerball(x as integer,y as integer,w  as double,colors as integer)
     dim xx as integer=x-w/2
     dim yy as integer=y-w/2
     circle(xx,yy),w,colors,,,,f
 end sub 
 sub grids(x as integer,y as integer,x1 as integer,y1 as integer,colors as integer)
    dim n as integer
    for n=x to x1
        line(n,y)-(n,y1),colors
    next
    for n=x to x1
        line(x,n)-(x1,n),colors
    next
 end sub 

sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen(-5,-5)-(5,5)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window screen(-5,-5)-(5,5)
    end if
    if ssss=2 then
        view
        window
        CLS
        line(160,0)-(160,200)
    end if 
end sub
randomize(timer())
dim n as integer
dim nn as integer
dim nx(5) as integer
dim ny(5) as integer
' Loop principal
for n= 0 to 4
    nx(n)=rndss(10)
    ny(n)=rndss(10)
next 

    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        if n<>2 then 
            grids(-5,-5,5,5,16+4)
            line(0,-5)-(0,5),31
            line(-5,0)-(5,0),31
            for nn= 0 to 4
                centerball(nx(nn),ny(nn),0.5,16+10)
    
            next 
        end if 
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
scrs(2)
SCREENunlock()