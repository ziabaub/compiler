unit foro;

interface
uses expr , typ , stmt,ConvUtils ;
type
  foros = class (stmts)
  private

  public
      exp1,exp2 : exprs;
      stm : stmts;
      constructor createforo();
      procedure initfor (e1,e2 :exprs; s :stmts);
  end ;

  var
  fo : foros;
implementation

    constructor foros.createforo();
    begin
      inherited Createstmt();
      exp1 := nil;
      exp2 := nil;
      stm := nil;
    end;

    procedure  foros.initfor(e1,e2 :exprs; s :stmts);
    begin
       exp1 :=e1;
       exp2 :=e2;
       stm := s;
       if ((exp1.typeExpr=tyboolean) or (exp2.typeExpr=tyboolean))then
       RaiseConversionError('boolean not required in for ')
    end ;
end.

