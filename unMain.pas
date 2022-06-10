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
    Panel1: TPanel;
    rbtExitBlock: TRadioButton;
    rbtBlock1: TRadioButton;
    rbtBlock2: TRadioButton;
    rbtBlock3: TRadioButton;
    lblDirections: TLabel;
    lblBlocks: TLabel;
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
  unCMain;

  {$R *.dfm}

const
  z = 100; {zoom}
  e = 15; {edge}

procedure TMainForm.FormCreate(Sender: TObject);
begin
//  Application.HelpFile := ExtractFilePath(Application.ExeName) +
//    'Help\Unblock.chm';
  rbtBlock1.Checked := True;
  actStartGameExecute(nil)
end;

procedure TMainForm.sbLeftClick(Sender: TObject);
begin
  if rbtExitBlock.Checked then CApplication.Run(@ExitBlock, Lefty)
  else if rbtBlock1.Checked then CApplication.Run(@Block1, Lefty)
       else if rbtBlock2.Checked then CApplication.Run(@Block2, Lefty)
            else if rbtBlock3.Checked then CApplication.Run(@Block3, Lefty);
  // no idea why can't work just Left
  actDrawExecute(nil)
end;

procedure TMainForm.sbRightClick(Sender: TObject);
begin
  CApplication.FResult := False;
  if rbtExitBlock.Checked then CApplication.Run(@ExitBlock, Right)
  else if rbtBlock1.Checked then CApplication.Run(@Block1, Right)
       else if rbtBlock2.Checked then CApplication.Run(@Block2, Right)
            else if rbtBlock3.Checked then CApplication.Run(@Block3, Right);
  actDrawExecute(nil);
  if CApplication.FResult then ShowMessage('Win!')
end;

procedure TMainForm.sbUpClick(Sender: TObject);
begin
  if rbtExitBlock.Checked then CApplication.Run(@ExitBlock, Up)
  else if rbtBlock1.Checked then CApplication.Run(@Block1, Up)
       else if rbtBlock2.Checked then CApplication.Run(@Block2, Up)
            else if rbtBlock3.Checked then CApplication.Run(@Block3, Up);
  actDrawExecute(nil)
end;

procedure TMainForm.spDownClick(Sender: TObject);
begin
  if rbtExitBlock.Checked then CApplication.Run(@ExitBlock, Down)
  else if rbtBlock1.Checked then CApplication.Run(@Block1, Down)
       else if rbtBlock2.Checked then CApplication.Run(@Block2, Down)
            else if rbtBlock3.Checked then CApplication.Run(@Block3, Down);
  actDrawExecute(nil)
end;

procedure TMainForm.actDrawBlock1Execute(Sender: TObject);
begin
  with Block1 do
    shpBlock1.SetBounds(Left*z, Top*z, Width*z, Height*z);
end;

procedure TMainForm.actDrawBlock2Execute(Sender: TObject);
begin
  with Block2 do
    shpBlock2.SetBounds(Left*z, Top*z, Width*z, Height*z)
end;

procedure TMainForm.actDrawBlock3Execute(Sender: TObject);
begin
  with Block3 do
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

procedure TMainForm.actDrawExitBlockExecute(Sender: TObject);
begin
  with ExitBlock do
    shpExitBlock.SetBounds(Left*z, Top*z, Width*z, Height*z)
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
  Application.HelpContext(0)
end;

procedure TMainForm.actStartGameExecute(Sender: TObject);
begin
  CApplication.Initialize;
  actDrawExecute(nil)
end;

end.
