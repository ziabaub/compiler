unit comma ;

interface
uses expr ,token ,Typ ;
type
  commas = class (exprs)
  private

  public
      exp1,exp2 : exprs;
      constructor createcomma(t :Tokens; e1,e2 : exprs );
  end ;
  var
   comm : commas;
implementation
    constructor commas.createcomma(t :Tokens; e1,e2 : exprs );  
    begin
       inherited CreateNode();
       inherited CreateExpr(t , nil);
       exp1 := e1;
       exp2 := e2;
       typeExpr:= tystring;
    end ;

end.
