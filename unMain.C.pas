unit unMain.C;

interface

uses
  System.Classes, System.Types,
  System.Generics.Collections;

type
  TApplication = record
    type
      TDirections = (Lefty, Right, Up, Down);
      PTRect = ^TRect;
    var
      FResult: Boolean;
    procedure Initialize;
    procedure CreateForm;
    procedure Run(i: Byte; Directions: TDirections);
  end;

var
  Application: TApplication;
  {TODO -oOwner -cGeneral : this should be replaced with TList}
  Table, ExitBlock, Block1, Block2, Block3, ExitSegment: TRect;
  {no TComponents nor TObjectList because TRect is not an object}
  Blocks: array of TRect;

implementation

procedure TApplication.Initialize;
begin
{TODO -oOwner -cGeneral : Introduced Map1.inc.}
//{$INCLUDE 'Map1.inc'}
  SetLength(Blocks, 4);

 {ExitBlock definition}
  Blocks[0].SetLocation(0, 1);
  Blocks[0].Width := 2;
  Blocks[0].Height := 1;

  {Block1 definition}
  Blocks[1].SetLocation(2, 0);
  Blocks[1].Width := 1;
  Blocks[1].Height := 2;

  {Block2 definition}
  Blocks[2].SetLocation(1, 2);
  Blocks[2].Width := 2;
  Blocks[2].Height := 1;

  {Block3 definition}
  Blocks[3].SetLocation(2, 3);
  Blocks[3].Width := 2;
  Blocks[3].Height := 1;

  {Table definition}
  Table.SetLocation(0, 0);
  Table.Width := 4;
  Table.Height := 4;

  {ExitSegment definition}
  ExitSegment.SetLocation(4, 1);
  ExitSegment.Width := 1;
  ExitSegment.Height := 1;
end;

procedure TApplication.CreateForm;
begin
end;

procedure TApplication.Run;
var
  P: TPoint;
  Blocked: Boolean;
begin
  P := Blocks[i].Location;
  {horizontal movement left}
  if (Blocks[i].Width <> 1) and (Directions = Lefty) then
    {block not on left edge}
    if Blocks[i].Left > 0 then
      begin
        P.Offset(-1, 0);
        Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Blocks[i].Offset(-1, 0)
      end;

  {horizontal movement right}
  if (Blocks[i].Width <> 1) and (Directions = Right) then
    {block not on right edge}
    if Blocks[i].Right <= 3 then
      begin
        P.Offset(Blocks[i].Width, 0);
        Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Blocks[i].Offset(1, 0)
      end
    {block on right edge}
    else
      {block is exit block}
      if Blocks[i] = Blocks[0] then
        begin
          P.Offset(Blocks[i].Width, 0);
          {exit segment contains P}
          if ExitSegment.Contains(P) then
            begin
              Blocks[i].Offset(1, 0);
              FResult := true;
            end
        end;

  {vertical movement down}
  if (Blocks[i].Height <> 1) and (Directions = Down) then
    {block not on down edge}
    if Blocks[i].Bottom <= 3 then
      begin
        P.Offset(0, Block1.Height);
         Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Blocks[i].Offset(0, 1)
      end;

  {vertical movement up}
  if (Blocks[i].Height <> 1) and (Directions = Up) then
    {block not on up edge}
    if Blocks[i].Top > 0 then
      begin
        P.Offset(0, -1);
        Blocked :=
          Block1.Contains(P) or
          Block2.Contains(P) or
          Block3.Contains(P) or
          ExitBlock.Contains(P);
        if not Blocked then Blocks[i].Offset(0, -1)
      end;
end;

end.
