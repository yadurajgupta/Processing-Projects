ArrayList<PVector> points=new ArrayList<PVector>();
float r=100.0;
float noise_r=0;
float prec=100000.0;
float noise_ang=0.0;
float acc_ang=0.0;
float noise_mag=10.0;
float offset=0.01;
void setup()
{
  size(400,400);  
  background(0);
  stroke(255);
  strokeWeight(0.5);
}
void draw()
{
  background(0);
  translate(width/2,height/2);
  float diff=TWO_PI/prec;
  for(float i=0;i<TWO_PI+diff;i+=diff)
  {
    float newr=r*(1+noise(noise_r*cos(offset+i)+1,noise_r*sin(offset+i)+1));
    points.add(new PVector(newr*cos(i),newr*sin(i)));
  }
  noFill();
  beginShape();
  for(PVector P : points)
  {
    vertex(P.x,P.y);
  }
  endShape(CLOSE);
  reset();
  ///offset+=0.01;
  noise_r+=0.01;
}
void reset()
{
  points.clear();
  noise_ang=0;
  acc_ang=0;
}
