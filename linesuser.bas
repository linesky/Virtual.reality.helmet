#include "string.bi"
' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR


    
    
   
  
 sub linesu(x as double,y as double,x1 as double,y1 as double ,colors as integer)
    dim n as double=0.00
    dim xx as double=x
    dim yy as double=y
    dim xx1 as double=x1
    dim yy1 as double=y1
    dim xx2 as double=abs(xx1-xx)
    dim yy2 as double=abs(yy1-yy)
    dim xyxy as double=xx2
    dim sst as double=1
    dim xyxyxy as double=yy2/xx2
    dim incc as double=0.00
    if abs(xx2)<abs(yy2) then 
        xyxy=yy2
        xyxyxy=xx2/yy2
    
    end if
    'print format(xyxyxy,"0.00")
    if xyxy < 0 then sst=-1
    for n=0 to abs(xyxy) 
        if abs(xx2)<abs(yy2) then 
            if xx>=xx1 and yy <= yy1 then pset(xx-incc,yy+n),colors
            if xx>=xx1 and yy >= yy1 then pset(xx-incc,yy-n),colors
            if xx<=xx1 and yy >= yy1 then pset(xx+incc,yy-n),colors
            if xx<xx1 and yy <= yy1 then pset(xx+incc,yy+n),colors
                
        else
            if xx>=xx1 and yy <= yy1 then pset(xx-n,yy+incc),colors
            if xx>=xx1 and yy >= yy1 then pset(xx-n,yy-incc),colors
            if xx<=xx1 and yy >= yy1 then pset(xx+n,yy-incc),colors
            if xx<=xx1 and yy <= yy1 then pset(xx+n,yy+incc),colors
                
            
        end if
        incc=incc+xyxyxy
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
        
        linesu(0,0,160,200,15)
        linesu(0,200,160,0,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20
DO
LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()