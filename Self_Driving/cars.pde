class Car
{
  PVector carPos=new PVector();
  PVector carVel=new PVector();
  PVector carAcc=new PVector();
  float carVision=VIS;
  Network net;
  boolean collided=false;
  boolean ended=false;
  float score=0;
  Car(PVector P)
  {
    carPos.set(P.x, P.y);
    carVel.set(0, -1);
    carAcc.set(0, 0);
    net =new Network(networkSize, inputs);
  }

  void show()
  {
    pushMatrix();
    translate(carPos.x, carPos.y);
    rotate(atan2(carVel.y, carVel.x));
    noStroke();
    fill(carcol);
    beginShape();
    vertex(0, 0);
    vertex(-carsize*cos(carang), carsize*sin(carang));
    vertex(-carsize*cos(carang), -carsize*sin(carang));
    endShape();
    if (!collided)
    {
      noFill();
      stroke(carcol);
      strokeWeight(1);
      ellipse(0, 0, carVision, carVision);
    }
    popMatrix();
    distance();
    update();
  }
  void update()
  {
    if (!collided && !ended)
    {
      carVel.add(carAcc);
      //carVel.set(carAcc);
      //carVel.setMag(speed);
      carPos.add(carVel);
      carAcc.set(0, 0);
      checkcoll();
    }
  }
  void updatescore(float [] inp)
  {
    for (int i=0; i<inp.length; i++)
    {
      score+=(inp[i]/50.0);
    }
  }
  void distance()
  {
    if (!collided && !ended)
    {
      PVector tempv=new PVector(carVel.x, carVel.y);
      if (tempv.mag()!=0)
      {
        tempv.mult(1/tempv.mag());
      }
      float in[]=new float[inputs];
      float sc[]=new float[inputs];
      for (int i=0; i<inputs; i++)
      {
        float ang=map(i, 0, inputs-1, -PI/2, PI/2);
        PVector rot=new PVector(carVel.x, carVel.y);
        rot.rotate(ang);
        rot.setMag(1);
        PVector test=new PVector();
        int j=0;
        for (j=1; j<carVision/2; j+=10)
        {
          test.set(rot);
          test.mult(j);
          test.add(carPos);
          //strokeWeight(10);
          //point(test.x, test.y);
          boolean inside=false;
          for (Boundary B : bounds)
          {
            if (B.isinside(test))
            {
              inside=true;
              break;
            }
          }
          if (inside)
          {
            break;
          }
        }
        int k=0;
        for (k=max(j-10, 1); k<=j; k++)
        {
          test.set(rot);
          test.mult(k);
          test.add(carPos);
          //strokeWeight(10);
          //point(test.x, test.y);
          boolean inside=false;
          for (Boundary B : bounds)
          {
            if (B.isinside(test))
            {
              inside=true;
              break;
            }
          }
          if (inside)
          {
            break;
          }
        }
        rot.set(test);
        in[i]=(float)func(k);
        sc[i]=k;
        colorMode(HSB);
        stroke(map(i, 0, inputs-1, 0, 255), 255, 255);
        strokeWeight(10);
        point(rot.x, rot.y);
      }
      updatescore(sc);
      predict(in);
    }
  }
  float func(float a)
  {
    return (float)a;
  }
  void steer(float inp)
  {
    float ang;
    ang=map(inp, -1, 1, -PI, PI);
    carAcc.set(cos(ang), sin(ang));
    carAcc.setMag(speed);
    carAcc.sub(carVel);
  }
  void predict(float[] in)
  {
    float out[]=net.output(in);
    float a=0;
    for (int i=0; i<out.length; i++)
    {
      a+=out[i];
    }
    steer(a);
  }
  void checkcoll()
  {
    if (end.isinside(carPos))
    {
      ended=true;
    }
    if (carPos.y>height || carPos.x>=width)
    {
      collided=true;
    }
    for (Boundary B : bounds)
    {
      if (B.isinside(carPos))
      {
        collided=true;
      }
    }
  }
  Car copy()
  {
    Car neu=new Car(start);
    neu.net=net.copy();
    return neu;
  }
}
