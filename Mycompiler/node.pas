unit node;

interface
uses lexero ;
type
  nodes = class
    private
       lexline : integer ;
    public
      
      constructor CreateNode();
    end;

implementation
   constructor nodes.CreateNode();
   begin
      lexline := Lex.getline ;
   end;
begin

end.
