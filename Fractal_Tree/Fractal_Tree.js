var len=100;
var ang=PI/4;
var slider;
var slider1;
var scale=0.5;
function setup() {
  createCanvas(400, 400);
  slider=createSlider(0, PI, PI/4, 0.01);
  silder1=createSlider(0,1,0.5,0.01);
}

function draw() 
{
  ang=slider.value();
  //scale=slider1.value();
  scale=0.5;
  background(51);
  stroke(255);
  translate(width/2, height);
  line(0, 0, 0, -len);
  translate(0, -len);
  branch(len);  
  ang=PI/4;
}
function branch(len)
{
  line(0,0,0,-len);
  translate(0,-len);
  if(len>1)
  {
    push();
    rotate(ang);
    branch(len*scale);
    pop();
    rotate(-ang);
    branch(len*scale);
  }
}
