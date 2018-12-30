class Object
{
  PVector pos=new PVector();
  boolean isfood=false;
  void ini()
  {
    pos.set(random(width), random(height));
  }
  void setfood()
  {
    isfood=true;
  }
  void show()
  {
    noStroke();
    fill(poicol);
    if (isfood)
    {
      fill(foodcol);
    }
    ellipse(pos.x, pos.y, foodsize, foodsize);
  }
  boolean check_close(Object O)
  {
    if (pos.dist(O.pos)<foodmindist && (pos.x!=O.pos.x || pos.y!=O.pos.y))
    {
      return true;
    }
    return false;
  }
  void ifeaten()
  {
    if (isfood)
    {
      for (Creature C : creatures)
      {
        if (C.pos.dist(pos)<disteaten)
        {
          pos.set(random(width), random(height));
          for (int i=0; i<objects.size(); i++)
          {
            if (check_close(objects.get(i)))
            {
              i=-1;
              pos.set(random(width), random(height));
            }
          }
        }
      }
    }
  }
}
