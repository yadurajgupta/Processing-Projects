int grid=5;
float ang=0;
float ang_val=0;
int i, j;
float small_change=0.01;
void setup()
{
  size(700, 700);
  background(0);
  ang=0;
  ang_val=0;
  stroke(255);
}
void draw()
{
  background(0);
  float cent=(width/(2*(grid+2)))+(width/(2*(grid+1)*(grid+2)));
  float grid_width=width/(grid+1);
  float r=(width/(2*(grid+2)));
  strokeWeight(2);
  for (i=1; i<=grid; i++)
  {
    strokeWeight(4);
    line(cent+i*(grid_width), cent, cent+i*(grid_width)+r*cos((i)*(ang_val)), cent+r*sin((i)*(ang_val)));
    line(cent, cent+i*(grid_width), cent+r*cos((i)*(ang_val)), cent+i*(grid_width)+r*sin((i)*(ang_val)));
    fill(255, 0, 255);
    strokeWeight(0);
    ellipse(cent+i*(grid_width)+r*cos((i)*(ang_val)), cent+r*sin((i)*(ang_val)), 8, 8);
    ellipse(cent+r*cos((i)*(ang_val)), cent+i*(grid_width)+r*sin((i)*(ang_val)), 8, 8);
  }
  stroke(100, 0, 100);
  strokeWeight(4);
  for (i=1; i<=grid; i++)
  {
    stroke(100, 0, 100);
    line(cent+i*(grid_width)+r*cos((i)*ang_val), 0, cent+i*(grid_width)+r*cos((i)*ang_val), height);
    line(0, cent+i*(grid_width)+r*sin((i)*ang_val), width, cent+i*(grid_width)+r*sin((i)*ang_val));
    stroke(100);
    line(i*(grid_width), 0, +i*(grid_width), height);
    line(0, +i*(grid_width), width, i*(grid_width));
  }
  cent=cent+grid_width;
  for (i=0; i<grid; i++)
  {
    float centx=cent+grid_width*i;
    for (j=0; j<grid; j++)
    {
      float centy=cent+grid_width*j;
      float valx=centx+r*cos((i+1)*ang_val);
      float valy=centy+r*sin((j+1)*ang_val);
      fill(255, 0, 255);
      ellipse(valx, valy, 8, 8);
    }
  }
  strokeWeight(2);
  stroke(255);
  ang=0;
  while (ang<=ang_val)
  {
    float cent_t=cent-grid_width;
    stroke(200);
    for (i=1; i<=grid; i++)
    {
      line(cent_t+i*(grid_width)+r*cos((i)*ang), cent_t+r*sin((i)*ang), cent_t+i*(grid_width)+r*cos((i)*(ang-small_change)), cent_t+r*sin((i)*(ang-small_change)));
      line(cent_t+r*cos((i)*ang), cent_t+i*(grid_width)+r*sin((i)*ang), cent_t+r*cos((i)*(ang-small_change)), cent_t+i*(grid_width)+r*sin((i)*(ang-small_change)));
    }
    stroke(255);
    for (i=0; i<grid; i++)
    {
      float centx=cent+grid_width*i;
      for (j=0; j<grid; j++)
      {

        float centy=cent+grid_width*j;
        float valxn=centx+r*cos((i+1)*ang);
        float valyn=centy+r*sin((j+1)*ang);
        float valxb=centx+r*cos((i+1)*(ang-small_change));
        float valyb=centy+r*sin((j+1)*(ang-small_change));
        line(valxb, valyb, valxn, valyn);
      }
    }
    ang+=small_change;
  }
  ang_val=ang_val+small_change;
  if (ang_val>TWO_PI)
  {
    noLoop();
  }
}
