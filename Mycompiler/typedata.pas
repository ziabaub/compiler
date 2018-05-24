unit typedata;

interface
uses typ , token , keyword,Tag ,hashtable;
   type
   typedatas = class
   private
      procedure reservet(key : keywords);
   public
     procedure reservtype(s : String; k : keywords);
     function gettype (s :String ): typs;
   end;

   var
   typedat : typedatas;
   Wordstyp   : THashTable;
implementation
procedure typedatas.reservtype(s : String; k : keywords);
begin
   Wordstyp.Add(s,k);
end;

procedure typedatas.reservet(key : keywords);
begin
   Wordstyp.Add(key.getSpelings,key);
end;


function typedatas.gettype (s :String ): typs;
begin
  Result:= ((Wordstyp.items(s)) as typs);
end;

begin

Wordstyp := THashTable.Create(50);

  typedat.reservet(tybyte);
  typedat.reservet(tyshortint);
  typedat.reservet(tyword);
  typedat.reservet(tysmallint);
  typedat.reservet(tylongword);
  typedat.reservet(tycardinal);
  typedat.reservet(tylongint);
  typedat.reservet(tyinteger);
  typedat.reservet(tyint64);
  typedat.reservet(tysingle);
  typedat.reservet(tycurrency);
  typedat.reservet(tydouble);
  typedat.reservet(tyextended);
  typedat.reservet(tyboolean);
  typedat.reservet(tychar);
  typedat.reservet(tylabel);
  typedat.reservet(tyconstantR);
  typedat.reservet(tyconstantN);
  typedat.reservet(tyconstant);
  typedat.reservet(tyconstantchar);
  typedat.reservet(tyconstantstring);
  typedat.reservet(tystring);
  typedat.reservet(tyconstantbool);
end.
 