program Unblock;

uses
  unMain.C in 'unMain.C.pas', {must be above Forms because of Application}
  Vcl.Forms,
  unMain in 'unMain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
