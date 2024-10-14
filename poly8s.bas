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


screenres 320,240
FilledcircleBres(160,120,100,15)
circleBres(160,120,100,10)

sleep