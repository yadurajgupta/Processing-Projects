class Set
{
  PVector A,B,C;
  PVector center;
  float size;
  Set(PVector center_,float size_)
  {
    A=new PVector();
    B=new PVector();
    C=new PVector();
    center=new PVector();
    center.set(center_);
    size=size_;
    make_child();
  }
  void make_child()
  {
  }
}
