unit stmt;

interface
uses
node;
  type
    stmts = class(nodes)
     private
     public
       constructor Createstmt();
     end;
var
stm : stmts;
null : stmts;
enclosing : stmts;
implementation
   constructor stmts.Createstmt();
   begin
     inherited CreateNode();
   end;

initialization
null:= stmts.Createstmt();
enclosing:= null;
end.
