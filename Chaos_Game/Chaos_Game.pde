ArrayList<PVector> points=new ArrayList<PVector>();
int num=5;
int len;
float x, y;
int choice_prev;
int l=0;
int points_per_frame=1000;
void setup()
{
  //size(400, 400);
  fullScreen();
  float ang=TWO_PI/num;
  len=min(width, height)/2;
  PVector p=new PVector(len, 0);
  for (int i=0; i<num; i++)
  {
    p.rotate(ang);
    PVector P=new PVector();
    P=p.copy();
    points.add(P);
  }
  x=random(width);
  x=random(height);
  background(0);
  choice_prev=0;
  l=0;
  int count=0;
  translate(width/2,height/2);
  for (PVector P : points)
  {
    strokeWeight(8);
    colorMode(HSB);
    stroke(count*255/num, 255, 255);
    point(P.x, P.y);
    count++;
  }
}
void draw()
{
  translate(width/2, height/2);
  while (l<points_per_frame)
  {
    int choice=floor(random(num-0.001));
    while (choice==choice_prev)
    {
      choice=floor(random(num-0.001));
    }
    choice_prev=choice;
    x=lerp(x, points.get(choice).x, 0.5);
    y=lerp(y, points.get(choice).y, 0.5);
    strokeWeight(1);
    //colorMode(HSB);
    //stroke(choice*255/num, 255, 255,100);
    point(x, y);
    l++;
  }
  l=0;
}
