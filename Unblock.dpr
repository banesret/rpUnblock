program Unblock;

uses
  Vcl.Forms,
  unMain in 'unMain.pas',
  unCMain in 'unCMain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
