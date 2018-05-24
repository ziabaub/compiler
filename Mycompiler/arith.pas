unit arith;

interface
uses expr , Tag,typ , stmt , ConvUtils,token,node,num ,id ,lexero,sysutils,Keyword ,constant,accesoo;
type
  ariths = class (exprs)
  private

  public
      valuearith : Integer;
      valueboolean : Boolean;
      exp1,exp2 : exprs;
      constructor createarith(t :Tokens; e1,e2 : exprs );
      procedure getvaluearith(t: tokens);
  end ;

  var
  arit : ariths  ;
  v1,v2 : Integer;
implementation
    constructor ariths.createarith(t :Tokens; e1,e2 : exprs );
    begin
       inherited CreateNode();
       inherited CreateExpr(t , nil);
       exp1 := e1;
       exp2 := e2;
       valueboolean:= True;
       typeExpr:= typs.maxNumTyp(exp1.typeExpr,exp2.typeExpr);
       if (typeExpr= nil)then
       RaiseConversionError('number type expected , type error  line ' +inttostr(line ));
       getvaluearith(t);

    end ;

    procedure ariths.getvaluearith(t : tokens);
    begin

      if (typs.isNumericN(exp1.typeExpr) and typs.isNumericN(exp2.typeExpr) )then
         begin

           if ((exp1.tokenExpr.tag=tId))then
              v1 := (((exp1 ) as ids ).valueid)
           else if (exp1 is ariths) then
              v1:= (((exp1) as ariths).valuearith)
           else if (exp1 is constants)then
              v1:= (((exp1)as constants).valueconst)
           else if (exp1 is accessos)then
              v1:= (((exp1)as accessos).arrayid.valueid);

           if (exp2.tokenExpr.tag=tId)then
              v2 := (((exp2 ) as ids ).valueid)
           else if (exp2 is ariths) then
              v2:= (((exp2) as ariths).valuearith)
           else if (exp2 is constants)then
              v2:= (((exp2)as constants).valueconst)
           else if (exp2 is accessos)then
              v2:= (((exp2)as accessos).arrayid.valueid);

             if  (t.tag = tMult_Op)then    
             begin
                 valuearith:= v1 * v2
             end
            else if(t.tag = tdivchar_Op)then
             begin
                   valueboolean:= False;
             end
            else if(t.tag = tplus)then
             begin
                 valuearith:= v1 + v2;
             end
            else if(t.tag = tminus)then
             begin
                 valuearith:= v1 - v2;
             end;
          end
          else
          valueboolean:= False ;
            if (valuearith < 0)then
               valueboolean:= False;
            if  ((exp1 is ariths) and (not (exp2 is ariths)))then
              valueboolean := ((exp1 ) as ariths).valueboolean
            else if  ((exp1 is ariths) and  (exp2 is ariths))then
              begin
                 if ( not (((exp1 ) as ariths).valueboolean) or not (((exp2 ) as ariths).valueboolean ) )then
                  valueboolean := False;
              end
            else if  ((exp2 is ariths) and (not (exp1 is ariths)))then
              valueboolean := ((exp2 ) as ariths).valueboolean

    end;
end.
