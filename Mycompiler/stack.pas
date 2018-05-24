unit stack;

interface
uses
    SysUtils,token;
type
     stacks = class
     private

     public

      stackarr : array of Tokens;
      pos , i : integer ;
      constructor createstack( size : Integer);
      procedure push(t :Tokens);
      function pop(): Tokens ;
      function get(at: integer): Tokens;
      function size(): integer;
     end;
   var
   stak :stacks;
implementation
    constructor stacks.createstack( size : Integer);
    begin
       SetLength(stackarr,size);
       pos := 0;
       i:= 0;
    end;

    procedure stacks.push(t : Tokens);
    begin
    stackarr[pos] := t;
    inc(pos);
    end;

    function stacks.pop(): Tokens;
    begin
    dec(pos);
    result := stackarr[pos];
    end;

    function stacks.get(at: integer): Tokens;
    begin
    result := stackarr[at];
    end;

    function stacks.size(): integer;
    begin
    result := pos;
    end;
end.


		
