package processing.test.ml_003_evolution_;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ML_003_Evolution_ extends PApplet {

ArrayList<Rocket>rockets = new ArrayList<Rocket>();
int rocketsnum=100;
PVector origin;
PVector centbottom;
PVector centtop;
float target_size=40;
float rocketsize=20;
float rocketangle=PI/8;
int rocketcol;
Target target;
int lifeSpan=400;
int gentime=600;
int timepassed;
Evolution evo;
int gen_done=10;
int gen_passed;
float mutation_rate=0.01f;
public void setup()
{
  //size(600, 600);
  
  origin=new PVector(0, 0, 0);
  centbottom=new PVector(0, height/2-50, 0);
  centtop=new PVector(0, -height/2+50, 0);
  Rocket temp;
  for (int i=0; i<rocketsnum; i++)
  {
    temp=new Rocket(centbottom, lifeSpan);
    rockets.add(temp);
  }
  evo=new Evolution();
  rocketcol=color(29, 255, 255);
  target=new Target(centtop);
  timepassed=0;
  gen_passed=0;
  background(0);
}
public void draw()
{
  frameRate(1000);
  background(0);
  translate(width/2, height/2);
  textAlign(RIGHT);
  text("GENERATION "+(gen_passed+1), width/2, height/2-20);   
  for (Rocket rocket : rockets)
  {
    rocket.show();
    rocket.update();
    rocket.isthere();
  }
  target.show();
  timepassed++;
  if (timepassed>gentime)
  {
    evo.cals_fit();
    rockets=evo.evolve();
    timepassed=0;
    gen_passed++;
  }
}
class Rocket
{
  PVector[] traits;
  PVector pos;
  PVector vel;
  int time;
  int lifespan;
  float fittness;
  boolean reached=false;
  int col;
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
      traits[i]=PVector.random2D().mult(0.1f);
    }
    colorMode(HSB);
    col=color(random(255),255,255);
    colorMode(RGB);
  }
  public void show()
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
  public void update()
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
  public void setfittness()
  {
    fittness=pow(pos.dist(target.pos),-1);
  }
  public void isthere()
  {
    if (give_dist_sq(pos,target.pos)<(target_size*target_size)/4.0f)
    {
      reached=true;
    }
  }
}
public float give_dist_sq(PVector X,PVector Y)
{
  return (X.x-Y.x)*(X.x-Y.x)+(X.y-Y.y)*(X.y-Y.y);
}
class Target
{
  PVector pos;
  Target(PVector tar_)
  {
    pos=new PVector();
    pos.set(tar_);
  }
  public void show()
  {
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,target_size,target_size);
  }
}
//class bound
//{
//}
class Evolution
{
  float maxfittness;
  public void cals_fit()
  {
    maxfittness=0;
    for (Rocket rocket : rockets)
    {
      rocket.setfittness();
      if (maxfittness<rocket.fittness)
      {
        maxfittness=rocket.fittness;
      }
    }
    //for (Rocket rocket : rockets)
    //{
    //  if (rocket.fittness<maxfittness/10)
    //  {
    //    rocket.fittness=maxfittness/10;
    //  }
    //}
  }
  public ArrayList<Rocket> evolve()
  {
    Rocket kid=new Rocket(centbottom, lifeSpan);
    ArrayList<Rocket>kids = new ArrayList<Rocket>();
    for (int i=0; i<rockets.size(); i++)
    {
      Rocket dad=givebyfit();
      Rocket mom=givebyfit();
      kid=mate(mom, dad);
      mutate(kid);
      kids.add(kid);
    }
    return kids;
  }
  public Rocket givebyfit()
  {
    while (true)
    {
      int x=(int)random(rockets.size());
      while (x==rockets.size())
      {
        x=(int)random(rockets.size());
      }
      float tar=(rockets.get(x)).fittness;
      float got=random(maxfittness);
      if (got<tar)
      {
        return rockets.get(x);
      }
    }
  }
  public Rocket mate(Rocket dad, Rocket mom)
  {
    Rocket kid=new Rocket(centbottom, lifeSpan);
    int x=floor(random(lifeSpan));
    while (x==lifeSpan)
    {
      x=floor(random(lifeSpan));
    }
    for (int i=0; i<dad.lifespan; i++)
    {
      if (i<x)
      {
        kid.traits[i]=dad.traits[i];
      } else
      {
        kid.traits[i]=mom.traits[i];
      }
    }
    colorMode(HSB);
    kid.col=color((hue(mom.col)+hue(dad.col))/2.0f, 255, 255);
    colorMode(RGB);
    return kid;
  }
  public void mutate(Rocket rocket)
  {
    if (random(1)<mutation_rate)
    {
      int x, y;
      x=floor(random(rocket.lifespan));
      y=floor(random(rocket.lifespan));
      while (x==rocket.lifespan || y==rocket.lifespan || x==y|| max(x, y)-min(x, y)>10)
      {
        x=floor(random(rocket.lifespan));
        y=floor(random(rocket.lifespan));
      }
      for (int i=min(x, y); i<max(x, y); i++)
      {
        rocket.traits[i]=PVector.random2D().mult(0.1f);
      }
    }
  }
}
  public void settings() {  fullScreen(); }
}
