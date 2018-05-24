unit stringo;

interface
uses Token , Tag ;
 type
    stringos = class(Tokens)
     private

     public
       Spelings :   String ;
       constructor Createstring(Sspeling : String   );
       function getSpelings( ): string  ;

 end ;
var
      strin : stringos ;

implementation


constructor stringos.Createstring( Sspeling : String );
begin
   spelings := Sspeling ;
   inherited CreateT(tString);
end;


function stringos.getSpelings(): string;
begin
        Result:= Spelings;
end ;

begin
end.
