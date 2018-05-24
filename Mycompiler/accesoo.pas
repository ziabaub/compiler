unit accesoo;

interface
  uses id , expr , keyword,tag,typ,ConvUtils,node,arr,queue ,SysUtils,lexero;
  type
     accessos = class(exprs)
     private

     public
       arrayid  : ids ;
       indarr   : exprs ;
       q        : queues;
       t        : typs;
       constructor createAccesso(a : ids ; i : exprs; Qq : queues;arbol : boolean);
       function checkcapacity (): Boolean ;
     end;

  var
  acces : accessos;
  valueindexgiven , valueindex: Integer;
  valueindexbo : Boolean ;
implementation

    constructor accessos.createAccesso(a : ids; i : exprs ; Qq : queues;arbol : boolean );
    var
     capac : Boolean;
    begin
       arrayid:= a;
       indarr:= i;
       q := Qq;
       capac:= checkcapacity();
       inherited CreateNode();
       inherited CreateExpr(keywords.CreateKeyword('[]',tarray_type),t);
             valueindexbo:= arbol;
         if  (not(capac) or ((not(valueindexbo))))then
              RaiseConversionError('array index doesn''t exict  line  '+ IntToStr(line));
    end;


    function accessos.checkcapacity (): Boolean ;
    var
     i , j,j1 : integer ;
     t1: typs ;
     q1 : queues;
    begin
       q1:=queues.createqueue(10);
       t1:= arrayid.typeExpr;
      while ({t1.tag = tarray_type} t1 is arrs )do
       begin
          q1.put((((t1)as arrs).size));
          t1 := ((t1)as arrs).ofs;
       end;
       t := t1;

       if (q.size = q1.size)then
       begin
          for i := 0 to q.size do
          begin
             j := q.get;
             j1:=q1.get;
             if (j > j1)then
             begin
               Result:= False;
               break;
             end;
             Result:=True;
          end;
          q.getpos:=0;
       end
       else
         RaiseConversionError('check array dimension line ' + IntToStr(line));
    end;

end.
