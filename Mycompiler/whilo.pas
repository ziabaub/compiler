unit whilo;

interface
uses expr , typ , stmt,ConvUtils ;
type
  whilos = class (stmts)
  private

  public
      exp : exprs;
      stm : stmts;
      constructor createwhilo();
      procedure init (e :exprs; s :stmts);
  end ;

  var
  whil : whilos;
implementation

    constructor whilos.createwhilo();
    begin
      inherited Createstmt();
      exp := nil;
      stm := nil;
    end;

    procedure  whilos.init(e : exprs; s : stmts);
    begin
       
       exp := e;
       stm := s;
       if (exp.typeExpr<>tyboolean)then
       RaiseConversionError('boolean required in if ')
    end ;
end.

