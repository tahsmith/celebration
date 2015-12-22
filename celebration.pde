import controlP5.*;

float depth;
float burstForce;
float timeScale = 1.0;
float timeScalePower = 0.0;
float lengthScale = 1.0;
float lengthScalePower = 0.0;

static PVector gravity = new PVector(0, -1.0);
int v1;

ParameterControls parameterControls;

BurstSystem burstSystem = new BurstSystem(); //<>//

void setup()
{
  //size(640, 480);
  fullScreen(P2D);
  frameRate(60);
  //smooth(4);
  parameterControls = new ParameterControls(this);
  
  depth = width;
  PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
  burstSystem.addBurst(pos, 1);
}


void draw()
{
  timeScale = pow(2, timeScalePower);
  lengthScale = pow(2, lengthScalePower);
  float dt = timeScale / frameRate;
  burstSystem.update(dt);
  
  background(#000000); //<>//
  pushMatrix();
  translate(width, height);
  scale(width * lengthScale);
  rotate(PI);
  burstSystem.draw();
  popMatrix();
}


void keyPressed()
{
  switch(key)
  {
    case('s'):
    parameterControls.save();
    break;
    case('l'):
    parameterControls.load();
    break;
    case('h'):
    parameterControls.toggleVisibility();
    break;
  }
}