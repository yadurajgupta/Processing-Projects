class Tile
{
  int num=0;
  int numn=0;
  PVector pos=new PVector(0, 0, 0);
  PVector posn=new PVector(0, 0, 0);
  PVector post=new PVector(0, 0, 0);
  color tilecol;
  color textcol;
  void ini(int num_, PVector pos_)
  {
    num=num_;
    pos.set(pos_);
  }
  void show()
  {
    PVector cent=new PVector(width*(GridMargin), height-(width*(1-GridMargin)));
    float margin=(GameSize-GridSize*TileSize)/((float)(GridSize+1));
    float jump=margin+TileSize;
    cent.add(new PVector(margin+TileSize/2, margin+TileSize/2));
    PVector centN=new PVector();
    centN.set(cent);
    centN.add(new PVector(pos.x*jump, pos.y*jump));
    rectMode(CENTER);
    fill(tilecol);
    set_col();
    rect(centN.x, centN.y, TileSize, TileSize, TileRound);
    if (num!=0)
    {
      textSize(TileSize*0.5);
      fill(textcol);
      textAlign(CENTER, CENTER);
      text(num, centN.x, centN.y);
    }
  }
  void set_num(int num_)
  {
    num=num_;
  }
  int get_num()
  {
    return num;
  }
  void set_pos(PVector pos_)
  {
    pos.set(pos_);
  }
  void set_col()
  {
    int k=0;
    while (num>floor(pow(2, k)) && k<11)
    {
      k++;
    }
    tilecol=TileColor[k];
    textcol=TextColor[1];
    if (k<3)
    {
      textcol=TextColor[0];
    }
  }
  void move()
  {
   //PVector move_dist=new PVector(pos.x-post.y);
  }
}
