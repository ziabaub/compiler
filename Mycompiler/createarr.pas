unit createarr;

interface
uses
    SysUtils,token;
type
     createarrs = class
     private

     public

      arr : array of integer ;
      pos,getpos , i : integer ;
      constructor createarrt( size : Integer);
      procedure put(t : Integer  );
      function get(): integer   ;
      function getin(at: integer): Integer  ;
      procedure putin(at: integer; s : integer ) ;
      function size(): integer;
     end;
   var
   createar :createarrs;
implementation

uses VarUtils;
    constructor createarrs.createarrt( size : Integer);
    begin
       SetLength(arr,size+1);
       pos    := 0;
       getpos := 0;
       i      := 0;
    end;

    procedure createarrs.put(t : Integer );
    begin
    arr[pos] := t;
    inc(pos);
    end;


    function createarrs.get(): Integer ;
    begin
    if (getpos <= pos )then
    begin
    result := arr[getpos];
    inc(getpos);
    end;
    end;

    function createarrs.getin(at: integer): Integer ;
    begin
    if (at <= Length(arr))then
    result := arr[at] ;

    end;

        procedure createarrs.putin(at: integer ; s : Integer  );
    begin
    if (at <= Length(arr))then
    arr[at] := s ;

    end;

    function createarrs.size(): integer;
    begin
    result := pos;
    end;
end.


