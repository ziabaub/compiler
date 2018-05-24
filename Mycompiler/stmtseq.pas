unit stmtseq;

interface
uses stmt ;
 type
   stmtseqs = class (stmts)
   private

   public
      stmt1 , stmt2 : stmts;
      constructor createstmtseq(s1,s2 :stmts ) ;

   end;
   var

   stmtse : stmtseqs;
implementation
   constructor stmtseqs.createstmtseq(s1,s2 :stmts ) ;
   begin
     inherited Createstmt();
     stmt1:=s1;
     stmt2:=s2;
   end ;
end.
