unit reado;

interface
uses expr , typ , stmt , ConvUtils ;
type
  reados = class (stmts)
  private

  public
      exp : exprs;
      constructor createreado(e : exprs );
  end ;

  var
  rea  : reados;
implementation
    constructor reados.createreado(e : exprs );
    begin
        inherited Createstmt();    
       exp := e;
    end ;
end.

