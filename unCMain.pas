unit unCMain;

interface

uses
  System.Classes, System.Types;

type
  TCApplication = record
    type
      TDirections = (Lefty, Right, Up, Down);
      PTRect = ^TRect;
    var
      FResult: Boolean;
    procedure Initialize;
    procedure CreateForm;
    procedure Run(Block: PTRect; Directions: TDirections);
  end;

var
  CApplication: TCApplication;
  CTable, CExitBlock, CBlock1, CBlock2, CBlock3, CExitSegment: TRect;

implementation

procedure TCApplication.Initialize;
begin
  {Table definition}
  CTable.SetLocation(0, 0);
  CTable.Width := 4;
  CTable.Height := 4;

  {Block1 definition}
  CBlock1.SetLocation(2, 0);
  CBlock1.Width := 1;
  CBlock1.Height := 2;

  {Block2 definition}
  CBlock2.SetLocation(1, 2);
  CBlock2.Width := 2;
  CBlock2.Height := 1;

  {Block3 definition}
  CBlock3.SetLocation(2, 3);
  CBlock3.Width := 2;
  CBlock3.Height := 1;

  {ExitBlock definition}
  CExitBlock.SetLocation(0, 1);
  CExitBlock.Width := 2;
  CExitBlock.Height := 1;

  {ExitSegment definition}
  CExitSegment.SetLocation(4, 1);
  CExitSegment.Width := 1;
  CExitSegment.Height := 1;
end;

procedure TCApplication.CreateForm;
begin
end;

procedure TCApplication.Run;
var
  P: TPoint;
  Blocked: Boolean;
begin
  P := Block.Location;

  {horizontal movement left}
  if (Block.Width <> 1) and (Directions = Lefty) then
    {block not on left edge}
    if Block.Left > 0 then
      begin
        P.Offset(-1, 0);
        Blocked :=
          CBlock1.Contains(P) or
          CBlock2.Contains(P) or
          CBlock3.Contains(P) or
          CExitBlock.Contains(P);
        if not Blocked then Block.Offset(-1, 0)
      end;

  {horizontal movement right}
  if (Block.Width <> 1) and (Directions = Right) then
    {block not on right edge}
    if Block.Right <= 3 then
      begin
        P.Offset(Block.Width, 0);
        Blocked :=
          CBlock1.Contains(P) or
          CBlock2.Contains(P) or
          CBlock3.Contains(P) or
          CExitBlock.Contains(P);
        if not Blocked then Block.Offset(1, 0)
      end
    {block on right edge}
    else
      {block is exit block}
      if Block = @CExitBlock then
        {block and exit segment are at the same vertical level}
        if Block.Top = CExitSegment.Top then
        begin
          Block.Offset(1, 0);
          FResult := true;
        end;

  {vertical movement down}
  if (Block.Height <> 1) and (Directions = Down) then
    {block not on down edge}
    if Block.Bottom <= 3 then
      begin
        P.Offset(0, CBlock1.Height);
         Blocked :=
          CBlock1.Contains(P) or
          CBlock2.Contains(P) or
          CBlock3.Contains(P) or
          CExitBlock.Contains(P);
        if not Blocked then Block.Offset(0, 1)
      end;

  {vertical movement up}
  if (Block.Height <> 1) and (Directions = Up) then
    {block not on up edge}
    if Block.Top > 0 then
      begin
        P.Offset(0, -1);
        Blocked :=
          CBlock1.Contains(P) or
          CBlock2.Contains(P) or
          CBlock3.Contains(P) or
          CExitBlock.Contains(P);
        if not Blocked then Block.Offset(0, -1)
      end;
end;

end.
