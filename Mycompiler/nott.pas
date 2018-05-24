unit nott;

interface
    uses token ,expr ,logical,node;
    type
      nots = class (logicals)
      private

      public
         constructor createnot(t :Tokens ; x :exprs);
      end;

      var

      no : nots;
implementation
    constructor nots.createnot(t :Tokens ; x :exprs);
    begin
       inherited CreateNode();
       inherited createlogi(t,x,x);
    end;
end.
 