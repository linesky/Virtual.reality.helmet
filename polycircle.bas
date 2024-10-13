#macro _CirclePoints(_xc,_yc,_x,_y,_c)
  pset(_xc+_x, _yc+_y), _c : pset(_xc-_x, _yc+_y), _c
  pset(_xc+_x, _yc-_y), _c : pset(_xc-_x, _yc-_y), _c
  pset(_xc+_y, _yc+_x), _c : pset(_xc-_y, _yc+_x), _c
  pset(_xc+_y, _yc-_x), _c : pset(_xc-_y, _yc-_x), _c
#endmacro
#macro _CircleLines(_xc,_yc,_x,_y,_c)
  line (_xc-_x,_yc-_y)-(_xc+_x,_yc-_y),_c
  line (_xc-_x,_yc+_y)-(_xc+_x,_yc+_y),_c
  line (_xc-_y,_yc-_x)-(_xc+_y,_yc-_x),_c
  line (_xc-_y,_yc+_x)-(_xc+_y,_yc+_x),_c
#endmacro  


' Configurações da janela e cores
SCREEN 13 ' Modo gráfico 320x200 com 256 cores
COLOR 15, 0 ' Texto branco e fundo preto
CLS


' Tamanho da janela e metade do ecra para VR

sub circleBres(xc as long, yc as long, r as long, cor as long)
  dim as long x = 0, y = r
  dim as long d = 3 - 2 * r
  _CirclePoints(xc, yc, x, y, cor)
  while y >= x
    
    '// check for decision parameter
    '// and correspondingly 
    '// update d, y
    if (d > 0) then
      y -= 1
      d = d + 4*(x-y)+10        
    else
      d = d + 4 * x + 6
    end if
    x += 1
    
    '// Draw the circle using the new coordinates
    _CirclePoints(xc, yc, x, y, cor)
      
  wend

end sub

sub FilledcircleBres(xc as long, yc as long, r as long, cor as long)
  dim as long x = 0, y = r
  dim as long d = 3 - 2 * r
  _CircleLines(xc, yc, x, y, cor)
  while y >= x
    
    '// check for decision parameter
    '// and correspondingly 
    '// update d, y
    if (d > 0) then
      y -= 1
      d = d + 4*(x-y)+10        
    else
      d = d + 4 * x + 6
    end if
    x += 1
    
    '// Draw the circle using the new coordinates
    _CircleLines(xc, yc, x, y, cor)    
      
  wend

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
        line(160,0)-(160,200)
    end if 
end sub
dim n as integer
' Loop principal

DO
    SCREENlock()
    scrs(2)
    
    
    
    for n= 0 to 1
        scrs(n)
        
         FilledcircleBres(160/2,100,50,15)
    next
    
    
    SCREENunlock()
    
    SLEEP 20

LOOP UNTIL INKEY$ = CHR$(27) ' Sai ao pressionar Esc
SCREENunlock()