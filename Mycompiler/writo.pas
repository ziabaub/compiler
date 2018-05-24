unit writo;

interface
uses expr , typ , stmt , ConvUtils ;
type
  writos = class (stmts)
  private

  public
      exp : exprs;
      constructor createwrite(e : exprs );
  end ;

  var
  wri : writos;
implementation
    constructor writos.createwrite(e : exprs );
    begin
        inherited Createstmt();
       exp := e;
    end ;
end.
