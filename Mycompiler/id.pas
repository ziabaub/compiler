unit id;

interface
uses keyword,token,typ,Arr,expr,node,createarr;
type
  ids = class(exprs)
  private

  public
  offset : integer ;
  valueid: integer ;
  item : createarrs;
  constructor CreateId(tokenId : keywords; typeId : typs ; address :integer);
  function getsizeofarr(t : typs): Integer;

  end;

implementation

constructor ids.CreateId(tokenId : keywords; typeId : typs ; address :integer);
var

   idis :ids;
  sizearr : Integer;
begin
   inherited CreateNode();
   inherited CreateExpr(tokenId,typeId);
   offset:=address;
   if (typeId is arrs )then
    begin
      sizearr:=getsizeofarr(typeId);
      item:= createarrs.createarrt(sizearr);
    end
   else
   valueid:= 0;
end;

function ids.getsizeofarr(t : typs): Integer ;
var
  t1:typs;
  i : Integer ;
begin
   t1 := t;
   i :=1;
   while ( t1 is arrs )do
    begin
       i := i* ((t1)as arrs).size;
       t1 := ((t1)as arrs).ofs;
    end;
       Result:= i;

end;

begin

end.
