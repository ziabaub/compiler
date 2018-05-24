unit constchar;

interface
   uses keyword , token , expr ,typ , num , real ,node,SysUtils,charo ;
   type
   constchars = class (exprs)
   private

   public
      valueconst : Char ;
      constructor createconstchar(t : Tokens );
   end;

   var

   constch : constchars;
implementation
      constructor constchars.createconstchar(t : Tokens );
      begin
         inherited CreateNode();
         inherited CreateExpr(t , tychar);
          valueconst:= ((((t)as charos).Spelings));
      end ;

begin

end.
