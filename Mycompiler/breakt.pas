unit breakt;

interface
  uses stmt ,whilo,repeato ,ConvUtils,lexero,sysutils,foro ;
  type
  breaks = class(stmts)
  private

  public
      stm :stmts;
      constructor createbreak();
  end;

  var
  brea : breaks;
implementation
   constructor breaks.createbreak();
   begin
       inherited Createstmt();
      if ((enclosing is repeatos) or ( enclosing is whilos) or (enclosing is foros)) then
       stm:=enclosing //RaiseConversionError('unenclosed break  ')
      else
       RaiseConversionError('break is not inside loop ' + IntToStr(line))
      
   end;
end.

