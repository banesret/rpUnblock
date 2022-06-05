unit unMain; // Unit1 renamed to unMain

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  VCL.HTMLHelpViewer, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Menus;

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    HelpContents1: THelpContents;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    HelpContent1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure HelpContents1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'Help\Unblock.chm';
end;

procedure TMainForm.HelpContents1Execute(Sender: TObject);
begin
  Application.HelpContext(0)
end;

end.
