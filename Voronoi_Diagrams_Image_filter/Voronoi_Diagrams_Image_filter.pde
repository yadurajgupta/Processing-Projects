float r=0;
ArrayList<Circle> circles=new ArrayList<Circle>();
int num=10000;
PImage img;
void preload()
{
  img=loadImage("Sky_4928_3264.jpg");
}
void setup()
{
  size(1232, 408);
  background(255);
  preload();
  image(img, 0, 0, width/2, height);
  colorMode(HSB);
  float dencity=sqrt((width/2)*height/num)*(0.75);
  for (int i=0; i<num; i++)
  {
    Circle cir=new Circle();
    for (int j=0; j<i; j++)
    {
      if (cir.pos.dist(circles.get(j).pos)<dencity)
      {
        cir=new Circle();
        j=-1;
      }
    }
    cir.set_col();
    circles.add(cir);
  }
  merge_sort_startp(circles);
  //stroke(1);
  //strokeWeight(1);
  //beginShape();
  //for (Circle C : circles)
  //{
  //  vertex(C.pos.x,C.pos.y);
  //  C.show();
  //}
  //endShape();
}
void draw()
{
  img.loadPixels();
  colorMode(HSB);
  for (Circle c : circles)
  {
    c.show();
  }
  for (int i=width/2; i<width; i++)
  {
    for (int j=0; j<height; j++)
    {
      color col=color(0, 0, 0);
      float min=0;
      boolean isone=true;
      for (Circle c : circles)
      {
        float l=c.dist_sq(new PVector(i, j));
        if (isone)
        {
          min=l;
          col=c.col;
          isone=false;
        } else if (min>l)
        {
          min=l;
          col=c.col;
        }
      }
      stroke(col);
      strokeWeight(1);
      point(i, j);
    }
  }
  noLoop();
  saveFrame("Image_Filter"+random(100));
}
void mousePressed()
{
  background(0);
  image(img, 0, 0);
  float x=mouseX;
  float y=mouseY;
  boolean isone=true;
  float min=0;
  Circle s=new Circle();
  for (Circle c : circles)
  {
    float l=c.dist_sq(new PVector(x, y));
    if (isone)
    {
      min=l;
      isone=false;
      s=c;
    } else if (min>l)
    {
      min=l;
      s=c;
    }
  }
  circles.remove(s);
  s=new Circle();
  s.set_col();
  circles.add(s);
}
