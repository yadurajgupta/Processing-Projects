QuadTree QT;
void setup()
{
  fullScreen();
  //size(800, 800);
  Boundary B=new Boundary(width/2, height/2, width, height);
  QT=new QuadTree(B, 4);
  for (int i=0; i<5000; i++)
  {
    QT.insert(new Point(random(width), random(height)));
  }
}
void draw()
{
  background(0);
  QT.show();
  Boundary B=new Boundary(mouseX, mouseY, 200, 200);
  B.highLight();
  ArrayList<Point> points=QT.query(B);
  for (Point P : points)
  {
    P.highLight();
  }
}
void mouseDragged()
{
  for(int i=0;i<5;i++)
  QT.insert(new Point(mouseX+random(20),mouseY+random(20)));
}
