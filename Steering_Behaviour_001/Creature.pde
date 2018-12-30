class Creature
{
  PVector pos=new PVector();
  PVector vel=new PVector();
  PVector acc=new PVector();
  float vision=VIS;
  void ini()
  {
    pos.set(random(width), random(height));
    vel.set(random(1), random(1));
  }
  void show()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(vel.y, vel.x));
    noStroke();
    fill(creacol);
    beginShape();
    vertex(0, 0);
    vertex(-creasize*cos(creang), creasize*sin(creang));
    vertex(-creasize*cos(creang), -creasize*sin(creang));
    endShape();
    noFill();
    stroke(creacol);
    strokeWeight(1);
    ellipse(0, 0, VIS, VIS);
    popMatrix();
  }
  void update()
  {
    acc.add(getforcecumu());
    vel.add(acc);
    //if (vel.mag()>50*maxspeed)
    //{
    //  vel.setMag(10*maxspeed);
    //}
    pos.add(vel);
    if (pos.x>width)
    {
      pos.x=0;
    } else if (pos.x<0)
    {
      pos.x=width;
    }
    if (pos.y>height)
    {
      pos.y=0;
    } else if (pos.y<0)
    {
      pos.y=height;
    }
    acc.set(0, 0);
  }
  PVector getforcecumu()
  {
    PVector force=new PVector();
    force.set(0, 0);
    boolean isone=true;
    float min=0;
    for (Object O : objects)
    {
      //force.add(getforce(O));
      if (isone)
      {
        min=O.pos.dist(pos);
        isone=false;
        force.set(getforce(O));
      } else if (min>O.pos.dist(pos))
      {
        force.set(getforce(O));
        min=O.pos.dist(pos);
      }
    }
    return force;
  }
  PVector getforce(Object O)
  {
    PVector force=new PVector();
    PVector des=new PVector();
    des.set(O.pos);
    force.set(0, 0);
    if (pos.dist(O.pos)<vision)
    {
      des.sub(pos);
      
      force.set(des);
      force.sub(vel);
      float speed=force.mag();
      force.setMag(map(speed, 0, maxspeed*3, 0, maxspeed));
      if (!O.isfood)
      {
        force.rotate(PI);
        force.setMag(map(speed, 0, vision, 10*maxspeed, 0));
      } else
      {
        force.setMag(map(speed, 0, vision, 0,3*maxspeed));
      }
    }
    return force;
  }
}
