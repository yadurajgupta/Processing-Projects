class Evolution
{
  float maxfittness;
  void cals_fit()
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
  ArrayList<Rocket> evolve()
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
  Rocket givebyfit()
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
  Rocket mate(Rocket dad, Rocket mom)
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
    kid.col=color((hue(mom.col)+hue(dad.col))/2.0, 255, 255);
    colorMode(RGB);
    return kid;
  }
  void mutate(Rocket rocket)
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
        rocket.traits[i]=PVector.random2D().mult(0.1);
      }
    }
  }
}
