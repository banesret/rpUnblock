program Unblock;

uses
  Vcl.Forms,
  VCL.HTMLHelpViewer,
  unMain in 'unMain.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
