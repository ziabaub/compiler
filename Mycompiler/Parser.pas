unit Parser;


interface
uses keyword, Num, Real, Token, Tag, lexero, stmt, env, typ, id ,stmtseq ,expr,
arr,ConvUtils,ifo ,ifelse, whilo,repeato,breakt,seto,accesoo,setarray,logical,
nott,rel,constant,unary,arith,node,stack,foro,stringo,charo,typedata,queue,boolval
,createarr,consstring,constchar,reado,writo,comma ;
type

  Parsers = class
  private
      lexe : lexeros;
      look : tokens;
      top  : envs ;
      used   : integer ;
      procedure mov();
      procedure match(t : integer );
      procedure error (s : string);
      procedure programs ();
      function block():stmts ;
      procedure decls();
      function types():typs;

      procedure label_Decleration ();
      procedure labelo(p : typs);
      procedure constant_definitions();
      procedure constant_definition(P : typs );
      procedure variables_decleration();
      procedure type_definition();
      procedure type_decleration();
      function outfunction():exprs;
      function infunction():exprs;
      function dims():typs ;
      function dimension(P : typs; q : queues):typs ;
      function stmtsf():stmts ;
      function stmt():stmts;
      function assign ():stmts;
      function bool ():exprs;
      function join ():exprs;
      function equality ():exprs;
      function rel ():exprs;
      function exprsf():exprs;
      function term():exprs;
      function unary ():exprs;
      function factor ():exprs;
      function offsett(a :ids):accessos;
  public
      constructor createP(L :lexeros);
      procedure start();



  end;

  var
  pars : parsers;

implementation

uses SysUtils, Classes;

constructor Parsers.createP(L :lexeros);
begin
 top:=nil;
 used:=0;
 lexe:=L;
 mov();
end;

procedure Parsers.mov();
begin
  look:=lexe.scanner();
end;

procedure Parsers.match(t : integer );
begin
  if (look.tag = t)then
  begin
     mov();
  end
  else
  RaiseConversionError('Syntax Error  line  '+ IntToStr(line));
end;

procedure Parsers.error (s : string);
begin
RaiseConversionError('Near Line ' + inttostr(lexe.getline) + ':' + s);
end;

procedure Parsers.start();
begin
  programs();
end;

procedure Parsers.programs ();
begin
   match(tProgram);
   match(tId);
   match(tSemicolon);
   Block();
   match(tDot);
end;

function Parsers.block():stmts ;
var
savedenv : Envs ;
s : stmts ;
a : array[1..2,1..3]of Integer ;
begin
    savedenv :=top;          // create the symbol table for this block ;
    top:= Envs.CreateEnv(top);
    label_Decleration ();
    constant_definitions();
    type_definition();
    variables_decleration();
     match(tBegin);
     s:= stmtsf();
     match(tEnd);                          
     Result:= s;
end;

procedure Parsers.label_Decleration();
var
p : typs;
begin
   if (look.tag= tLabel)then
      begin     
        p := (look) as typs;
        match(tLabel);
        labelo(P);
        match(tSemicolon);
     end;
end;

procedure Parsers.labelo(P : typs );
var
id : ids;
klab : keywords;
begin
           while ((look.tag = tId) or (look.tag=tUnsigInte))do
        begin
         if (look.tag=tId)then
             begin
              if ((top.GetLocal(((look)as keywords).Spelings ))=nil)then
                 begin
                    id := ids.CreateId((look)as keywords,P,used);
                    top.puch(((((look)as keywords).Spelings)),id);
                    used:=used+p.width;
                    match(tId);
                    if (look.tag=tSemicolon)then
                      break
                    else
                      match(tcomma);
                 end
               else
                   RaiseConversionError('duplicate Label id  ' + (((look)as keywords).Spelings));
             end
          else if (look.tag= tUnsigInte)then
             begin

                if ((top.GetLocal(((look)as Nums).getvaluebystring ))=nil)then
                 begin
                    klab:= keywords.CreateKeyword(((look)as Nums).getvaluebystring,tLabel);
                    id := ids.CreateId(klab ,P,used);
                    top.puch(((((look)as Nums).getvaluebystring)),id) ;
                    used:=used+p.width;
                    match(tUnsigInte);
                     if (look.tag=tSemicolon)then
                       break
                     else
                    match(tcomma);
                 end
               else
                   RaiseConversionError('duplicate Label id  ' + (((look)as keywords).Spelings)+ ' line  ' + inttostr(line ));
             end;
         end;
end;

procedure Parsers.constant_definitions();
var
p,pchar : typs;
begin
   if (look.tag= tconst)then
      begin
        p := (look) as typs;
        match(tconst);
        constant_definition(P);
     end;
end ;     

procedure Parsers.constant_definition(P: typs);
var
id : ids;
klab, kstring : keywords;
st : stmts;
x : exprs;
s : string ;
loup : integer ;
Pi : typs;
begin
           while (look.tag = tId)do
             begin
                 if ((top.GetLocal(((look)as keywords).Spelings ))=nil)then
                    begin
                       id := ids.CreateId((look)as keywords,P,used);
                       top.puch(((((look)as keywords).Spelings)),id);
                       used:=used+p.width;
                       match(tId);
                       if(look.tag = tequal_op)then
                          begin
                             match(tequal_op);
                                if (look.tag = tUnsigInte)then
                                     begin
                                     id.typeExpr := tyconstantN;
                                     x:= constants.createconst (look , tyconstantN);
                                     match(tUnsigInte);
                                     end
                                else if (look.tag = tUnsigReal)then
                                     begin
                                     id.typeExpr := tyconstantR;
                                     x:= constants.createconst (look , tyconstantR);
                                     match(tUnsigReal);
                                     end
                                else if (look.tag=ttrue)then
                                     begin
                                     id.typeExpr := tyconstantbool;
                                     x := constants.createconst(look,tyconstantbool);
                                     match(ttrue);
                                     end
                                else if (look.tag=tfalse)then
                                     begin
                                     id.typeExpr := tyconstantbool;
                                     x := constants.createconst(look,tyconstantbool);
                                     match(tfalse);
                                     end
                                else if (look.tag=tApostroph)then
                                     begin
                                        match(tApostroph);
                                        if (look.tag = tchar)then
                                            begin
                                            id.typeExpr := tyconstantchar;
                                            x:= constants.createconst (look , tyconstantchar);
                                            end
                                        else if (look.tag=tString)then
                                            begin
                                            id.typeExpr := tyconstantstring;
                                            x:= constants.createconst (look , tyconstantstring);
                                            end;
                                        mov();
                                        match(tApostroph);
                                     end
                                else
                                  RaiseConversionError('syntax error ' + (((look)as keywords).Spelings)+' line  ' + IntToStr(line));
                             st := setos.createseto(id ,x);
                             match(tSemicolon); 
                          end
                          else if (look.tag = tColon)then
                          begin
                            match(tcolon);
                            Pi := types();
                            if look.tag= tequal_op then
                            begin
                              match(tequal_op);
                              match(tLeftSk);
                              while look.tag<>tRightSk do
                              begin
                               mov();
                              end;
                              match(tRightSk);
                              match(tSemicolon);
                            end;
                          end;
                    end
                  else
                      RaiseConversionError('duplicate Const id  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line));
              end;
end;

procedure Parsers.type_definition();
begin
   if (look.tag=tType)then
   begin
     match(tType);
     type_decleration();
   end;
end ;                                                    

procedure Parsers.type_decleration();
var
tok    : Tokens;
p      : typs;
begin
   while (look.tag = tId)do
        begin
          tok := look;
          match(tId);
          match(tequal_op);
          P:= types();
             if (P = nil)then
              RaiseConversionError('type not right  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line))
             else
             begin
                typedat.reservtype ((((tok)as keywords).Spelings),p);
              //  match(tbasic_type);
                match(tSemicolon);
             end;
        end;
end;

procedure Parsers.variables_decleration();
begin
   if (look.tag=tVar)then
   begin
     match(tVar);
     decls();
   end;
end ;

procedure Parsers.decls();
var
P: typs;
tok : Tokens;
id : ids;
stack : stacks;
i : Integer;
Exp : exprs;
begin
   stack:= stacks.createstack(50);
  while (look.tag=tId)do
     begin
        tok := look;
        mov();
           if (look.tag = tcomma)then
              begin
                stack.push(tok);
                match(tcomma);
              end
           else
              begin
              stack.push(tok);
                 match(tColon);
                 P:= types();
              end;
      end;

     if ((look.tag=tequal_op)and(stack.size = 1))then
     begin
         match(tequal_op);
         Exp := exprsf();
         tok:= stack.pop;
            if ((top.GetLocal(((tok)as keywords).Spelings ))=nil)then
              begin
                 id := ids.CreateId((tok)as keywords,P,used);
                 top.puch(((((tok)as keywords).Spelings)),id);
                 used:=used+p.width;
               end
                 else
                    RaiseConversionError('duplicate declaration  ' + (((tok)as keywords).Spelings) +'  line  '+ IntToStr(line));
           setos.createseto(id,exp);
     end
     else
     begin
        for i := 1 to stack.size do
         begin
            tok:= stack.pop;
            if ((top.GetLocal(((tok)as keywords).Spelings ))=nil)then
              begin
                 id := ids.CreateId((tok)as keywords,P,used);
                 top.puch(((((tok)as keywords).Spelings)),id);
                 used:=used+p.width;
               end
                 else
                    RaiseConversionError('duplicate declaration  ' + (((tok)as keywords).Spelings) +'  line  '+ IntToStr(line));
         end ;
     end;
     match(tSemicolon);
     if (look.tag= tId)then
     decls();
end;

function Parsers.types():typs;
var
p  :  typs ;
begin
    if (look.tag<>tArray)then
      begin
        p :=  Wordstyp.items(((look)as keywords).Spelings) as  typs;    // send look .tag
            if (p <> nil)then
               begin
                  mov();
                  Result:= p;
               end
            else
                  RaiseConversionError(' type not exict  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line));
      end
    else
      begin
         match(tArray);
         match(tLeftBar);
         Result:= dims();

      end;
end;

function Parsers.dims():typs ;
var
tok : Tokens;
p : typs;
i , j ,size : integer;
q : queues;
e1,e2 : exprs;
begin

begin
         e1:= exprsf();
         if  not (typs.isNumericN(e1.typeExpr))then
           RaiseConversionError(' size has to be integer   ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line))
         else
         begin
           q := queues.createqueue(10);
           i := boolv.boolvalue(e1);
           match(tDoubleDot);
           e2 := exprsf();
              if {((look.tag<>tUnsigInte)or}not (typs.isNumericN(e2.typeExpr))then
                 RaiseConversionError(' size has to be integer   ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line))
              else
                begin
                   j := boolv.boolvalue(e2);
                   size:= j-i+1;
                  //mov();
                   if (look.tag = tcomma)then
                      begin
                      q.put(size);
                          while (look.tag = tcomma )do
                          begin
                             match(tcomma);
                             i := (((look)as Nums).value);
                             match(tUnsigInte);
                             match(tDoubleDot);
                             j := (((look)as Nums).value);
                             size:= j-i+1;
                             match(tUnsigInte);
                             q.put(size);
                          end ;
                      end;

                   match(tRightBar);
                   match(tOf);
                   p :=  Wordstyp.items(((look)as keywords).Spelings) as  typs;    // send look .tag
                     if (p <> nil)then
                       mov()
                     else
                       RaiseConversionError(' type not exict  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line));
                 end;
          if (q.getpos=q.pos)then
          Result:= arrs.createArr(size,p)
          else
          Result:= dimension(p , q);
         end;
      end;

end;

function Parsers.dimension(p : typs; q : queues ): typs ;
var
  s : integer;
begin
      s := q.get();
     if(q.getpos<q.pos)then
        p:= dimension(p , q );
        Result:= arrs.createArr(s,p);
end;

//==============================================================================

function Parsers.stmtsf():stmts ;
var
s : stmts;
begin
   if (look.tag= tEnd)then  
   Result:= nil
   else
   begin
      s := stmt();//stmts.Createstmt;

      Result := stmtseqs.createstmtseq(s,stmtsf());     
   end ;
end;

function Parsers.stmt():stmts;
var
x ,x1: exprs;
s1 , s2 , savedstmt : stmts;    // sas to save outer loop and break
w : whilos;
r : repeatos;
tok : Tokens;
i : integer;
id : ids;
a : accessos;
foroto : foros;
begin

     if (look.tag = tSemicolon)then
         begin
             mov();
             Result:= null;
         end
      else if (look.tag = tFor)then
          begin
             foroto := foros.createforo();
             savedstmt:= enclosing;
             enclosing := foroto;
             match(tFor);
             if (look.tag = tId)then
               begin
                Tok:= look;
                match(tId);
                id := top.Get(((tok)as keywords).Spelings);
                  if (id=nil ) then
                         RaiseConversionError('variable ' + (((tok)as keywords).Spelings) + 'undeclared ')
                  else
                    begin
                       match(tEqual);
                       x := exprsf();
                       match(tTo);
                       x1:= exprsf();
                       match(tDo);
                          if (look.tag = tBegin)then
                             begin
                               match(tBegin);
                                   while (look.tag <> tEnd ) do
                                         s1:= stmt();
                                         foroto.initfor(x,x1,s1);
                                 match(tEnd);
                                 match(tSemicolon);
                              end
                          else
                            begin
                              s1:= stmt();
                              foroto.initfor(x,x1,s1);
                            end;
               enclosing := savedstmt;
               Result:= foroto;
                    end;
               end;
          end
      else if (look.tag = tIf)then
         begin
             match(tIf);
             match(tLeftSk);
             x := bool();
             match(tRightSk);
             match(tThen);
               if (look.tag = tBegin)then
                  begin
                    match(tBegin);
                        while (look.tag <> tEnd)do
                           s1 := stmt();
                        match(tEnd);
                        if (look.tag<>tElse)then
                        match(tSemicolon);
                  end
                  else
                  s1 := stmt();
             if (look.tag <> tElse)then
             begin
             Result:=ifs.createif(x,s1);
             end
             else
                begin
                   match(tElse);
                   if (look.tag = tBegin)then
                      begin
                         match(tBegin);
                            while (look.tag <> tEnd)do
                               s2:= stmt();
                            match(tEnd);
                      end
                      else
                        s2 := stmt();

                   Result:= ifelses.createifelse(x,s1,s2);
                end;
         end
      else if (look.tag = tWhile)then
         begin
               w := whilos.createwhilo();
               savedstmt := enclosing;
               enclosing:= w;

               match(tWhile);
               match(tLeftSk);
               x:=bool();
               match(tRightSk);
               match(tDo);
               if (look.tag = tBegin) then
               begin
                match(tBegin);
                   while (look.tag <> tEnd ) do
                      begin
                         s1:= stmt();
                         w.init(x,s1);
                      end;
                match(tEnd);
                match(tSemicolon);
               end
               else
               begin
                  s1:= stmt();
                  w.init(x,s1);
               end;
               enclosing := savedstmt;
               Result:= w;
         end
         else if (look.tag=tDo)then
         begin
                r := repeatos.createrepeat ();
                 savedstmt := enclosing;
                 enclosing := r;


               match(tDo);
               while (look.tag <> tWhile)do
                   s1 := stmt();
               match(tWhile);
               x:=bool();
               match(tSemicolon);
               r.initr(x,s1);
                 enclosing:= savedstmt;
                 Result:=r;
                

         end
      else if (look.tag = tRepeat)then
         begin
                 r := repeatos.createrepeat ();
                 savedstmt := enclosing;
                 enclosing := r;

                 match(tRepeat);
                 while (look.tag <> tUntil)do
                 s1 := stmt();
                 match(tUntil);
                 x := bool();
                 match(tSemicolon);
                 r.initr(x,s1);
                 enclosing:= savedstmt;
                 Result:=r;
          end                           
       else if (look.tag= tbreak)then
          begin
                 match(tbreak);
                 match(tSemicolon);
                 Result:= breaks.createbreak();
          end
        else if ((look.tag = twrite)or (look.tag = twriteln) )then
          begin
             mov() ;
             if (look.tag=tLeftSk)then
             begin
             match(tLeftSk);
             if (look.tag <> tcomma)then
             begin
              s1:=  writos.createwrite(outfunction());
              match(tRightSk);
              if (look.tag=tElse)then
              else
              match(tSemicolon);
             end
             else
               RaiseConversionError(' syntax error  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line));
             end
             else
             match(tSemicolon);
          end
        else if ((look.tag = tread)or (look.tag = treadln) ) then
         begin
             mov() ;
             if(look.tag=tLeftSk)then
             begin

             match(tLeftSk);
             if (look.tag <> tcomma)then
             begin
              s1:=  reados.createreado(infunction());
              match(tRightSk);
              if (look.tag=tElse)then
              else
              match(tSemicolon);
             end
             else
               RaiseConversionError(' syntax error  ' + (((look)as keywords).Spelings) + ' line  ' + IntToStr(line));
             end
             else
             match(tSemicolon);
         end
        else if (look.tag = tBegin) then
          begin
             //Result:= block();
          end
        else
        Result:= assign();

end;

function Parsers.infunction(): exprs ;
var
  id : ids;
  Exp : exprs;
begin
      if (look.tag=tId)then
     begin
      id:= top.Get(((look)as keywords).Spelings);     /////////////////////////////////////////////
         if (id=nil)then
           RaiseConversionError('variable ' + (((look)as keywords).Spelings) + 'undeclared ')
         else
         begin
           mov();
           if (look.tag = tRightSk)then
           Exp:= id
           else if (look.tag= tLeftBar)then
           Exp:= offsett(id)
           else if (look.tag = tcomma)then
           begin
           match(tcomma);
           Exp:= commas.createcomma(kcomma as Tokens,Exp,infunction());
           Result:= Exp;
           end;
            Result:= Exp;

         end;
     end

end;


function Parsers.outfunction(): exprs ;
var
  tok : Tokens;
  id  : ids;
  a : accessos;
  Exp : exprs;
begin

      if (look.tag <> tRightSk)then
      begin

          Exp:= exprsf();
            if (look.tag = tcomma)then
               begin
                  match(tcomma);
                  Exp:= commas.createcomma(kcomma as Tokens,Exp,outfunction());
                  Result:= Exp;
                  end
            else
               Result := Exp;
      end;

end;   


function Parsers.assign():stmts;
var
st : stmts;
Tok : Tokens;
id : ids;
a : accessos;
begin
   st := nil;
   Tok:= look;
   match(tId);
   id := top.Get(((tok)as keywords).Spelings);
   if (id=nil ) then
        RaiseConversionError('variable ' + (((tok)as keywords).Spelings) + 'undeclared line '+ IntToStr(line))
   else if (look.tag = tEqual)then
     begin
        if ((id.typeExpr = tyconstantN)or (id.typeExpr = tyconstantchar)or(id.typeExpr = tyconstantstring)or (id.typeExpr = tyconstantR)or (id.typeExpr = tyconstantbool))then
         RaiseConversionError('variable ' + (((tok)as keywords).Spelings) + ' is const cant send value  line '+IntToStr(line))
         else
         begin
            mov();
            st := setos.createseto(id ,bool())
         end;
     end
   else
     begin
        a := offsett( id );
        match(tEqual);
        st := setarrayos.createsetarray(a,bool());
     end;
      if (look.tag=tElse)then
      else
      match(tSemicolon);
    Result:= st ;
end;

function Parsers.bool ():exprs;
var
x : exprs ;
tok : Tokens;
begin
x := join();
while (look.tag = tor_op) do
   begin
     tok:= look;
     mov();
     x := rels.createrel(tok , x , join());
   end;
   Result:= x ;
end ;


function Parsers.join ():exprs;
var
x : exprs ;
tok : Tokens;
begin
x := equality();
while (look.tag = tand_Op) do
   begin
     tok:= look;
     mov();
     x := rels.createrel(tok , x , equality());
   end;
   Result:= x ;
end;

function Parsers.equality():exprs;
var
x : exprs ;
begin
  x := rel();
while ((look.tag = tequal_op) or (look.tag=tnotequal_op))do
   begin
     mov();
     tok := look;
     x := rels.createrel(tok , x , rel());
   end;
   Result:= x ;
end;

function Parsers.rel():exprs;
var
x : exprs ;
tok : Tokens;
begin
   x := exprsf();
   if ((look.tag = tlower) or (look.tag=tloweeq)or (look.tag=tbiger) or (look.tag=tbigereq))then
   begin
   tok := look;
   mov();
   Result:= rels.createrel(tok,x,exprsf());
   end
   else
   Result:= x ;
end;

function Parsers.exprsf():exprs;
var
x : exprs ;
tok : Tokens;
begin
x := term();
while ((look.tag = tplus)or (look.tag=tminus)) do
   begin
     tok:= look;
     mov();
     x := ariths.createarith(tok , x , term());
   end;
   Result:= x ;
end;

function Parsers.term():exprs;
var
x : exprs ;
tok : Tokens;
begin
   x := unary();
while ((look.tag = tMult_Op)or(look.tag=tdivchar_Op)) do
   begin
     tok:= look;
     mov();
     x := ariths.createarith(tok , x , unary());
   end;
   Result:= x ;
end;

function Parsers.unary ():exprs;
var
tok ,t  : Tokens;
x : exprs ;
begin
   if (look.tag = tminus)then  
   begin
      tok := kMult_Op;
      mov();
      t := Nums.CreateNum(-1);
      x := constants.createconst(t ,tyinteger);
    Result:= ariths.createarith(tok , x , unary() ) ;
   end
   else
   Result:=factor();

end;

function Parsers.factor ():exprs;
var
x : exprs ;
//tok : Tokens;
id : ids;
begin
   x := nil;
   if (look.tag = tLeftSk ) then
       begin
          mov();
          x := bool();
          match(tRightSk);
          Result:=x;
       end
   else if (look.tag = tUnsigInte)then
     begin
       x := constants.createconst(look , tyinteger);
       mov();
       Result:=x;
     end
   else if (look.tag = tUnsigReal)then
     begin
      x:= constants.createconst (look , tydouble);
        mov();
        Result:=x;
     end
   else if (look.tag=ttrue)then
     begin
       x := construe;
       mov();
       Result:=x;
     end
   else if (look.tag=tfalse)then
     begin
       x := constfalse;
       mov();
       Result:=x;
     end
   else if (look.tag=tId)then
     begin
      id:= top.Get(((look)as keywords).Spelings);     /////////////////////////////////////////////
         if (id=nil)then
           RaiseConversionError('variable ' + (((look)as keywords).Spelings) + 'undeclared ')
         else
         begin
           mov();
           if (look.tag <> tLeftBar)then
           Result:= id
           else if (look.tag= tLeftBar)then
           Result:= offsett(id);

         end;
     end
     else if (look.tag=tApostroph)then
   begin
      match(tApostroph);
         if (look.tag = tchar)then
            x:= constchars.createconstchar(look)
         else if (look.tag=tString)then
            x:= constantstrings.createconststring(look);
                     mov();
                     match(tApostroph);
                     Result:=x;
   end
   else
     RaiseConversionError('syntax error  ');
end;

function Parsers.offsett(a :ids):accessos;
var
indexs : exprs ;
arbool : boolean;
index1 , index2 : Integer ;
t : typs ;
q : queues;
begin
   q:= queues.createqueue(10);
   match(tLeftBar);
   indexs:= bool();
   match(tRightBar);
   while (look.tag = tLeftBar)do
   begin
      index1:= boolv.boolvalue(indexs);
      q.put(index1);
      match(tLeftBar);
      indexs:= bool();
      match(tRightBar);
   end;
    index1:= boolv.boolvalue(indexs);
    q.put(index1);
    if (indexs is ariths)then
              arbool:= ((indexs) as ariths).valueboolean
       else
       arbool := True;       
    Result := accessos.createAccesso(a,indexs,q,arbool);   
end;                            

begin

end.
