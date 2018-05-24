program posneg;
var 
 no : integer;
begin
  write('Enger a number:');
  readln(no);
while (no <> 2 )do 
begin 
for no := 0 to no*100 do 
 begin   
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
            for no := 0 to no*100 do 
             begin 
                no := no+3;
               while (no < 3 )do 
               no := no*no ;
             end;
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
 end;
end;
 readln;
 end.