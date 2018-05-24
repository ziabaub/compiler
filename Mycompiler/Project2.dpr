program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Real in 'Real.pas',
  Token in 'Token.pas',
  consstring in 'consstring.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.                                    
