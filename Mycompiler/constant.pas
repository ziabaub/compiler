unit constant;

interface
   uses keyword , token , expr ,typ , num , real ,node;
   type
   constants = class (exprs)
   private

   public
      valueconst : Integer;
      constructor createconst(t : Tokens ; ty : typs);
      procedure creatconst1(i : Integer);
      procedure creatconst2(i : Double);
   end;

   var

   consts : constants;
   construe , constfalse : constants;
implementation
      constructor constants.createconst(t : Tokens ; ty : typs);
      begin
         inherited CreateNode();
         inherited CreateExpr(t , ty);     
          if (typs.isNumericN(ty))then
          valueconst:= (((t)as Nums).value);
      end ;
      procedure constants.creatconst1(i : Integer);
      begin
         inherited CreateExpr(Nums.CreateNum(i),tyinteger);
      end;
      procedure constants.creatconst2(i : Double);
      begin
         inherited CreateExpr(Reals.CreateReal(i),tydouble);
      end;

begin
    construe   := constants.createconst(ktrue,tyboolean);
    constfalse := constants.createconst(kfalse,tyboolean);
end.
