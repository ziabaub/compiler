program ziad ; 
var 
x1: array [1..2,1..3] of integer;
z : integer ;
begin
x1[2][2]:= 2 ;
x1[2][3]:= 3 ;
z := x1[x1[2][1]][x1[2][3]]; 
end.