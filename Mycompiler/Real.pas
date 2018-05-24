unit Real ;

interface
uses Token ,Tag ;
 type
    Reals = class(Tokens)
     private
       
     public
        Rea : Reals;
       constructor CreateReal(Vvalue : double );

 end ;

var
  value :   double ;
implementation

uses Classes;

constructor Reals.CreateReal(Vvalue : double );

begin
value  := Vvalue ;
inherited CreateT(tUnsigReal);
end;

end.
