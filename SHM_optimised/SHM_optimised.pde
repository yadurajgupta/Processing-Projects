int rows, cols, i, j;
Curve curve[][];
float ang=0;
float grid, r, cent;
void setup()
{
  size(1280, 800, P2D);
  //fullScreen(P2D);
  grid=40;
  rows=floor(height/(grid+1));
  cols=floor(width/(grid+1));
  curve=new Curve[cols][rows];
  for (i=0; i<cols; i++)
  {
    for (j=0; j<rows; j++)
    {
      curve[i][j]=new Curve();
    }
  }
  cent=grid/2;
  r=((0.9)*grid)/2;
  background(0);
  stroke(255);
  strokeWeight(1);
}
void draw()
{
  background(0);
  noFill();
  for (i=0; i<rows; i++)
  {
    ellipse(cent, cent+grid*(i+1), 2*r, 2*r);
    fill(255);
    ellipse(cent+r*cos((i+1)*ang), cent+grid*(i+1)+r*sin((i+1)*ang), grid/10, grid/10);
    stroke(255, 100);
    line(0, cent+grid*(i+1)+r*sin((i+1)*ang), width, cent+grid*(i+1)+r*sin((i+1)*ang));
    stroke(255);
    noFill();
  }  
  for (i=0; i<cols; i++)
  {
    ellipse(cent+grid*(i+1), cent, 2*r, 2*r);
    fill(255);
    ellipse(cent+grid*(i+1)+r*cos((i+1)*ang), cent+r*sin((i+1)*ang), grid/10, grid/10);
    stroke(255, 100);
    line(cent+grid*(i+1)+r*cos((i+1)*ang), 0, cent+grid*(i+1)+r*cos((i+1)*ang), height);
    stroke(255);
    noFill();
  }
  //for (i=0; i<rows; i++)
  //{
  //  line(2*cent+i*grid, 0, 2*cent+i*grid, height);
  //}  
  //for (i=0; i<cols; i++)
  //{
  //  line(0, 2*cent+i*grid, width, 2*cent+i*grid);
  //}
  for (i=0; i<cols; i++)
  {
    float centx=cent+grid*(i+1);
    for (j=0; j<rows; j++)
    {
      float centy=cent+grid*(j+1);
      curve[i][j].setx(centx+r*cos((i+1)*ang));
      curve[i][j].sety(centy+r*sin((j+1)*ang));
      curve[i][j].update();
    //  curve[i][j].show();
    }
  }
  ang+=0.01;
  if (ang>TWO_PI)
  {
    background(0);
    noFill();
    for (i=0; i<cols; i++)
    {
      float centx=cent+grid*(i+1);
      for (j=0; j<rows; j++)
      {
        float centy=cent+grid*(j+1);
        curve[i][j].setx(centx+r*cos((i+1)*ang));
        curve[i][j].sety(centy+r*sin((j+1)*ang));
        curve[i][j].update();
        //curve[i][j].show();
      }
    }
    for (i=0; i<rows; i++)
    {
      ellipse(cent, cent+grid*(i+1), 2*r, 2*r);
    }  
    for (i=0; i<cols; i++)
    {
      ellipse(cent+grid*(i+1), cent, 2*r, 2*r);
    }
    for (i=0; i<cols; i++)
    {
      for (j=0; j<rows; j++)
      {
        curve[i][j].show_end();
        curve[i][j]=new Curve();
      }
    }
    saveFrame("DONE.jpg");
    ang=0;
  }
}
