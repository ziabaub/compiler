unit charo;

interface
uses Token , Tag ;
 type
    charos = class(Tokens)
     private

     public
       Spelings :   char ;
       constructor Createchar(Sspeling : char   );
       function getSpelings( ): char  ;

 end ;
var
      chr : charos ;

implementation


constructor charos.Createchar( Sspeling : char );
begin
   spelings := Sspeling ;
   inherited CreateT(tchar);
end;


function charos.getSpelings(): char;
begin
        Result:= Spelings;
end ;

begin
end.
