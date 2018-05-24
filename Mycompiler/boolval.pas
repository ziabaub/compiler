unit boolval;

interface
uses expr,arith,constant,Tag,id,typ,arr,accesoo,SysUtils, createarr , queue ;
type
  boolvals = class
  private

  public
    function boolvalue(Exp : exprs): integer;
  end;

  var
    boolv: boolvals ;
implementation

function boolvals.boolvalue(Exp : exprs):Integer;
 var
 v1,i,j,indexvalue  : Integer ;
 q1 : queues;
 crea : createarrs;
 begin
      if (typs.isNumericN(exp.typeExpr))then
        begin
         if (exp.tokenExpr.tag=tId)then
              v1 := (((exp ) as ids ).valueid)
         else if (exp is ariths) then
              v1:= (((exp) as ariths).valuearith)
         else if (exp is constants)then
              v1:= (((exp)as constants).valueconst)
         else if (exp is accessos)then
              begin
                 indexvalue :=1;
                 q1 := (((exp)as accessos).q ) ;
                 crea := (((exp)as accessos).arrayid).item ;
                     for i:= 0 to (((exp)as accessos).q.pos) do
                     begin
                      j := q1.get;
                      if  (j <> 0 )then
                      indexvalue:= indexvalue*j
                      else
                      Break;
                     end;
              v1:= (crea.getin(indexvalue));

              end
          else
              v1 := 0;
              Result := v1;
        end;
     // else
           //Result := 0;

 end;

end.
 