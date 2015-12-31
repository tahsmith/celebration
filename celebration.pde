import controlP5.*;

float depth;
float burstForce;
float timeScale = 1.0;
float timeScalePower = 0.0;
float lengthScale = 1.0;
float lengthScalePower = 0.0;
boolean shiftKey = false;

static PVector gravity = new PVector(0, -1.0);
int v1;

ParameterControls parameterControls;

BurstSystem burstSystem = new BurstSystem();

void setup()
{
  fullScreen();
  frameRate(60);
  noSmooth();
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
  
  background(#000000);
  pushMatrix();
  translate(width, height);
  //scale(width * lengthScale);
  rotate(PI);
  initialiseCircle(int(particleSize));
  colorMode(HSB);
  burstSystem.draw();
  popMatrix();
}


void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == CONTROL)
    {
      shiftKey = true;
    }
  }
  else
  {
    if(key == 'h')
    {
      parameterControls.toggleVisibility();
    }
    if(key <= '9' && key >= '0') //<>//
    {
      if(shiftKey)
      {
        parameterControls.save(key);
      }
      else
      {
        parameterControls.load(key);
      }
    }
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == CONTROL)
    {
      shiftKey = false;
    }
  }
}