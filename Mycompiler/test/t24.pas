program posneg;
var 
 no : integer;
begin
  write('Enger a number:');
  readln(no);

  if (no > 0) then
   begin 
   writeln('You enter Positive Number');
   no := no+3;
   end
  else if (no < 3 )then 
   begin 
      if (no = 3 )then
          no := no*3+(3*4)
       else 
          no := 0; 
     writeln('You enter Negative number');
   end
   else 
   writeln(no+3);
 readln;
 end.