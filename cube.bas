
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS

' Dimensões da bola
type point
    x as double
    y as double
end type 

' Tamanho da janela e metade do ecra para VR
DIM shared half_width AS INTEGER = 160 ' Metade do ecrã para VR
DIM shared height AS INTEGER = 200
redim xy(3) as point
redim xyc(3) as point
sub rect(x as integer,y as integer,w as integer,h as integer,colors1 as integer,colors2 as integer)
    line(x,y)-(x+w,y+h),colors1,bf
    line(x,y)-(x+w,y+h),colors2,b
end sub
sub rectPolygon(xy(any) as point , w as double, h as double )
    dim i as integer=0
    dim n as integer=0
    
    i=3
    redim pp(i) as point
    
    xy(0)=type(0,0)
    xy(1)=type(w,0)
    xy(2)=type(w,h)
    xy(3)=type(0,h)

    
    
   
    
    
end sub
sub addPolygon(p(any) as point , xx as double, yy as double )
    dim i as integer=0
    dim n as integer=0
    
    i=ubound(p)
    
    
    for n= 0 to i
       p(n).x=p(n).x+xx
       p(n).y=p(n).y+yy

    next 
    
   
    
    
end sub
sub copyPolygon( pp(any) as point, p(any) as point)
    dim i as integer=0
    dim n as integer=0
    
    i=ubound(p)
    redim pp(i) as point
    
    for n= 0 to i
       pp(n).x=p(n).x
       pp(n).y=p(n).y

    next 
    
   
    
    
end sub
function minPolygon(p(any) as point)as point
    dim i as integer=0
    dim n as integer=0
    dim xyxy as point
    i=ubound(p)
    dim xx as integer=p(0).x
    dim yy as integer=p(0).y
    for n= 0 to i
       if xx > p(n).x  then xx=p(n).x
       if yy > p(n).y  then yy=p(n).y

    next 
    xyxy.x=xx
    xyxy.y=yy
    return xyxy
    
    
end function 
function maxPolygon(p(any) as point)as point
    dim i as integer=0
    dim n as integer=0
    dim xyxy as point
    i=ubound(p)
    dim xx as integer=p(0).x
    dim yy as integer=p(0).y
    for n= 0 to i
       if xx < p(n).x  then xx=p(n).x
       if yy < p(n).y then yy=p(n).y

    next 
    xyxy.x=xx
    xyxy.y=yy
    return xyxy
    
    
end function  
sub drawPolygon(p(any) as point,colors as integer)
    dim i as integer=0
    dim n as integer=0
    i=ubound(p)
    
    for n= 0 to i-1
    
       line(p(n).x,p(n).y)-(p(1+n).x,p(1+n).y),colors

    next 
    line(p(i).x,p(i).y)-(p(0).x,p(0).y),colors
end sub 
sub fillPolygon(p(any) as point,colors as integer)
    dim i as integer=0
    dim n as integer=0
    dim xyxymax as point
    dim xyxymin as point
    i=ubound(p)
    dim xx as integer=0
    dim yy as integer=0
    dim xxx as integer=0
    dim yyy as integer=0
    drawPolygon(p(),255)
    xyxymax=maxPolygon(p())
    
    xyxymin=minPolygon(p())
    xxx=(xyxymax.x-xyxymin.x)/2
    yyy=(xyxymax.y-xyxymin.y)/2
    xx=xxx+xyxymin.x
    yy=yyy+xyxymin.y
    
    if abs(xxx)>3 and abs(yyy)>3 then 
        paint(xx,yy),colors,255
        drawPolygon(p(),colors)
    end if
    
end sub 
sub scrs(ssss as integer)
    if ssss=0 then
        view  (0,0)-(159,199)
        window screen (0,0)-(159,199)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window screen (0,0)-(159,199)
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
    xy(0)=type(100,50)
    xy(1)=type(150,50)
    xy(2)=type(75+50,75)
    xy(3)=type(75,75)

    xyc(0)=type(75+50,75)
    xyc(1)=type(150,50)
    xyc(2)=type(150,100)
    xyc(3)=type(75+50,75+50)



    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        rect(100,50,50,50,15,1)
        rect(75,75,50,50,15,1)

        fillPolygon(xy(),15)
        drawPolygon(xy(),1)
        fillPolygon(xyc(),15)
        drawPolygon(xyc(),1)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()