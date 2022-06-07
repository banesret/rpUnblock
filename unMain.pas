unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  VCL.HTMLHelpViewer, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    actHelpContents: THelpContents;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    HelpContent1: TMenuItem;
    actStartGame: TAction;
    StartGame1: TMenuItem;
    pnlNavigator: TPanel;
    spDown: TSpeedButton;
    sbRight: TSpeedButton;
    sbLeft: TSpeedButton;
    sbUp: TSpeedButton;
    actDrawExitBlock: TAction;
    actDrawTable: TAction;
    actDrawBlock1: TAction;
    actDrawBlock2: TAction;
    actDrawBlock3: TAction;
    actDrawExitSegment: TAction;
    shpExitBlock: TShape;
    shpBlock1: TShape;
    shpBlock2: TShape;
    shpBlock3: TShape;
    shpExitSegment: TShape;
    shpTable: TShape;
    procedure FormCreate(Sender: TObject);
    procedure actHelpContentsExecute(Sender: TObject);
    procedure actStartGameExecute(Sender: TObject);
    procedure actDrawTableExecute(Sender: TObject);
    procedure actDrawBlock1Execute(Sender: TObject);
    procedure actDrawBlock2Execute(Sender: TObject);
    procedure actDrawBlock3Execute(Sender: TObject);
    procedure actDrawExitSegmentExecute(Sender: TObject);
    procedure actDrawExitBlockExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  unCMain;

  {$R *.dfm}

const
  z = 100; {zoom}
  e = 15; {edge}

procedure TMainForm.FormCreate(Sender: TObject);
begin
//  CApplication.Run;

  Application.HelpFile := ExtractFilePath(Application.ExeName) +
    'Help\Unblock.chm'
end;

procedure TMainForm.actDrawBlock1Execute(Sender: TObject);
begin
  with CBlock1 do
    shpBlock1.SetBounds(Left*z, Top*z, Width*z, Height*z);
end;

procedure TMainForm.actDrawBlock2Execute(Sender: TObject);
begin
  with CBlock2 do
    shpBlock2.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawBlock3Execute(Sender: TObject);
begin
  with CBlock3 do
    shpBlock3.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawExitBlockExecute(Sender: TObject);
begin
  with CExitBlock do
    shpExitBlock.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawExitSegmentExecute(Sender: TObject);
begin
  with CExitSegment do
    shpExitSegment.SetBounds(Left*z-e, Top*z, e, z)
end;

procedure TMainForm.actDrawTableExecute(Sender: TObject);
begin
  with CTable do
    shpTable.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actHelpContentsExecute(Sender: TObject);
begin
  Application.HelpContext(0)
end;

procedure TMainForm.actStartGameExecute(Sender: TObject);
begin
  CApplication.Initialize;

  {draw table}
  actDrawTableExecute(nil);
  shpTable.SendToBack;

  {draw blocks}
  actDrawExitBlockExecute(nil);
  actDrawBlock1Execute(nil);
  actDrawBlock2Execute(nil);
  actDrawBlock3Execute(nil);

  {draw exit segment}
  actDrawExitSegmentExecute(nil);
end;

end.
