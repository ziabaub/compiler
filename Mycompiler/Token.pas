unit Token ;


interface
 uses tag;

type
   Tokens = class   
     private
       
     public
          
       tag : integer;
       constructor CreateT(vtag : integer );

end ;

var
   Tok : Tokens;
implementation

constructor Tokens.CreateT(Vtag : integer );
begin
   tag := vtag ;
end;

end.
