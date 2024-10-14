dim sinTable(60) as double= {0.000000, 0.104528, 0.207912, 0.309017, 0.406737, 0.500000, 0.587785, 0.669131, 0.743145, 0.809017, 0.866025, 0.913545, 0.951057, 0.978148, 0.994522, 1.000000, 0.994522, 0.978148, 0.951057, 0.913545, 0.866025, 0.809017, 0.743145, 0.669131, 0.587785, 0.500000, 0.406737, 0.309017, 0.207912, 0.104528, 0.000000, -0.104528, -0.207912, -0.309017, -0.406737, -0.500000, -0.587785, -0.669131, -0.743145, -0.809017, -0.866025, -0.913545, -0.951057, -0.978148, -0.994522, -1.000000, -0.994522, -0.978148, -0.951057, -0.913545, -0.866025, -0.809017, -0.743145, -0.669131, -0.587785, -0.500000, -0.406737, -0.309017, -0.207912, -0.104528, -0.000000}
dim cosTable(60) as double= {1.000000, 0.994522, 0.978148, 0.951057, 0.913545, 0.866025, 0.809017, 0.743145, 0.669131, 0.587785, 0.500000, 0.406737, 0.309017, 0.207912, 0.104528, 0.000000, -0.104528, -0.207912, -0.309017, -0.406737, -0.500000, -0.587785, -0.669131, -0.743145, -0.809017, -0.866025, -0.913545, -0.951057, -0.978148, -0.994522, -1.000000, -0.994522, -0.978148, -0.951057, -0.913545, -0.866025, -0.809017, -0.743145, -0.669131, -0.587785, -0.500000, -0.406737, -0.309017, -0.207912, -0.104528, -0.000000, 0.104528, 0.207912, 0.309017, 0.406737, 0.500000, 0.587785, 0.669131, 0.743145, 0.809017, 0.866025, 0.913545, 0.951057, 0.978148, 0.994522}
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
redim xy(8) as point
redim xycopy(8) as point
sub circletPolygon(xy(any) as point ,x as double , y as double, r as double,divs as double)
    dim i as integer=0
    dim n as integer=0
    i=divs-1.0
    dim i1 as double=int(60.00/divs)
    const pii as double =3.1415927
    i=divs-1.0
    redim pp(i) as point
    
    for n=0 to int(divs)
        xy(n)=type(x+r*sin(i1*n),y+r*cos(i1*n))
    next 
    
    
   
    
    
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
        window (0,0)-(159,199)
    end if 
    if ssss=1 then
        view  (159,0)-(319,199)
        window (0,0)-(159,199)
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
circletPolygon(xy(),35,100,30,8)

copyPolygon(xycopy(),xy())
DO
    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        fillPolygon(xy(),15+6)
    next
    
    
    SCREENunlock()
    addPolygon(xy(),5.0,0.0)
    if xy(0).x> 120 then copyPolygon(xy(),xycopy())
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()