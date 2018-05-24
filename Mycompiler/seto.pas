unit seto;

interface
uses expr , typ , id ,tag,arith,constant, stmt,ConvUtils ,sysutils,lexero,boolval;
type
  setos = class (stmts)
  private

  public
      exp : exprs;
      i   : ids;
      constructor createseto (idi : ids ; e  : exprs );
      function   check(id1,id2: typs): typs;
  end ;

  var
se : setos;
implementation
    constructor setos.createseto (idi : ids ; e  : exprs );
    begin
        inherited Createstmt();
       exp := e;
       i := idi;
       if ((i.typeExpr = tystring ) or (i.typeExpr = tystring )or (typs.isNumericR(i.typeExpr)))then  
        i.valueid := 0
        else
        i.valueid:= boolv.boolvalue(e);
       if (check(idi.typeExpr,e.typeExpr)=nil)then
       RaiseConversionError('type incompatible line  ' + IntToStr(line))
    end ;


        function setos.check(id1,id2: typs): typs;    
    begin
       if ( (typs.isNumericR(id1) ) and (typs.isNumericR(id2)) or (typs.isNumericR(id1) ) and (typs.isNumericN(id2)))then
       Result:= id2
       else if ( (typs.isNumericN(id1) ) and (typs.isNumericN(id2)))then
       Result:= id2
       else if (((id1= tyboolean) and (id2= tyboolean))or ((id1= tyboolean) and (id2= tyconstantbool)))then
       Result:= id2
       else if (((id1= tychar) and (id2= tychar)) or ((id1= tychar) and (id2= tyconstantchar)) )then
       Result:= id2
       else if (((id1= tystring) and (id2= tystring)) or ((id1= tystring) and (id2= tyconstantstring)) or ((id1= tystring) and (id2= tychar)) or ((id1= tystring) and (id2= tyconstantchar)))then
       Result:= id2
       else if ((id1= tyconstantbool) and (id2= tyconstantbool))then
       Result:= id2
       else if ((id1= tyconstantchar) and (id2= tyconstantchar))then
       Result:= id2
       else if (((id1= tyconstantstring) and (id2= tyconstantstring)) or ((id1= tyconstantstring) and (id2= tyconstantchar)) )then
       Result:= id2
       else             
       Result:= nil ;
    end;
end.


