int GridSize=4;
float GridMargin=0.05;
float TileSize;
float TileMargin=0.10;
PVector GameCenter;
float GameSize;
Grid grid;
float TileRound=5;
float GridRound=10;
color GridColor=color(184, 173, 161);
color[] TileColor=new color[12];
color[] TextColor=new color[2];
color Background=color(250, 247, 239);
int x=0;
boolean gameOver;
boolean gameWon;
int WinScore=64;
float move_speed=100;
void populateCol()
{
  TileColor[0]=color(203, 191, 179);
  TileColor[1]=color(237, 228, 219);
  TileColor[2]=color(242, 177, 121);
  TileColor[3]=color(245, 149, 99);
  TileColor[4]=color(246, 124, 95);
  TileColor[5]=color(246, 94, 59);
  TileColor[6]=color(237, 207, 114);
  TileColor[7]=color(237, 204, 98);
  TileColor[8]=color(237, 200, 80);
  TileColor[9]=color(237, 197, 62);
  TileColor[10]=color(237, 194, 46);
  TileColor[11]=color(60, 58, 50);
  TextColor[0]=color(137, 129, 121);
  TextColor[1]=color(250, 248, 245);
}
void setup()
{
  //fullScreen();
  size(400, 500);
  GameSize=width*(1-2*GridMargin);
  TileSize=(GameSize/GridSize)*(1-TileMargin);
  populateCol();
  //background(Background);
  GameCenter=new PVector(width/2.0, height-width/2.0);
  grid=new Grid();
  grid.allocTiles();
  grid.win();
  gameOver=false;
  gameWon=false;
}
void draw()
{
  background(Background);
  grid.showGrid();
  if (gameOver)
  {
    rectMode(CENTER);
    stroke(255);
    strokeWeight(10);
    fill(TileColor[0]);
    rect(GameCenter.x, GameCenter.y, width*(0.8), width*(0.25), width/20);
    textSize(width/10);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GAME OVER", GameCenter.x, GameCenter.y);
    noLoop();
  }
  if (gameWon)
  {
    rectMode(CENTER);
    stroke(255);
    strokeWeight(10);
    fill(TileColor[0]);
    rect(GameCenter.x, GameCenter.y, width*(0.8), width*(0.25), width/20);
    textSize(width/10);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GOT "+WinScore+" !!", GameCenter.x, GameCenter.y);
    noLoop();
  }
}
void keyPressed()
{
  if (keyCode==UP)
  {
    grid.setposUp();
  } else if (keyCode==DOWN)
  {
    grid.setposDown();
  } else if (keyCode==LEFT)
  {
    grid.setposLeft();
  } else if (keyCode==RIGHT)
  {
    grid.setposRight();
  }
}
