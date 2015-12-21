import controlP5.*;

float depth;
float burstForce;
float timeScale = 1.0;
float timeScalePower = 0.0;
float lengthScale = 1.0;
float lengthScalePower = 0.0;
float timeSinceLastBurst = 0.0;
float burstFrequency = 1.0;
float maxBurstSize = 500;
static PVector gravity = new PVector(0, -1.0);
int v1;

ParameterControls parameterControls;

ArrayList<Particle> particles = new ArrayList<Particle>();

void addBurst(PVector pos, float scale)
{
  for(int i = 0; i < scale * maxBurstSize / 2; ++i)
  {
    BurstParticle particle = new BurstParticle();
    particle.pos = pos.copy();
    particle.vel = PVector.random3D().mult(burstForce);
    particles.add(particle);
  }
  
  for(int i = 0; i < scale * maxBurstSize / 2; ++i)
  {
    SparkleParticle particle = new SparkleParticle(); //<>//
    particle.pos = pos.copy();
    particle.vel = PVector.random3D().mult(burstForce);
    particles.add(particle);
  }
}

void cleanDeadParticles()
{
  ArrayList<Particle> aliveList = new ArrayList<Particle>();
  for(Particle particle : particles)
  {
    if(particle.alive)
    {
      aliveList.add(particle);
    }
  }
  particles = aliveList;
}

void setup()
{
  //size(640, 480);
  fullScreen(P2D);
  frameRate(60);
  //smooth(4);
  parameterControls = new ParameterControls(this);
  
  depth = width;
  PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
  addBurst(pos, 1);
}


void draw()
{
  timeScale = pow(2, timeScalePower);
  lengthScale = pow(2, lengthScalePower);
  float dt = timeScale / frameRate;
  
  background(#000000);
  
  float p = random(0, 1);
  if(p > exp(-timeSinceLastBurst / burstFrequency))
  {
    timeSinceLastBurst = 0;
    PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
    addBurst(pos, random(0, 1));
  }
  else
  {
    timeSinceLastBurst += dt;
  }
  
  for(Particle particle : particles)
  { //<>//
    particle.update(dt);
  }
  cleanDeadParticles();
  pushMatrix();
  translate(width, height);
  scale(width * lengthScale);
  rotate(PI);
  for(Particle particle: particles)
  {
    particle.draw();
  }
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