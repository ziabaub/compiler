unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,StrUtils, FileCtrl , token , Keyword , Num ,Real, Tag ,hashtable,
  Lexero,parser,Env,Typ,id,expr,node,stmt,arr,rel,unary,arith,logical,nott,breakt,ifelse ,
  ifo,repeato,setarray,seto,stmtseq ,whilo,accesoo,constant,stack,foro,stringo,charo,typedata
  ,queue,boolval,createarr,consstring,constchar,reado,writo,comma ;

type
  int = integer ;
  TForm1 = class(TForm)
    Compiler: TButton;
    Button3: TButton;
    Code: TMemo;
    procedure Button3Click(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure CodeKeyPress(Sender: TObject; var Key: Char);
    procedure CompilerClick(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
implementation
{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
var
  selectedFile   : string;
  drive          : char;
  path : string;
  t              : TextFile;
  FileNme ,text , T1 : string;
begin
   if (Code.Hint = 'Enter Your Code' )then
   begin
      Code.Text:='';
      Code.Hint:='By File';
   end ;
   T1 :='';
  // Ask the user to select a file
  if PromptForFileName(selectedFile)
  then
  begin
       ProcessPath(selectedFile, drive, path , FileNme);
       AssignFile(t, selectedFile);
       Reset(t);
       while not eof(t) do
       begin
          Readln(t,text);
          Code.Text := Code.Text + text + sLineBreak;
       end;
        CloseFile(t);
    end;
end;

     
procedure TForm1.CodeClick(Sender: TObject);       
begin
if ((Code.Hint = 'Enter Your Code'))then   
begin
Code.Text:='';
Code.Hint:='By Hand ';
end;
end;

procedure TForm1.CodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TForm1.CompilerClick(Sender: TObject);
var

    test2 : Parsers;
    test : lexeros;
begin
    counter:=1;
    line:=1;
    MainCode := code.Lines.Text;
    Test:= lexeros.Create;
    test2:=Parsers.createP(test);
    test2.start();
    ShowMessage('succeful');

end;     


end.
