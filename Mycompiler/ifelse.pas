unit ifelse;

interface
uses expr , typ , stmt,ConvUtils ;
type
  ifelses = class (stmts)
  private

  public
      exp : exprs;
      stm1,stm2 : stmts;
      constructor createifelse(e : exprs ; s1,s2 :stmts);
  end ;

  var
  ifcl : ifelses;
implementation
    constructor ifelses.createifelse(e : exprs ; s1,s2 :stmts);
    begin
        inherited Createstmt();
       exp := e;
       stm1 := s1;
       stm2 := s2;
       if (exp.typeExpr<>tyboolean)then
       RaiseConversionError('boolean required in if ')
    end ;
end.

