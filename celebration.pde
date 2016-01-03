float depth;
float burstForce = 0.1;
float timeScale = 1.0;
float timeScalePower = -4.0;
float lengthScale = 1.0;
float lengthScalePower = 0.0;
boolean shiftKey = false;
boolean hourToggle = false;

static PVector gravity;
int v1;

ParameterControls parameterControls;

BurstSystem burstSystem;

void setup()
{
  jProcessingJS(this, {fullscreen:true});
  //fullScreen();
  //size(640, 480);
  frameRate(60);
  noSmooth();
  gravity = new PVector(0, -1.0);
  parameterControls = new ParameterControls(this);
  addParameters();
  
  depth = width;
  burstSystem = new BurstSystem();
  PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
  burstSystem.addBurst(pos, 1);
}


void draw()
{
  if((hour() == 0) && !hourToggle)
  {
    hourToggle = true;
    //parameterControls.load('2');
  }
  
  gravity = new PVector(0, -1);
  gravity.mult(gravityStrength);
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
    if(key <= '9' && key >= '0')
    {
      if(shiftKey)
      {
        //parameterControls.save(key);
      }
      else
      {
        //parameterControls.load(key);
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