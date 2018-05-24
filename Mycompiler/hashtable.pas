unit HashTable;

interface

uses
    SysUtils, Variants, Classes, Controls, Contnrs;

type
    THashItem = class(TObject)
    private
        FId: string;
        FData: TObject;
    public
        constructor Create(Id: string; Data: TObject);
        destructor Destroy(); override;
        property Id: string read FId write FId;
        property Data: TObject read FData write FData;
    end;

type
    THashTable = class
    protected
        FTableSize: integer;
        function HashFunction(AId: string): integer; virtual;
    public
        FData: array of TObjectList;
        constructor Create(tableSize: integer);
        destructor Destroy(); override;
        procedure Add(Id: string; Data: TObject);
        function items(Id: string): TObject;
        procedure Delete(AId: string);
        procedure ClearAll;
    end;

implementation

{ THashItem }

constructor THashItem.Create(Id: string; Data: TObject);
begin
    FId := Id;
    FData := Data;
end;

destructor THashItem.Destroy;
begin
  inherited;
  FreeAndNil(FData);
end;

{ THashTable }

procedure THashTable.ClearAll;
var
    i: integer;
begin
    for i := 0 to FTableSize - 1 do
        FData[i].Clear;
end;

constructor THashTable.Create(tableSize: integer);
var
    i: integer;
begin
    FTableSize := tableSize;
    SetLength(FData, tableSize);
    for i := 0 to FTableSize-1 do
        FData[i] := TObjectList.Create();
end;

function THashTable.HashFunction(AId: string): integer;
var
    i: integer;
    h, x: longint;
begin
    h := 0;
    for i := 1 to Length(AId) do
    begin
        h := (h shl 8) + Ord(AId[i]);
        x := h and $F000F000;
        if x <> 0 then
            h := h xor (x shr 21) xor x;
    end;
    result := h mod FTableSize;
end;

procedure THashTable.Add(Id: string; Data: TObject);
var
    hash, i: integer;
    list: TObjectList;
    item: THashItem;
begin
    hash := HashFunction(Id);
    list := TObjectList(FData[hash]);
    for i := 0 to list.Count - 1 do
    begin
        item := THashItem(list[i]);
        if item.Id = Id then
        begin
            item.Data := Data;
            exit;
        end;
    end;
    list.Add(THashItem.Create(Id, Data));
end;

function THashTable.items(Id: string): TObject;
var
    hash, i: integer;
    list: TList;
    item: THashItem;
begin
    result := nil;
    hash := HashFunction(Id);
    list := TObjectList(FData[hash]);
    for i := 0 to list.Count - 1 do
    begin
        item := THashItem(list[i]);
        if item.Id = Id then
        begin
            result := item.Data;
            break;
        end;
    end;
end;

procedure THashTable.Delete(AId: string);
var
    hash, i: integer;
    list: TObjectList;
begin
    hash := HashFunction(AId);
    list := TObjectList(FData[hash]);
    for i := 0 to list.Count - 1 do
        if THashItem(list[i]).Id = AId then
        begin
            list.Delete(i);
            break;
        end;
end;

destructor THashTable.Destroy;
var
    i : integer;
begin
    inherited;
    for i := 0 to FtableSize - 1 do
        FreeAndNil(FData[i]);
end;

end.

