unit lexero;

interface
uses Token , Tag ,hashtable,keyword ,Real,Num , Typ,stringo,charo ;
   type
     lexeros = class
      private
         procedure reserve(Kword : keywords);
      public
      function scanner ( ):Tokens ;
      function Reader ( ):char;
      function Readerchar (c : char ): boolean;
      function getline():integer;
      function getsstring():string;
      function getscommant():Tokens;

      end;
   const
     // Accepted_Symbols : set of Char =['0','1','2','3','4','5','6','7','8','9','.','(',')','+','-','/','*',' '];
      numbr            : set of Char =['0','1','2','3','4','5','6','7','8','9'];
      Letter           : set of char = ['a'..'z','A'..'Z'];
      LetterString     : set of char = ['a'..'z','A'..'Z','0'..'9'];

  var
  Lex : lexeros ;
  counter : integer =1 ;
  line  : integer =1 ;
  Words , wordsbasictype: THashTable;// = THashTable.Create(100);
  MainCode : string ;
  peek : char ;
  openstring : Boolean = false ;
  closestring  : Boolean = false ;
implementation

uses SysUtils;

function lexeros.getsstring():string ;
var
s : string;
begin
  while (peek <> '''')do
   begin
     s := s + Concat(peek);
     Reader();     
   end;
  if Readerchar('''')then
      begin
        s := s + Concat(peek);
        Reader();
        s := s + Concat(getsstring());
      end;
 Result:= s;    
end;

function lexeros.getscommant():Tokens ;
var
s : string;
l : Integer;
begin
  if (peek = '{')then
  begin
  while (peek <> '}')do
     Reader();
  end
  else if (peek ='/')then
  begin
     l:=line;
     while (l = line)do
     Reader();
     counter :=counter-1;
  end;


 Result:= Lex.scanner();
end;


function lexeros.getline():integer;
begin
    Result:=line;
end;


procedure lexeros.reserve(Kword : keywords);
begin
  Words.Add(Kword.getSpelings,Kword);
end ;

function lexeros.Reader(): char ;
var
i : integer;
begin
if (counter<=Length(MainCode))then
for i := counter to Length(MainCode) do
begin
  peek := MainCode[i];
  if (peek = #13)then       
     begin
        line:=line+1;
        counter:=counter+2;
        peek:=' ';
        break;
     end
  else if (peek = #10) then
     continue
  else
    break;
  end
  else
    peek:=' ';
  counter := counter+1;
  Result:=peek;
                   
end;


function lexeros.Readerchar (c : char ): boolean;
begin
   Reader();
   if ( peek <> c)then  
   begin
   Result:=false;
   counter:=counter-1;
   end
   else
   Result:=true;
end;

function lexeros.scanner ( ) : Tokens  ;
var
v , d ,i: integer; //value integer , for duplicate the floating
t : Tokens;  //result
vf: double ;//value float
s : string ; //create id
w : keywords;//to find the id
st : stringos;
ch : charos;
begin
if not(openstring)then
begin
  for i := counter to Length(MainCode) do
  begin
    peek := MainCode[i];
    if (peek =' ')then
       counter:=counter+1
    else if (peek = #13)then
       begin
          line:=line+1;
          counter:=counter+2;
       end
    else if (peek = #10) then
       continue
    else
      break;
  end ;
      counter := counter+1;     
end;
   if(openstring)then
     begin
      openstring := False ;
      closestring:= true;
      reader();
      s:=getsstring();
      counter:=counter-1;
      if (Length(s)>1)then
      begin
      st := stringos.Createstring(s);
      Result:= st;
      end
      else
      begin
        ch := charos.Createchar(s[1]);
        Result:= ch;
      end;
     end
    else
   case peek of
   '>' : if (Readerchar('='))then Result := khigeq_Op else result := khighe_Op;
   '<' : if (Readerchar('='))then Result := kLoeq_Op else if (Readerchar('>'))then
         result := knoteq_Op else result := kLower_Op;
   ':' : if (Readerchar('='))then Result := kEqual else Result := kColon ;
   '=' : Result := kEqual_Op ;
   ',' : Result := kcomma ;
   ';' : Result := kSemicolon ;
   '(' : Result := kLeftSk ;
   ')' : Result := kRightSk ;
   '[' : Result := kLeftBar ;
   ']' : Result := kRightBar ;
   '{' : Result := getscommant() ;
   //'}' : Result := krightsk2 ;
   '+' : Result := kPlus;
   '-' : Result := kMinus ;
   '*' : Result := kMult_Op;
   '/' : if (Readerchar('/'))then Result := getscommant();
   '.' : if (Readerchar('.'))then Result := kDoubleDot else Result:= kDot ;
   '''': begin
         if not (closestring)then
         openstring:= true
         else
         begin
         openstring:= False;
         closestring:= False;
         end;
         Result:= kApostroph;
         end
     else if (peek in numbr)then
   begin
      v:=0;
   repeat
        v:=10*v+ord(peek)-48;
        Reader();
   until  not(peek in numbr);
   if (peek <> '.')then
     begin
        counter:=counter-1;
        t := Nums.CreateNum(v);
        result := t;
      end
   else
     begin
        if Readerchar('.')then
        begin
          counter:=counter-2;
          t := Nums.CreateNum(v);
          Result := t ;
        end
        else
        begin
           vf := v;  d := 10;
           while (true) do
             begin
                Reader();
                if not(peek in numbr)then
                  begin
                     counter:=counter-1;
                     break ;
                  end;
                vf := vf + ((ord(peek)-48) / d);
                d:=d*10;
             end;
             t := Reals.CreateReal(vf);
             result := t;
        end;

     end;

   end

 else if (peek in Letter)then
   begin
    repeat
    s := s + Concat(peek);
    Reader();
    until not (peek in LetterString);
    w:= Words.items(s)as keywords;
    counter:=counter-1;
    if (w <> nil )then
    Result:= w
    else
    begin
       w := keywords.CreateKeyword(s,tId);
       Words.Add(s,w);
       Result:= w;
    end;
   end
  else
  begin
  result := kerror;
  end;
end;




end;



begin
  Words := THashTable.Create(100);
  lex := lexeros.Create;
  lex.reserve(kPlus);
  lex.reserve(kMinus);
  Lex.reserve(kOr_op);
  lex.reserve(kApostroph);
  lex.reserve(kDApostroph);
  lex.reserve(kArray);
  lex.reserve(kBegin);
  lex.reserve(kPoin);
  lex.reserve(kCase);
  lex.reserve(kString);
  lex.reserve(kColon);
  lex.reserve(kcomma);
  lex.reserve(kconst);
  lex.reserve(kDo);
  lex.reserve(kDot);
  lex.reserve(kDoubleDot);
  lex.reserve(kDownto);
  lex.reserve(kdivchar_Op);
  lex.reserve(kElse);
  lex.reserve(kEnd);
  lex.reserve(kEqual);
  lex.reserve(kFor);
  lex.reserve(kFunction);
  lex.reserve(kGoTo);
  lex.reserve(kIf);
  lex.reserve(kLabel);
  lex.reserve(kLeftSk);
  lex.reserve(kLeftBar);
  lex.reserve(kmode_Op);
  lex.reserve(kand_Op);
  lex.reserve(kMult_Op);
  lex.reserve(kNil);
  lex.reserve(kNot);
  lex.reserve(kOf);
  lex.reserve(kPacked);
  lex.reserve(kProcedure);
  lex.reserve(kProgram);
  lex.reserve(kRecord);
  lex.reserve(kEqual_Op);
  lex.reserve(knoteq_Op);
  lex.reserve(kLower_Op);
  lex.reserve(khighe_Op);
  lex.reserve(kLoeq_Op);
  lex.reserve(khigeq_Op);
  lex.reserve(kin_Op);
  lex.reserve(kRepeat);
  lex.reserve(kRightSk);
  lex.reserve(kRightBar);
  lex.reserve(kSignminus);
  lex.reserve(kSemicolon);
  lex.reserve(kFile);
  lex.reserve(kSet);
  lex.reserve(kSignPlus);
  lex.reserve(kThen);
  lex.reserve(kTo);
  lex.reserve(kType);
  lex.reserve(kUntil);
  lex.reserve(kVar);
  lex.reserve(kWhile);
  lex.reserve(kWith);
  Lex.reserve(kleftsk2);
  lex.reserve(krightsk2);
  lex.reserve(kcommand);
  Lex.reserve(kerror);

  Lex.reserve(kbreak);
  Lex.reserve(ktrue);
  Lex.reserve(kfalse);

  lex.reserve(tybyte);
  lex.reserve(tyshortint);
  lex.reserve(tyword);
  lex.reserve(tysmallint);
  lex.reserve(tylongword);
  lex.reserve(tycardinal);
  lex.reserve(tylongint);
  lex.reserve(tyinteger);
  lex.reserve(tyint64);
  Lex.reserve(tysingle);
  lex.reserve(tycurrency);
  lex.reserve(tydouble);
  Lex.reserve(tyextended);
  Lex.reserve(tyboolean);
  lex.reserve(tychar);
  Lex.reserve(tylabel);
  Lex.reserve(tyconstantR);
  Lex.reserve(tyconstantN);
  Lex.reserve(tyconstant);
  Lex.reserve(tyconstantchar);
  Lex.reserve(tyconstantstring);
  lex.reserve(tystring);
  Lex.reserve(tyconstantbool);

  Lex.reserve(kwrite);
  Lex.reserve(kwriteln);
  Lex.reserve(kread);
  Lex.reserve(kreadln);


end.
