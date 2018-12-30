class Tuple
{
  PVector pos=new PVector();
  int s;
  int l;
  int p;
  color col;
  void ini(PVector P, int S, int L, color col_)
  {
    pos.x=P.x;
    pos.y=P.y;
    s=min(S, L);
    l=max(S, L);
    p=s+l*1000;
    col=col_;
  }
  void setTo(Tuple T)
  {
    pos.x=T.pos.x;
    pos.y=T.pos.y;
    s=T.s;
    l=T.l;
    p=T.p;
    col=T.col;
  }
  boolean checkequal(Tuple T)
  {
    if (T.s==s && T.l==l)
    {
      return true;
    }
    return false;
  }
  void show()
  {
    colorMode(HSB);
    stroke(((float)(s+l))*255.0/200.0, 255, 255);
    strokeWeight(1);
    point(pos.x, pos.y);
  }
  boolean lessthan(Tuple T)
  {
    if (s<T.s)
    {
      return true;
    } else if (s==T.s && l<T.l)
    {
      return true;
    }
    return false;
  }
}
