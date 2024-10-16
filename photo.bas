
' Configurações da janela e cores
screenres 320,200,32 ' Modo gráfico 320x200 
COLOR 15, 0 ' Texto branco e fundo preto
CLS
dim myimage as any ptr = imagecreate(132,86)
bload "cats.bmp",myimage
' Tamanho da janela e metade do ecra para VR


    
    
   
 
 sub gradiente(x as integer,y as integer,r as double,colors as integer)
    dim rr as double=r
    
    dim n as integer=0
    for n=0 to 15
        
        circle(x,y),rr,colors+n,,,1.0,f
        rr=rr*0.9
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
        line(159,0)-(159,200)
    end if 
end sub
dim n as integer
' Loop principal


    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        put(0,0),myimage
         
    next
    
    
    SCREENunlock()
    
    SLEEP 20
    imagedestroy(myimage)
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()