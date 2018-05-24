unit expr;

interface
uses
   node , token , typ ,keyword ;
   type
     exprs = class(nodes)
     private

     public
        tokenExpr :  Tokens;
        typeExpr  :  typs;
        constructor CreateExpr(TtokenExpr : Tokens; TtypeExpr : typs);
     end;
implementation

constructor exprs.CreateExpr(TtokenExpr : Tokens; TtypeExpr : typs);
begin
   inherited CreateNode();
   tokenExpr:= TtokenExpr;
   typeExpr:=TtypeExpr;
end;

begin
end.
