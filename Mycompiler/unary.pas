unit unary;

interface
uses expr , typ , stmt , ConvUtils,token,node  ;
type
  unarys = class (exprs)
  private

  public
      exp : exprs;
      constructor createunary(t :Tokens; e : exprs );
  end ;

  var
  aunar : unarys;
implementation
    constructor unarys.createunary(t :Tokens; e : exprs );
    begin
       inherited CreateNode();
       inherited CreateExpr(t , nil);
       exp := e;
       typeExpr:= typs.maxNumTyp(tyinteger,exp.typeExpr);
       if (typeExpr= nil)then
       RaiseConversionError(' type error ');
    end ;
end.
