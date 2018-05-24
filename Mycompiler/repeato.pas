unit repeato;

interface
uses expr , typ , stmt,ConvUtils ;
type
  repeatos = class (stmts)
  private

  public
      exp : exprs;
      stm : stmts;
      constructor createrepeat();
      procedure initr (e :exprs; s :stmts);
  end ;

  var
  repea : repeatos;
implementation

    constructor repeatos.createrepeat();     
    begin
      inherited Createstmt();
      exp := nil;
      stm := nil;
    end;

    procedure  repeatos.initr(e : exprs; s : stmts);
    begin
       exp := e;
       stm := s;
       if (exp.typeExpr<>tyboolean)then
       RaiseConversionError('boolean required in if ')
    end ;
end.

