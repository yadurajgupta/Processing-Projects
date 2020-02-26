//PERFECT RANDOM LOOP FORMATIONUSING PERLIN NOISE //////(ONPEN SIMPLEX)(SINPLEX)
//going aroung a circle in the noise function
int resolution=30;
float noise_radius=0.5;  //JAGEDNESS OF THE LOOP
float x_offset=10;
float y_offset=10;
float acc_radius=800;    //SIZE OF THE LOOP
float track_thickness=160;
ArrayList<PVector> outer=new ArrayList<PVector>();
ArrayList<PVector> center=new ArrayList<PVector>();
ArrayList<PVector> inner=new ArrayList<PVector>();
ArrayList<Boundary> innerbounds=new ArrayList<Boundary>();
ArrayList<Boundary> outerbounds=new ArrayList<Boundary>();
ArrayList<Boundary> checkpoints=new ArrayList<Boundary>();
ArrayList<Boundary> bounds=new ArrayList<Boundary>();

//CAR VARIABLES
ArrayList<Car> cars=new ArrayList<Car>();               //LIST OF CARS
float VIS=100;                                              //VISION OF CAR HOW FAR CAN IT SEE
float carsize;                                          //SIZE OF CAR
float carang;                                           //SHAPE OF CAR
color carcol;                                           //COLOR OF CAR
float speed=2;      
PVector start;
PVector end;

//NEURAL NETWORK VARIABLES
int inputs=5;                                           //INPUT TO THE NETWORK
int carnum=100;                                          //GENERATION SIZE
int[] networkSize={8, 8, 8 ,1};                            //NETWORK STRUCTURE
float forcemag=0.1;                                     //LIKE LEARNING CONSTANT
float mutation=0.1;                                     //NUMBER OF RANDOM CARS IN NEW GENERATION
int step=10;

int timeschosen[];


void setup()
{
  // size(800, 800);
  fullScreen();
  strokeWeight(2);
  stroke(255);
  carsize=15;
  carang=PI/8;
  carcol=color(29, 255, 255);
  make_track();
  initcars();
}
void draw() {
  background(0);
  strokeWeight(16);
  translate(width/2, height/2);

  point(start.x, start.y);
  point(end.x, end.y);
  boolean nextgen=true;
  for (int i=0; i<step; i++)
  {
    for (Car c : cars)
    {
      c.update();
      if (c.collided==false && c.finished==false)
      {
        nextgen=false;
      }
      //c.show();
    }
  }
  for (Car c : cars)
  {
    c.show();
  }
  for (Boundary B : bounds)
  {
    B.show();
  }
  if (nextgen)
  {
    float cumuscore[]=new float[cars.size()];
    int curr_score=0;
    int i=0;
    for (Car c : cars)
    {
      curr_score+=c.lifetime;
      cumuscore[i++]=curr_score;
    }
    nextgen(cumuscore);
  }
}









void make_track()
{
  outer.clear();
  center.clear();
  inner.clear();
  innerbounds.clear();
  outerbounds.clear();
  checkpoints.clear();
  bounds.clear();
  //x_offset+=random(1)/100.0;
  //y_offset+=random(1)/100.0;
  for (int i=0; i<resolution; i++)
  {
    float ang=map(i, 0, resolution, 0, 2*PI);
    float x=x_offset+noise_radius*(1+sin(ang));
    float y=y_offset+noise_radius*(1+cos(ang));
    center.add(new PVector(acc_radius*noise(x, y)*cos(ang), acc_radius*noise(x, y)*sin(ang)));
    outer.add(new PVector((acc_radius+track_thickness)*noise(x, y)*cos(ang), (acc_radius+track_thickness)*noise(x, y)*sin(ang)));
    inner.add(new PVector((acc_radius-track_thickness)*noise(x, y)*cos(ang), (acc_radius-track_thickness)*noise(x, y)*sin(ang)));
  }
  outerbounds.add(new Boundary(outer.get(outer.size()-1), outer.get(0)));
  bounds.add(new Boundary(outer.get(outer.size()-1), outer.get(0)));
  innerbounds.add(new Boundary(inner.get(outer.size()-1), inner.get(0)));
  bounds.add(new Boundary(inner.get(outer.size()-1), inner.get(0)));

  for (int i=1; i<outer.size(); i++)
  {
    outerbounds.add(new Boundary(outer.get(i-1), outer.get(i)));
    innerbounds.add(new Boundary(inner.get(i-1), inner.get(i)));
    bounds.add(new Boundary(outer.get(i-1), outer.get(i)));
    bounds.add(new Boundary(inner.get(i-1), inner.get(i)));
    if (i!=outer.size()-1)
    {
      checkpoints.add(new Boundary(inner.get(i), outer.get(i)));
    } else
    {
      bounds.add(new Boundary(inner.get(i), outer.get(i)));
    }
  }
  start=center.get(0);
  end=center.get(center.size()-2);
}

void initcars()
{
  for (int i=0; i<carnum; i++)
  {
    Car c=new Car(start, mutation);
    cars.add(c);
  }
}


Car pickpairandmate(float[] cumuscore)
{
  float pick;
  int i, j;
  i=-1;
  while (i<0 || i>=cars.size())
  {
    pick=(random(cumuscore[cumuscore.length-1]));
    //println(pick);
    for (i=0; i<cumuscore.length; i++)
    {
      if (floor(pick)<floor(cumuscore[i]))
      {
        break;
      }
    }
  }
  j=-1;
  while ( j<0 || j>=cars.size())
  {
    pick=random(cumuscore[cars.size()-1]);
    for (j=0; j<cars.size(); j++)
    {
      if (floor(pick)<floor(cumuscore[j]))
      {
        break;
      }
    }
  }
  timeschosen[i]++;
  timeschosen[j]++;
  return mate(cars.get(i), cars.get(j));
}
Car mate(Car Parent1, Car Parent2)
{
  Car child=new Car(start, mutation);
  child.net.mate(Parent1.net, Parent2.net);
  return child;
}
void nextgen(float []cumuscore)
{
  ArrayList<Car> next=new ArrayList<Car>();
  timeschosen=new int[cars.size()];
  for (int i=0; i<cars.size(); i++)
  {
    timeschosen[i]=0;
  }
  for (int i=0; i<cars.size(); i++)
  {
    next.add(pickpairandmate(cumuscore));
  }
  for (int i=0; i<cars.size(); i++)
  {
    println(i+" "+timeschosen[i]+" "+cars.get(i).lifetime);
  }
  println();
  cars=next;
}
void single_parent(float[]cumuscore)
{
  ArrayList<Car> next=new ArrayList<Car>();
  for (int i=0; i<cars.size(); i++)
  {
    next.add(pickparent(cumuscore));
  }
  cars=next;
}
Car pickparent(float []cumuscore)
{
  float tot=cumuscore[cars.size()-1];
  float ran=random(tot);
  for (int i=0; i<cars.size(); i++)
  {
    if (ran<cumuscore[i])
    {
      println(i);
      Car c=new Car(start, mutation);
      c.net=cars.get(i).net.mutate();
      return c;
    }
  } 
  return cars.get(cars.size()-1);
}
