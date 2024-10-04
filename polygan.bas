
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
redim xycopy(3) as point
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

' Loop principal
xy(0)=type(10,50)
xy(1)=type(30,50)
xy(2)=type(30,150)
xy(3)=type(10,150)
copyPolygon(xycopy(),xy())
DO
    SCREENlock()
    view
    window
    CLS
    line(160,0)-(160,200)
    view  (0,0)-(159,199)
    window (0,0)-(159,199)
    
    fillPolygon(xy(),15)
    view  (159,0)-(319,199)
    window (0,0)-(159,199)
    
    fillPolygon(xy(),15)
    SCREENunlock()
    addPolygon(xy(),5.0,0.0)
    if xy(0).x> 120 then copyPolygon(xy(),xycopy())
    SLEEP 200

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()