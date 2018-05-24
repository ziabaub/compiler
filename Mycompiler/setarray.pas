unit setarray;

interface
uses expr , typ , id , stmt, ConvUtils, accesoo,arr, SysUtils , lexero ,seto,boolval,queue , createarr ;
type
  setarrayos = class (stmts)
  private
      //function checks(id1,id2: typs): typs;
  public
      ind,e  : exprs;
      arrss  : ids;
      constructor createsetarray(x :accessos ; y : exprs );
      procedure sendvalue (x : accessos);

  end ;

  var
setarr : setarrayos;
implementation
    constructor  setarrayos.createsetarray(x :accessos ; y : exprs );
    begin
       inherited Createstmt();
       arrss := x.arrayid;
       ind  := x.indarr;
       e    := y;
       //(x.arrayid).valueid := boolv.boolvalue(y);
       sendvalue(x );

       if ((se.check(x.typeExpr,y.typeExpr)) = nil )then 
       RaiseConversionError('type incompatible line '+ IntToStr(line))
    end ;


    procedure setarrayos.sendvalue(x : accessos);
    var
     i,j,indexvalue  : Integer ;
     q1 : queues;
     crea : createarrs;
    begin
                 indexvalue :=1;
                 q1 := (((x)as accessos).q ) ;
                 crea := (((x)as accessos).arrayid).item ;
                     for i:= 0 to (((x)as accessos).q.pos) do
                     begin
                      j := q1.get ;
                      if  (j <> 0 )then
                      indexvalue:= indexvalue*j
                      else
                      Break;
                     end;
              crea.putin(indexvalue,(( boolv.boolvalue(e))));
              (((x)as accessos).arrayid).item := crea ;


    end;

    {function setarrayos.checks(id1,id2: typs): typs;
    begin
       if ((id1 is arrs) or (id2 is arrs) )then
       Result:= nil
       else if (id1= id2)then
       Result:= id2
       else  if ( (typs.isNumericR(id1) ) and (typs.isNumericR(id2)))then
       Result:=id2
       else  if ( (typs.isNumericN(id1) ) and (typs.isNumericN(id2)))then
       Result:=id2
       else
       Result:= nil ;
    end;   }
end.

