unit Num ;

interface
uses Token , Tag ,sysUtils ;
 type
    Nums = class(Tokens)
    
     private

     public
       value :   integer ;
       constructor CreateNum(Vvalue : Integer );
       function getvaluebystring ():string;

 end ;

var
  Nu : Nums;

implementation

uses Classes;


constructor Nums.CreateNum(Vvalue : Integer );
begin
   value := Vvalue  ;
   inherited CreateT(tUnsigInte);
end;

function Nums.getvaluebystring ():string;
begin
   Result:= inttostr(value);

end;


end.
