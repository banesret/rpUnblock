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
      FLevel: Byte;
    property Level: Byte read FLevel write Flevel;
    procedure Initialize1;
    procedure Initialize2;
    procedure CreateForm;
    procedure Run(i: Byte; Directions: TDirections);
  end;

var
  Application: TApplication;
  Table, ExitSegment: TRect;
  Blocks: array of TRect;

implementation

procedure TApplication.Initialize1;
begin
{$INCLUDE 'Map1.inc'}
end;

procedure TApplication.Initialize2;
begin
{$INCLUDE 'Map2.inc'}
end;

procedure TApplication.CreateForm;
begin
end;

procedure TApplication.Run;
  var
    P: TPoint;
  function Blocked: Boolean;
    var
      i: Byte;
  begin
    Result := false;
    for i := 0 to Length(Blocks)-1
      do Result := Result or Blocks[i].Contains(P)
  end;
begin
  P := Blocks[i].Location;
  {horizontal movement left}
  if (Blocks[i].Width <> 1) and (Directions = Lefty) then
    {block not on left edge}
    if Blocks[i].Left > 0 then
      begin
        P.Offset(-1, 0);
        if not Blocked then Blocks[i].Offset(-1, 0)
      end;

  {horizontal movement right}
  if (Blocks[i].Width <> 1) and (Directions = Right) then
    {block not on right edge}
    if Blocks[i].Right <= 3 then
      begin
        P.Offset(Blocks[i].Width, 0);
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
        P.Offset(0, Blocks[i].Height);
        if not Blocked then Blocks[i].Offset(0, 1)
      end;

  {vertical movement up}
  if (Blocks[i].Height <> 1) and (Directions = Up) then
    {block not on up edge}
    if Blocks[i].Top > 0 then
      begin
        P.Offset(0, -1);
        if not Blocked then Blocks[i].Offset(0, -1)
      end;
end;

end.
