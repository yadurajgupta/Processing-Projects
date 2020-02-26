float len=200.0;
int initialrate;
int count=0;
ArrayList<Circle> circles=new ArrayList<Circle>();
float fac=0.5;
float speed=50.0/(fac);
Circle root;
int num=1000;
ArrayList<Float> A=new ArrayList<Float>();
void setup()
{
  //size(600,600);
  fullScreen();
  root=new Circle(1, new PVector(-width/2+len, 0));
  circles.add(root);
  while (count<num)
  {
    circles.add((circles.get(circles.size()-1)).make_child());
    count++;
  }
  strokeWeight(2);
  stroke(255);
}
void draw()
{
  background(0);
  translate(width/2, height/2);
  root.show();
  Circle C=circles.get(circles.size()-1);
  A.add(C.center_child.y);
  float X=(-width/2)+(2.0*len);
  beginShape();
  noFill();
  line(C.center_child.x, C.center_child.y, X, C.center_child.y);
  for (int i=A.size()-1; i>=0; i--)
  {
    vertex(X, A.get(i));
    X+=2.0*(fac);
    if (X>width/2)
    {
      A.remove(0);
      break;
    }
  }
  println(A.size());
  endShape();
}
