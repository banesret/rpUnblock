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
 
  
