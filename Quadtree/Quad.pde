class QuadTree
{
  int cap;
  QuadTree A00, A01, A10, A11;
  Boundary B;
  boolean divided;
  ArrayList<Point> points;
  QuadTree(Boundary B_, int cap_)
  {
    B=B_;
    cap=cap_;
    divided=false;
    points=new ArrayList<Point>();
  }
  boolean insert(Point P)
  {
    if (B.inside(P))
    {
      if (points.size()<cap)
      {
        points.add(P);
        return true;
      } else
      {
        if (!divided)
        {
          divided=true;
          float x=B.x;
          float y=B.y;
          float w=B.w/2;
          float h=B.h/2;
          A00=new QuadTree(new Boundary(x-w/2, y-h/2, w, h), cap);
          A01=new QuadTree(new Boundary(x+w/2, y-h/2, w, h), cap);
          A10=new QuadTree(new Boundary(x-w/2, y+h/2, w, h), cap);
          A11=new QuadTree(new Boundary(x+w/2, y+h/2, w, h), cap);
        }
        return A00.insert(P) || A01.insert(P) || A10.insert(P) || A11.insert(P);
      }
    } else
      return false;
  }
  void show()
  {
    B.show();
    for (Point P : points)
    {
      P.show();
    }
    if (divided)
    {
      A00.show();
      A01.show();
      A10.show();
      A11.show();
    }
  }
  ArrayList<Point> query(Boundary B_)
  {
    ArrayList<Point> temp=new ArrayList<Point>();
    if (B.overlap(B_))
    {
      temp.addAll(points);
      if (divided)
      {
        temp.addAll(A00.query(B_));
        temp.addAll(A01.query(B_));
        temp.addAll(A10.query(B_));
        temp.addAll(A11.query(B_));
      }
    }
    return temp;
  }
}
