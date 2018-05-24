unit consstring;

interface
   uses keyword , token , expr ,typ , num , real ,node,stringo;
   type
   constantstrings = class (exprs)
   private

   public
      valueconst : string ;
      constructor createconststring(t : Tokens );
   end;

   var

   constantstring : constantstrings;
implementation
      constructor constantstrings.createconststring(t : Tokens );
      begin
         inherited CreateNode();
         inherited CreateExpr(t , tystring);
          valueconst:= (((t)as stringos).getSpelings);
      end ;

begin

end.