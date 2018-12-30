Triangle base;
int i;
float len=400;
PVector cent;
ArrayList<Triangle> triangles=new ArrayList<Triangle>();
void setup()
{
  size(1280,800);
  background(0);
  float val=sqrt(3)*len/12.0;
  cent=new PVector(width/2,(height/2)+val);
  base=new Triangle();
  base.ini(cent,len);
  triangles.add(base);
}
void mousePressed()
{
  ArrayList<Triangle> temp=new ArrayList<Triangle>();
  for(i=0;i<triangles.size();i++)
  {
    temp.add((triangles.get(i)).make_child1());
    temp.add((triangles.get(i)).make_child2());
    temp.add((triangles.get(i)).make_child3());
  }
  triangles.clear();
  triangles.addAll(temp);
}
void draw()
{
  background(0);
  for(i=0;i<triangles.size();i++)
  {
    triangles.get(i).show();
  }
}
