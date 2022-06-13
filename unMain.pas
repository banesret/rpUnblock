unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  VCL.HTMLHelpViewer, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    actList: TActionList;
    mmnMenu: TMainMenu;
    mniHelp: TMenuItem;
    mniHelpContent: TMenuItem;
    mniStartGame: TMenuItem;
    mniGame: TMenuItem;
    pnlDirections: TPanel;
    spDown: TSpeedButton;
    sbRight: TSpeedButton;
    sbLeft: TSpeedButton;
    sbUp: TSpeedButton;
    actHelpContents: THelpContents;
    actStartGame: TAction;
    actDrawExitBlock: TAction;
    actDrawTable: TAction;
    actDrawBlock1: TAction;
    actDrawBlock2: TAction;
    actDrawBlock3: TAction;
    actDrawExitSegment: TAction;
    actDraw: TAction;
    pnlTable: TPanel;
    shpBlock1: TShape;
    shpBlock2: TShape;
    shpBlock3: TShape;
    shpExitSegment: TShape;
    shpExitBlock: TShape;
    lblDirections: TLabel;
    rgrBlocks: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure actHelpContentsExecute(Sender: TObject);
    procedure actDrawTableExecute(Sender: TObject);
    procedure actDrawBlock1Execute(Sender: TObject);
    procedure actDrawBlock2Execute(Sender: TObject);
    procedure actDrawBlock3Execute(Sender: TObject);
    procedure actDrawExitSegmentExecute(Sender: TObject);
    procedure actDrawExitBlockExecute(Sender: TObject);
    procedure actDrawExecute(Sender: TObject);
    procedure actStartGameExecute(Sender: TObject);
    procedure sbRightClick(Sender: TObject);
    procedure spDownClick(Sender: TObject);
    procedure sbUpClick(Sender: TObject);
    procedure sbLeftClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  unMain.C;

  {$R *.dfm}

const
  z = 100; {zoom}
  e = 15; {edge}

procedure TMainForm.FormCreate(Sender: TObject);
begin
//  Application.HelpFile := ExtractFilePath(Application.ExeName) +
//    'Help\Unblock.chm';
  actStartGameExecute(nil)
end;

procedure TMainForm.sbLeftClick(Sender: TObject);
begin
  Application.Run(rgrBlocks.ItemIndex, Lefty);
  // no idea why can't work just Left
  actDrawExecute(nil)
end;

procedure TMainForm.sbRightClick(Sender: TObject);
begin
  with Application do
  begin
    FResult := False;
    Run(rgrBlocks.ItemIndex, Right);
    actDrawExecute(nil);
    if FResult then ShowMessage('Win!')
  end;
end;

procedure TMainForm.sbUpClick(Sender: TObject);
begin
  Application.Run(rgrBlocks.ItemIndex, Up);
  actDrawExecute(nil)
end;

procedure TMainForm.spDownClick(Sender: TObject);
begin
  Application.Run(rgrBlocks.ItemIndex, Down);
  actDrawExecute(nil)
end;

procedure TMainForm.actDrawExitBlockExecute(Sender: TObject);
begin
  with Blocks[0] do
    shpExitBlock.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawBlock1Execute(Sender: TObject);
begin
  with Blocks[1] do
    shpBlock1.SetBounds(Left*z, Top*z, Width*z, Height*z);
end;

procedure TMainForm.actDrawBlock2Execute(Sender: TObject);
begin
  with Blocks[2] do
    shpBlock2.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawBlock3Execute(Sender: TObject);
begin
  with Blocks[3] do
    shpBlock3.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawExecute(Sender: TObject);
begin
  {draw table}
  actDrawTableExecute(nil);
  pnlTable.SendToBack;

  {draw blocks}
  actDrawExitBlockExecute(nil);
  actDrawBlock1Execute(nil);
  actDrawBlock2Execute(nil);
  actDrawBlock3Execute(nil);

  {draw exit segment}
  actDrawExitSegmentExecute(nil);
end;

procedure TMainForm.actDrawExitSegmentExecute(Sender: TObject);
begin
  with ExitSegment do
    shpExitSegment.SetBounds(Left*z-e, Top*z, e, z)
end;

procedure TMainForm.actDrawTableExecute(Sender: TObject);
begin
  with Table do
    pnlTable.SetBounds(Left*z + 10, Top*z + 30, Width*z, Height*z)
end;

procedure TMainForm.actHelpContentsExecute(Sender: TObject);
begin
  Vcl.Forms.Application.HelpContext(0)
end;

procedure TMainForm.actStartGameExecute(Sender: TObject);
begin
  Application.Initialize;
  actDrawExecute(nil)
end;

end.
