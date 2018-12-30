class Planet
{
  PVector pos=new PVector();
  PVector vel=new PVector();
  float r=0;
  color col;
  void is_sun()
  {
    pos.x=sun_pos.x;
    pos.y=sun_pos.y;
    vel=zero;
    r=sunr;
    col=color(255);
  }
  void random_planet()
  {
    randomSeed((int)random(100));
    r=random(sunr/10, sunr/2);
    pos.x=random(r, width-r);
    pos.y=random(r, height-r);
    while (pos.dist(sun_pos)<sunr)
    {
      pos.x=random(r, width-r);
      pos.y=random(r, height-r);
    }
    float d=pos.dist(sun_pos);
    PVector acpos=new PVector(pos.x-sun_pos.x, pos.y-sun_pos.y);
    acpos.rotate(HALF_PI);
    if (random(1)>0.5)
    {
      acpos.rotate(-PI);
    }
    //float mag=sqrt(sunr*sunr*sunr*Gc/d);
    float mag=sqrt(Gc/d);
    acpos.setMag(mag);
    vel.x=acpos.x;
    vel.y=acpos.y;
    col=color(random(255), random(255), random(255));
  }
  void show()
  {
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r, r);
  }
  void update()
  {
    float d=pos.dist(sun_pos);
    //float fmag=sunr*sunr*sunr*((Gc*r*r*r)/(d*d));
    PVector rand=PVector.random2D();
    rand.setMag(1);
    float fmag=((Gc)/(d*d));
    PVector force=new PVector(sun_pos.x-pos.x, sun_pos.y-pos.y);
    force=force.add(rand);
    force.setMag(fmag);
    vel.add(force);
    pos.add(vel);
  }
  int checkCollision(Planet planett)
  {
    float d1=pos.dist(sun_pos);
    float d2=(planett.givepos()).dist(sun_pos);
    int val=0;
    if (abs(d1-d2)>r+planett.giveR())
    {
      val=1;
    }
    return val;
  }
  void setval(PVector pos_, PVector vel_, float r_)
  {
    pos.x=pos_.x;
    pos.y=pos_.y;
    vel.x=vel_.x;
    vel.y=vel_.y;
    r=r_;
  }
  PVector givepos()
  {
    return pos;
  }
  float giveR()
  {
    return r;
  }
}
