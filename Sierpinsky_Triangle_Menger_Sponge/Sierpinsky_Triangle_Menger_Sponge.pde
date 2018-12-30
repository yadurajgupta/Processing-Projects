import peasy.*;

Tetrahedron shape;
float base_len=500;
float x=0;
ArrayList<Tetrahedron> shapes=new ArrayList<Tetrahedron>();
PeasyCam camera;
void setup()
{
  size(800, 800, P3D);
  background(100);
  shape=new Tetrahedron();
  camera=new PeasyCam(this, 800);
  shape.ini(new PVector(0, 0, 0), base_len);
  shapes.add(shape);
}
void draw()
{
  background(100);
  camera();
  pointLight(255, 240, 190, 0, -500, 1000);
  camera.feed();
  //translate(width/2, height/2);
  //rotateX(x);  
  //rotateY(0.8*x);  
  //rotateZ(0.2*x);
  x+=0.01;
  for (Tetrahedron a : shapes)
  {
    a.show();
  }
}
void mousePressed()
{
  //ArrayList<Tetrahedron> temp=new ArrayList<Tetrahedron>();
  //for (Tetrahedron a : shapes)
  //{
  //  temp.addAll(a.make_child());
  //}
  //shapes.clear();
  //shapes.addAll(temp);
}
void keyPressed()
{
  ArrayList<Tetrahedron> temp=new ArrayList<Tetrahedron>();
  for (Tetrahedron a : shapes)
  {
    temp.addAll(a.make_child());
  }
  shapes.clear();
  shapes.addAll(temp);
}
