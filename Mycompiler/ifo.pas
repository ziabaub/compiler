unit ifo;

interface
uses expr , typ , stmt , ConvUtils ;
type
  ifs = class (stmts)
  private

  public
      exp : exprs;
      stm : stmts;
      constructor createif(e : exprs ; s :stmts);
  end ;

  var
  ifcl : ifs;
implementation
    constructor ifs.createif(e : exprs ; s :stmts);
    begin
        inherited Createstmt();
       exp := e;
       stm := s;
       if (exp.typeExpr<>tyboolean)then
       RaiseConversionError('boolean required in if  ')
    end ;
end.
