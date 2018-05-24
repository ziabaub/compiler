unit rel;

interface
uses typ ,token ,arr,expr,logical,node ;
type
rels = class (logicals)
  private
      
  public
     constructor createrel (t : Tokens ;x1,x2 : exprs);
      function checkl(t1,t2 :typs):typs; override;
  end;
 var
 re : rels;
implementation

          constructor rels.createrel(t : Tokens ;x1,x2 : exprs);
          begin
               inherited CreateNode();
              inherited createlogi(t,x1,x2);                
          end;

      function  rels.checkl(t1,t2 :typs):typs;
      begin

         if ((t1 is arrs) or (t2 is arrs))then
         Result:= nil
         else if (t1=t2)then
         Result:= tyboolean
         else
         Result:= nil;
      end;
end.
