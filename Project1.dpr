program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  EjectUSB in 'EjectUSB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'U�̵�������';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
