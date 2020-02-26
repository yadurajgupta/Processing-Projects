//LEVEL VARIABLES
ArrayList<Boundary> bounds=new ArrayList<Boundary>();   //LIST OF BOUNDARIES OF THE LEVEL
Boundary BoundBeingMade;                                //BOUNDARY BEING EDITED
Boundary end;                                           //FINISH LINE
int levelstep=3;                                                    
boolean finished_level=false;
Car best_car;

//CAR VARIABLES
ArrayList<Car> cars=new ArrayList<Car>();               //LIST OF CARS
float VIS;                                              //VISION OF CAR HOW FAR CAN IT SEE
float carsize;                                          //SIZE OF CAR
float carang;                                           //SHAPE OF CAR
color carcol;                                           //COLOR OF CAR
float speed=2;                                          //SPEED OF CAR


//LEVEL CREATER VARIABLES
ArrayList<String> boundCoords=new ArrayList<String>();  //TO SAVE THE COORDINATES OF ALL BOUNDARIES
boolean startpoint=false;                               //SIGNIFIES WEATHER A BOUNDARY IS BEING MADE OR START IS BEING MADE
boolean Cap_bA=true;                                    //WEATHER CAPTURING POINT A
PVector bA, bB;                                         //POINTS OF BOUNDARIES
String writeto="testlevel.txt";                         //SAVES LEVEL TO THE FILE


//LEVEL READ VARIABLES
boolean premadelevel=true;                              //CREATE LEVEL OR READ IT
PVector start;                                          //STARTING POINT FOR CARS
String readfrom="testlevel.txt";                        //READ LEVEL FROM


//NEURAL NETWORK VARIABLES
int inputs=5;                                          //INPUT TO THE NETWORK
int carnum=30;                                          //GENERATION SIZE
int[] networkSize={8, 8, 8, 1};                      //NETWORK STRUCTURE
float forcemag=0.1;                                     //LIKE LEARNING CONSTANT
float mutation=0.1;                                    //NUMBER OF RANDOM CARS IN NEW GENERATION
int nummut=0;                                           

void setup()
{
  fullScreen();
  background(0);
  bA=new PVector(width/2, height/2);
  bB=new PVector(width/2+10, height/2+10);
  BoundBeingMade=new Boundary(bA, bB);
  colorMode(HSB);
  carsize=15;
  carang=PI/8;
  carcol=color(29, 255, 255);
  VIS=500;
  initcars();
}
void draw()
{
  for (int l=0; l<levelstep; l++)
  {
    background(0);
    boolean complete=true;
    if (premadelevel)
    {
      strokeWeight(10);
      stroke(255);
      point(start.x, start.y);
      for (Car C : cars)
      {
        C.show();
        if (C.collided==false && C.ended==false)
        {
          complete=false;
        }
      }
      end.show(1);
      int count_Temp=1;
      if (complete)
      {
        //REWARDING CARS THAT REACHED END POINT 
        for (Car C : cars)
        {
          if (C.ended==true)
          {
            C.score+=7000;
            finished_level=true;
            best_car=C;
          }
          println(count_Temp+"\t"+C.score);
          count_Temp++;
        }
        float [] cumuscore=new float[cars.size()];
        for (int i=0; i<cars.size(); i++)
        {
          if (i==0)
            cumuscore[i]=(cars.get(i)).score;
          else
            cumuscore[i]=cumuscore[i-1]+cars.get(i).score;
        }
        nextgen(cumuscore);
      }
    }
    if (bounds.size()>0)
    {
      for (Boundary B : bounds)
        B.show();
    }
  }
}
void mouseDragged()
{
  if (Cap_bA)
  {
    bA.set(mouseX, mouseY);
    Cap_bA=false;
    BoundBeingMade=new Boundary(bA, bA);
  } else
  {
    bB.set(mouseX, mouseY);
    BoundBeingMade.update(bB);
    BoundBeingMade.show();
  }
  if (bounds.size()>0)
  {
    for (Boundary B : bounds)
    {
      B.show();
    }
  }
}
void mousePressed()
{
  if (!premadelevel)
  {
    BoundBeingMade.show();
  }
  if (bounds.size()>0)
  {
    for (Boundary B : bounds)
    {
      B.show();
    }
  }
}
void mouseReleased()
{
  if (!premadelevel)
  {
    if (!startpoint)
    {
      Cap_bA=true;
      bounds.add(BoundBeingMade);
      String S=bA.x+" "+bA.y+" "+bB.x+" "+bB.y;
      boundCoords.add(S);
    }
  }
  if (bounds.size()>0)
  {
    for (Boundary B : bounds)
    {
      B.show();
    }
  }
}
void keyPressed()
{
  if (!premadelevel)
  {
    if (!startpoint)
    {
      start=new PVector();
      start.set(mouseX, mouseY);
      strokeWeight(3);
      point(start.x, start.y);
      startpoint=true;
      premadelevel=true;
      String []S=new String[boundCoords.size()+1];
      int index=0;
      for (String cpy : boundCoords)
      {
        S[index]=cpy;
        index++;
      }
      S[index]=start.x+" "+start.y;
      saveStrings(writeto, S);
      initcars();
    }
  }
  if (bounds.size()>0)
  {
    for (Boundary B : bounds)
    {
      B.show();
    }
  }
}
void loadbound()
{
  if (premadelevel)
  {
    String [] point=loadStrings(readfrom);
    int i;
    bounds.clear();
    if (point.length>=3)
    {
      for (i=0; i<point.length-2; i++)
      {
        String []temp=point[i].split(" ", 4);
        Boundary t=new Boundary(new PVector(Float.valueOf(temp[0]), Float.valueOf(temp[1])), new PVector(Float.valueOf(temp[2]), Float.valueOf(temp[3])));
        bounds.add(t);
      }
      String []temp=point[i++].split(" ", 4);
      end=new Boundary(new PVector(Float.valueOf(temp[0]), Float.valueOf(temp[1])), new PVector(Float.valueOf(temp[2]), Float.valueOf(temp[3])));
      String[] l=point[i++].split(" ", 2);
      start=new PVector(Float.valueOf(l[0]), Float.valueOf(l[1]));
    } else
    {
      println("ERROR IN FILE");
      exit();
    }
  }
}
void initcars()
{
  if (premadelevel)
  {
    loadbound();
    for (int i=0; i<carnum; i++)
    {
      Car c=new Car(start);
      cars.add(c);
    }
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
  println(i+" "+j);
  return mate(cars.get(i), cars.get(j));
}
Car mate(Car Parent1, Car Parent2)
{
  Car child=new Car(start);
  child.net.mate(Parent1.net, Parent2.net);
  return child;
}
void nextgen(float []cumuscore)
{
  if (finished_level)
  {
    finished_level=false;
    ArrayList<Car> next=new ArrayList<Car>();
    for (int i=0; i<cars.size(); i++)
    {
      next.add(best_car.copy());
    }
    cars=next;
  } else
  {
    ArrayList<Car> next=new ArrayList<Car>();
    for (int i=0; i<cars.size(); i++)
    {
      next.add(pickpairandmate(cumuscore));
    }
    cars=next;
  }
}
