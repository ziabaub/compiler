unit Env;

interface
uses HashTable ,id,expr,stmt ;
type
    Envs = class
    private
     table : THashTable;
    protected
     preview : envs ;
    public
      constructor CreateEnv(Ppreviews : envs);
      procedure puch (StrP : string ; i : ids );
      function Get (StrG :string ) : ids;
      function GetLocal(strGL :string ):ids;
    end;
 var
 en : Envs;

implementation
constructor Envs.CreateEnv(Ppreviews : envs);
begin
  table:= THashTable.Create(50);
  preview:=Ppreviews;   
end;

procedure Envs.puch (StrP : string ; i : ids );
begin
   table.Add(StrP,i);

end;

function Envs.Get (StrG :string ) : ids;
var
i : Envs;
found : ids;
begin
   i := Self;
   while (i<>nil) do
   begin
      found := i.table.items(StrG) as  ids;
      if (found<>nil)then
      Result:=found;
      i:=i.preview;
   end;
   if (found<>nil)then
   Result:=found
   else
   Result:= nil;
end;

function Envs.GetLocal(strGL :string ):ids;
begin
   Result := table.items(strGL) as  ids;
end;
begin


end.
