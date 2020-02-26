class Car
{
  PVector pos;
  PVector vel;
  PVector acc;
  Car(PVector start)
  {
    pos=new PVector(start.x,start.y);
    vel=new PVector(0,-1);
    acc=new PVector(0,0);
  }
  void show()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(atan2(vel.y,vel.x));
    rectMode(CENTER);
    rect(0,0,10,20);
    popMatrix();
  }
}
