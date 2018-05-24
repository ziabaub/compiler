program posneg;
var 
 no : integer;
begin
  write('Enger a number:');
  readln(no);
  repeat 
  if (no > 0) then
   begin 
   writeln('You enter Positive Number');
   no := no+3;
   end
  else if (no < 3 )then 
   begin 
      repeat 
      no := no+3;
      until (no=3);
      if (no = 3 )then
          no := no*3+(3*4)
       else 
          no := 0; 
     writeln('You enter Negative number');
   end
   else 
   writeln(no+3);
 until (no = no*34);
 readln;
 end.