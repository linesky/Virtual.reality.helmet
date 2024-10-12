
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub grids(x as integer,y as integer,x1 as integer,y1 as integer,sts as integer ,styles as integer,colors as integer)
    dim n as integer
    dim xx as integer=x1
    if xx<y1 then xx=y1
    for n=x to xx step sts
        line(n,y)-(n,y1),colors,,styles
        line(x,n)-(x1,n),colors,,styles
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
dim llines(6) as integer={&b01010101010101010101010101010101,&b11111111111111111111111111111111,&b11001100110011001100110011001100,&b11100011100011100011100011100011,&b11110000111100001111000011110000,&b11111000100011111000100011111001}
dim m as integer
'{&b01010101010101010101010101010101}
'{&b11111000100011111000100011111001}
' Loop principal
DO

    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
        grids(0,0,3200/2,2000,300,llines(m),15)
    next
    
    
    SCREENunlock()
    
    SLEEP 1300
    m=m+1
    if m>5 then m=0
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()
