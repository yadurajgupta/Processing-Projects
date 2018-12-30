class Rocket
{
  PVector[] traits;
  PVector pos;
  PVector vel;
  int time;
  int lifespan;
  float fittness;
  boolean reached=false;
  color col;
  Rocket(PVector pos_, int timespan)
  {
    pos=new PVector();
    vel=new PVector(0, 0, 0);
    time=0;
    lifespan=timespan;
    pos.set(pos_);
    traits =new PVector[timespan];
    for (int i=0; i<timespan; i++)
    {
      traits[i]=PVector.random2D().mult(0.1);
    }
    colorMode(HSB);
    col=color(random(255),255,255);
    colorMode(RGB);
  }
  void show()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(vel.y, vel.x));
    noStroke();
    fill(col);
    beginShape();
    vertex(0, 0);
    vertex(-rocketsize*cos(rocketangle), rocketsize*sin(rocketangle));
    vertex(-rocketsize*cos(rocketangle), -rocketsize*sin(rocketangle));
    endShape();
    popMatrix();
  }
  void update()
  {
    if (!reached)
    {
      if (time<lifespan)
      {
        pos.add(vel);
        vel.add(traits[time]);
        time++;
      } else
      {
        pos.add(vel);
      }
    }
  }
  void setfittness()
  {
    fittness=pow(pos.dist(target.pos),-1);
  }
  void checkcol()
  {
    if (give_dist_sq(pos,target.pos)<(target_size*target_size)/4.0)
    {
      reached=true;
    }
  }
}
float give_dist_sq(PVector X,PVector Y)
{
  return (X.x-Y.x)*(X.x-Y.x)+(X.y-Y.y)*(X.y-Y.y);
}
