unit queue;

interface
uses
    SysUtils,token;
type
     queues = class
     private

     public

      queuearr : array of integer;
      pos,getpos , i : integer ;
      constructor createqueue( size : Integer);
      procedure put(t :integer);
      function get(): integer ;
      function getin(at: integer): integer;
      function size(): integer;
     end;
   var
   queu :queues;
implementation
    constructor queues.createqueue( size : Integer);
    begin
       SetLength(queuearr,size+1);
       pos    := 0;
       getpos := 0;
       i      := 0;
    end;


    procedure queues.put(t : integer);
    begin
    queuearr[pos] := t;
    inc(pos);
    end;

    function queues.get(): integer;
    begin
    if (getpos <= pos )then
    begin
    result := queuearr[getpos];
    inc(getpos);  
    end;
    end;

    function queues.getin(at: integer): integer;
    begin
    if (at <= pos)then
    result := queuearr[at] ;

    end;

    function queues.size(): integer;
    begin
    result := pos;
    end;
end.



