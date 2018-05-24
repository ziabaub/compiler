unit logical;

interface
   uses expr , token,typ,convutils,node,SysUtils,lexero;
   type
   logicals = class (exprs)

   private

   public
      ex1 ,ex2 : exprs;
      constructor createlogi(t : Tokens;exp1,exp2 :exprs);
      function checkl(t1,t2 :typs):typs; virtual;
   end;

   var
  log : logicals;
implementation
      constructor logicals.createlogi(t : Tokens;exp1,exp2 :exprs);
      begin
         inherited CreateNode();
         inherited CreateExpr(t,nil);
         ex1:= exp1;
         ex2:= exp2;
         typeExpr := checkl(ex1.typeExpr,ex2.typeExpr);
         if (typeExpr= nil )then
         RaiseConversionError('type error : boolean expected '+'Near Line ' + IntToStr(line))
      end;
      function logicals.checkl(t1,t2 :typs):typs;
      begin
         if ((t1 = tyboolean) and (t2= tyboolean))then
         Result:= tyboolean
         else
         Result:= nil;
      end;
end.
