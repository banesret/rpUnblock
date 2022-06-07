unit unCMain;

interface

uses
  System.Classes, System.Types;

type
  TCApplication = record
    procedure Initialize;
    procedure CreateForm;
    procedure Run;
  end;

var
  CApplication: TCApplication;
  CTable, CExitBlock, CBlock1, CBlock2, CBlock3, CExitSegment: TRect;

type
  Directions = (Left, Right, Up, Down);

implementation
var
  Selector1: Char;
  Selector2: Char;

procedure TCApplication.initialize;
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
  BlockX: TRect;
  DirectionX: Directions;
  L: TPoint; {new potential location}
  Blocked: Boolean;
begin
  // read a block
  Readln(Selector1);
  case Selector1 of
    '1': BlockX := CBlock1;
    '2': BlockX := CBlock2;
    '3': BlockX := CBlock3;
    '4':  BlockX := CExitBlock
  end;

  // read a direction
  Readln(Selector2);
  case Selector2 of
    '1': DirectionX := Left;
    '2': DirectionX := Right;
    '3': DirectionX := Up;
    '4': DirectionX := Down
  end;
  L := BlockX.Location; {not the same address due to property read method}
  {hotizontal movement is true}
  if BlockX.Width <> 1 then
    if DirectionX = Left then
      {block not on left edge}
      if L.X > 0 then
        begin
          L.X := L.X - 1;
          Blocked :=
            CBlock1.Contains(L) or
            CBlock2.Contains(L) or
            CBlock3.Contains(L) or
            CExitBlock.Contains(L);
          if not Blocked then
            begin
              case Selector1 of
                '1': CBlock1.SetLocation(L);
                '2': CBlock2.SetLocation(L);
                '3': CBlock3.SetLocation(L);
                '4': CExitBlock.SetLocation(L)
              end;
            end;
        end;
//
//
//      if DirectionX = Right then
//
//   {horizontal movement is false}
//   else

        ;
  Readln
end;

end.
