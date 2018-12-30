class Target
{
  PVector pos;
  Target(PVector tar_)
  {
    pos=new PVector();
    pos.set(tar_);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,target_size,target_size);
  }
}
