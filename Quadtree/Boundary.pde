class Boundary
{
  float x, y, w, h;
  Boundary(float x_, float y_, float w_, float h_)
  {
    x=x_;
    y=y_;
    w=w_;
    h=h_;
  }
  void show()
  {
    rectMode(CENTER);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x, y, w, h);
  }
  void highLight()
  {
    rectMode(CENTER);
    strokeWeight(1);
    stroke(0, 255, 0);
    noFill();
    rect(x, y, w, h);
  }
  boolean inside(Point P)
  {
    return (P.x>=x-w/2) && (P.x<=x+w/2) && (P.y<=y+h/2) && (P.y>=y-h/2);
  }
  boolean overlap(Boundary bound)
  {
    float BT,BB,BL,BR;
    float L,R,T,B;
    L=x-w/2;
    R=x+w/2;
    T=y+h/2;
    B=y-h/2;
    BT=bound.y+bound.h/2;
    BB=bound.y-bound.h/2;
    BL=bound.x-bound.w/2;
    BR=bound.x+bound.w/2;
    return !( BL>R || BR<L || BT<B || BB>T ) ;
  }
}
