unit Typ;

interface
  uses tag , keyword ,token ;
   type

   typs = class(keywords)
      private

      public
        width :integer;
        constructor CreateTyp(SpelingTyp : string ; tagTyp , widthTyp: integer );
        class function  isNumericR(P :typs) : boolean;
        class function  isNumericN(P :typs) : boolean;
        class function  maxNumTyp(t1,t2 :typs) : typs;
      end ;
 var
      T             :  typs;
      tybyte        :  typs;
      tyshortint    :  typs;
      tyword        :  typs;
      tysmallint    :  typs;
      tylongword    :  typs;
      tycardinal    :  typs;
      tylongint     :  typs;
      tyinteger     :  typs;
      tyint64       :  typs;
      tysingle      :  typs;
      tycurrency    :  typs;
      tydouble      :  typs;
      tyextended    :  typs;
      tyboolean     :  typs;
      tylabel       :  typs;
      tychar        :  typs;
      tystring      :  typs;
      tyconstantbool:  typs;
      tyconstant    :  typs;
      tyconstantR   :  typs;
      tyconstantN   :  typs;
      tyconstantchar:  typs;
      tyconstantstring:typs;
implementation


constructor typs.CreateTyp( SpelingTyp : string ; tagTyp , widthTyp: integer );
begin
   inherited CreateKeyword(SpelingTyp,tagTyp);
   width:= widthTyp;
end;

class function  typs.isNumericN(P :typs) : boolean;
begin
   if ((P = tyinteger))then
   Result  := True
   else if (P = tybyte)then
   Result  := True
   else if (P = tyshortint)then
   Result  := True
   else if (P = tyword)then
   Result  := True
   else if (P = tysmallint)then
   Result  := True
   else if (P = tylongword)then
   Result  := True
   else if (P = tycardinal)then
   Result  := True
   else if (P = tylongint)then
   Result  := True
   else if (P = tyint64)then
   Result  := True
   else if (p = tyconstantN)then
   Result  := true
   else
   Result:= False;

end;

class function  typs.isNumericR(P :typs) : boolean;
begin
     if (P = tysingle)then
   Result  := True
   else if (P = tycurrency)then
   Result  := True
   else if (P = tydouble)then
   Result  := True
   else if (P = tyextended)then
   Result  := True
   else if (p = tyconstantR)then
   Result  := true
   else
   Result:= False;

end;

class function  typs.maxNumTyp(t1,t2 :typs) : typs;
begin
   if ( ((not (isNumericN(t1)) ) or (not(isNumericN(t2)))) and ((not (isNumericR(t1)) ) or (not(isNumericR(t2))))  )then
   Result:=nil
   else if ((t1=tyinteger) or (t2=tyinteger))then
   Result:=tyinteger
   else if ((t1=tydouble) or (t2=tydouble))then
   Result:=tydouble
   else if ((t1=tybyte) or (t2=tybyte))then
   Result:=tybyte
   else if ((t1=tyshortint) or (t2=tyshortint))then
   Result:=tyshortint
   else if ((t1=tyword) or (t2=tyword))then
   Result:=tyword
   else if ((t1=tysmallint) or (t2=tysmallint))then
   Result:=tysmallint
   else if ((t1=tylongword) or (t2=tylongword))then
   Result:=tylongword
   else if ((t1=tycardinal) or (t2=tycardinal))then
   Result:=tycardinal
   else if ((t1=tylongint) or (t2=tylongint))then
   Result:=tylongint
   else if ((t1=tyint64) or (t2=tyint64))then
   Result:=tyint64
   else if ((t1=tychar) or (t2=tychar))then
   Result:=tychar
   else if ((t1=tysingle) or (t2=tysingle))then
   Result:=tysingle
   else if ((t1=tycurrency) or (t2=tycurrency))then
   Result:=tycurrency
   else if ((t1=tyextended) or (t2=tyextended))then
   Result:=tyextended
  // else if ((t1=tychar) or (t2=tychar))then
   //Result:=tychar
  // else if ((t1=tystring) or (t2=tystring))then
  // Result:=tystring
   else
   Result:=nil ;
end;


initialization
      tybyte        :=  typs.CreateTyp('byte',tbasic_type,1);
      tyshortint    :=  typs.CreateTyp('shortint',tbasic_type,1);
      tyword        :=  typs.CreateTyp('word',tbasic_type,2);
      tysmallint    :=  typs.CreateTyp('smallint',tbasic_type,2);
      tylongword    :=  typs.CreateTyp('longword',tbasic_type,4);
      tycardinal    :=  typs.CreateTyp('cardinal',tbasic_type,4);
      tylongint     :=  typs.CreateTyp('longint',tbasic_type,4);
      tyinteger     :=  typs.CreateTyp('integer',tbasic_type,4);
      tyint64       :=  typs.CreateTyp('int64',tbasic_type,8);


      tysingle      :=  typs.CreateTyp('single',tbasic_type,4);
      tycurrency    :=  typs.CreateTyp('currency',tbasic_type,8);
      tydouble      :=  typs.CreateTyp('double',tbasic_type,8);
      tyextended    :=  typs.CreateTyp('extended',tbasic_type,10);

      tyboolean     :=  typs.CreateTyp('boolean',tbasic_type,1);

      tyconstant    :=  typs.CreateTyp('const',tconst,1 );
      tyconstantR   :=  typs.CreateTyp('constR',tconst,10 ); ///
      tyconstantN   :=  typs.CreateTyp('constN',tconst,10 ); ///
      tyconstantchar:=  typs.CreateTyp('constc',tconst,2 ); ///
      tyconstantstring:=  typs.CreateTyp('stringc',tconst,10 );
      tyconstantbool:=  typs.CreateTyp('stringc',tconst,1 );

      tystring      :=  typs.CreateTyp('string',tbasic_type,10 );
      tychar        :=  typs.CreateTyp('char',tbasic_type,2);
      tylabel       :=  typs.CreateTyp('label',tLabel,1);


end.
