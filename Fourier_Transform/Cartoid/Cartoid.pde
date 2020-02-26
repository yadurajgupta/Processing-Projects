float r;
int num=200;
float fac=16;
void setup()
{
  //size(400,400);
  fullScreen();
  r=(min(width, height)/2)*(0.9);
}
void draw()
{
  frameRate(120);
  stroke(255);
  background(0);
  translate(width/2, height/2);
  strokeWeight(2);
  noFill();
  //ellipse(0, 0, 2*r, 2*r);
  rotate(PI);
  strokeWeight(1);
  //num=floor(100*fac);
  for (int j=0; j<num; j++)
  {
    float ang1, ang2;
    ang1=j*TWO_PI/num;
    ang2=((fac*j)%num)*TWO_PI/num;
    colorMode(HSB);
    //stroke(((2*(float)j*255.0)/((float)num))%255,255,255);
    line(r*cos(ang1), r*sin(ang1), r*cos(ang2), r*sin(ang2));
  }
  rotate(-PI);
  text(fac, 0, height/2-20);
  //fac+=0.02;
  //stroke(255, 0, 0);
  //line(0, 0, r, 0);
}
void keyPressed()
{
  if (keyCode==SHIFT)
  {
    fac+=0.5;
  } else if (keyCode==ENTER)
  {
    fac-=0.5;
    if (fac<=0)
    {
      fac=0.5;
    }
  } else if (keyCode==UP)
  {
    fac+=0.01;
  } else if (keyCode==DOWN)
  {
    fac-=0.01;
  }
}
