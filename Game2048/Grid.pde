class Grid
{
  Tile[][] T=new Tile[GridSize][GridSize];
  boolean move=false;
  void allocTiles()
  {
    for (int i=0; i<GridSize; i++)
    {
      for (int j=0; j<GridSize; j++)
      {
        T[i][j]=new Tile();
      }
    }
    int x1=floor(random(GridSize-0.99));
    int y1=floor(random(GridSize-0.99));
    int x2=floor(random(GridSize-0.99)); 
    int y2=floor(random(GridSize-0.99));
    T[x1][y1].set_num(2);
    T[x2][y2].set_num(2);
    //T[0][0].set_num(2);
    //T[0][1].set_num(2);
    //T[0][2].set_num(2);
    //T[0][3].set_num(2);
    //T[0][4].set_num(2);
    //T[0][5].set_num(2);
    //T[0][6].set_num(2);
    //T[0][7].set_num(2);
  }
  void showTiles()
  {

    for (int i=0; i<GridSize; i++)
    {
      for (int j=0; j<GridSize; j++)
      {
        T[i][j].set_pos(new PVector(i, j));
        T[i][j].show();
      }
    }
  }
  void afterkeyPressed()
  {
    int x1=floor(random(GridSize-0.99));
    int y1=floor(random(GridSize-0.99));
    while (T[x1][y1].get_num()!=0)
    {
      x1=floor(random(GridSize-0.99));
      y1=floor(random(GridSize-0.99));
    }
    T[x1][y1].set_num(2);
  }
  void showGrid()
  {
    fill(GridColor);
    noStroke();
    rectMode(CENTER);
    rect(GameCenter.x, GameCenter.y, GameSize, GameSize, GridRound);
    showTiles();
  }
  void setposUp()
  {
    int change=0;
    for (int j=1; j<GridSize; j++)
    {
      for (int i=0; i<GridSize; i++)
      {
        if (T[i][j].get_num()!=0)
        {
          int jm=j-1;
          int im=i;
          while (jm>=0 && T[im][jm].get_num()==0)
          {
            jm--;
          }   
          jm++;
          if (jm!=j)
          {
            change=1;
            T[im][jm].set_num(T[i][j].get_num());
            T[i][j].set_num(0);
          }
          if (jm!=0)
          {
            if (T[im][jm].get_num()==T[im][jm-1].get_num())
            {
              change=1;
              T[im][jm-1].set_num((int)T[im][jm].get_num()*2);
              T[im][jm].set_num(0);
            }
          }
        }
      }
    }
    gameOver=grid.check();
    gameWon=grid.win();
    if (change==1)
      grid.afterkeyPressed();
  }
  void setposDown()//j=GridSize-1 i=0;
  {
    int change=0;
    for (int j=GridSize-1; j>=0; j--)
    {
      for (int i=0; i<GridSize; i++)
      {
        if (T[i][j].get_num()!=0)
        {
          int jm=j+1;
          int im=i;
          while (jm<=GridSize-1 && T[im][jm].get_num()==0)
          {
            jm++;
          }   
          jm--;
          if (jm!=j)
          {
            change=1;
            T[im][jm].set_num(T[i][j].get_num());
            T[i][j].set_num(0);
          }
          if (jm!=GridSize-1)
          {
            if (T[im][jm].get_num()==T[im][jm+1].get_num())
            {
              change=1;
              T[im][jm+1].set_num((int)T[im][jm].get_num()*2);
              T[im][jm].set_num(0);
            }
          }
        }
      }
    }
    gameWon=grid.win();
    gameOver=grid.check();
    if (change==1)
      grid.afterkeyPressed();
  }
  void setposLeft()
  {
    int change=0;
    for (int j=1; j<GridSize; j++)
    {
      for (int i=0; i<GridSize; i++)
      {
        if (T[j][i].get_num()!=0)
        {
          int jm=j-1;
          int im=i;
          while (jm>=0 && T[jm][im].get_num()==0)
          {
            jm--;
          }   
          jm++;
          if (jm!=j)
          {
            change=1;
            T[jm][im].set_num(T[j][i].get_num());
            T[j][i].set_num(0);
          }
          if(jm!=0)
          {
            if (T[jm][im].get_num()==T[jm-1][im].get_num())
            {
              change=1;
              T[jm-1][im].set_num((int)T[jm][im].get_num()*2);
              T[jm][im].set_num(0);
            }
          }
        }
      }
    }
    gameOver=grid.check();
    gameWon=grid.win();
    if (change==1)
      grid.afterkeyPressed();
  }
  void setposRight()//j=GridSize-1 i=0;
  {
    int change=0;
    for (int j=GridSize-1; j>=0; j--)
    {
      for (int i=0; i<GridSize; i++)
      {
        if (T[j][i].get_num()!=0)
        {
          int jm=j+1;
          int im=i;
          while (jm<=GridSize-1 && T[jm][im].get_num()==0)
          {
            jm++;
          }   
          jm--;
          if (jm!=j)
          {
            change=1;
            T[jm][im].set_num(T[j][i].get_num());
            T[j][i].set_num(0);
          }
          if(jm!=GridSize-1)
          {
            if (T[jm][im].get_num()==T[jm+1][im].get_num())
            {
              change=1;
              T[jm+1][im].set_num((int)T[jm][im].get_num()*2);
              T[jm][im].set_num(0);
            }
          }
        }
      }
    }
    gameOver=grid.check();
    gameWon=grid.win();
    if (change==1)
      grid.afterkeyPressed();
  }
  boolean check()
  {
    for (int i=0; i<GridSize; i++)
    {
      for (int j=0; j<GridSize; j++)
      {
        if (T[i][j].get_num()==0)
        {
          return false;
        }
      }
    }
    for (int i=0; i<GridSize; i++)
    {
      for (int j=0; j<GridSize; j++)
      {   
        if (i!=GridSize-1)
        {
          if (T[i][j].get_num()==T[i+1][j].get_num())
          {
            return false;
          }
        }
        if (i!=0)
        {
          if (T[i][j].get_num()==T[i-1][j].get_num())
          {
            return false;
          }
        }
        if (j!=GridSize-1)
        {
          if (T[i][j].get_num()==T[i][j+1].get_num())
          {
            return false;
          }
        }
        if (j!=0)
        {
          if (T[i][j].get_num()==T[i][j-1].get_num())
          {
            return false;
          }
        }
      }
    }
    return true;
  }
  boolean win()
  {
    for (int i=0; i<GridSize; i++)
    {
      for (int j=0; j<GridSize; j++)
      {
        if (T[i][j].get_num()==WinScore)
        {
          return true;
        }
      }
    }
    return false;
  }
}
