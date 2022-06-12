unit unMain.C;

interface

uses
  System.Classes, System.Types,
  System.Contnrs;

type
  TApplication = record
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
  Application: TApplication;
  {TODO -oOwner -cGeneral : this should be replaced with TList}
  Table, ExitBlock, Block1, Block2, Block3, ExitSegment: TRect;
  {no TComponents nor TObjectList because TRect is not an object}
  Blocks: TList;

implementation

procedure TApplication.Initialize;
begin
{TODO -oOwner -cGeneral : Introduced Map1.inc.}
//{$INCLUDE 'Map1.inc'}

 {ExitBlock definition}
  ExitBlock.SetLocation(0, 1);
  ExitBlock.Width := 2;
  ExitBlock.Height := 1;
  Blocks.Add(@ExitBlock);

  {Block1 definition}
  Block1.SetLocation(2, 0);
  Block1.Width := 1;
  Block1.Height := 2;
  Blocks.Add(@Block1);

  {Block2 definition}
  Block2.SetLocation(1, 2);
  Block2.Width := 2;
  Block2.Height := 1;
  Blocks.Add(@Block2);

  {Block3 definition}
  Block3.SetLocation(2, 3);
  Block3.Width := 2;
  Block3.Height := 1;
  Blocks.Add(@Block3);

  {Table definition}
  Table.SetLocation(0, 0);
  Table.Width := 4;
  Table.Height := 4;
  Blocks.Add(@Table);

  {ExitSegment definition}
  ExitSegment.SetLocation(4, 1);
  ExitSegment.Width := 1;
  ExitSegment.Height := 1;
  Blocks.Add(@ExitSegment);
end;

procedure TApplication.CreateForm;
begin
end;

procedure TApplication.Run;
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
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Block.Offset(-1, 0)
      end;

  {horizontal movement right}
  if (Block.Width <> 1) and (Directions = Right) then
    {block not on right edge}
    if Block.Right <= 3 then
      begin
        P.Offset(Block.Width, 0);
        Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Block.Offset(1, 0)
      end
    {block on right edge}
    else
      {block is exit block}
      if Block = @ExitBlock then
        begin
          P.Offset(Block.Width, 0);
          {exit segment contains P}
          if ExitSegment.Contains(P) then
            begin
              Block.Offset(1, 0);
              FResult := true;
            end
        end;

  {vertical movement down}
  if (Block.Height <> 1) and (Directions = Down) then
    {block not on down edge}
    if Block.Bottom <= 3 then
      begin
        P.Offset(0, Block1.Height);
         Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Block.Offset(0, 1)
      end;

  {vertical movement up}
  if (Block.Height <> 1) and (Directions = Up) then
    {block not on up edge}
    if Block.Top > 0 then
      begin
        P.Offset(0, -1);
        Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Block.Offset(0, -1)
      end;
end;

initialization
Blocks := TObjectList.Create;

finalization
Blocks.Free

end.
