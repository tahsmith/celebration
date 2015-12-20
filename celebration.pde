import controlP5.*;

static String camelCaseToSpaces(String name)
{
  String output = "";
  for(int i = 0; i < name.length(); ++i)
  {
    char c = name.charAt(i);
    if(Character.isUpperCase(c))
    {
      output += " ";
    }
    output += Character.toLowerCase(c);
  }
  return output;
}

float depth;
float gravityStrength;
float burstParticleSize;
float sparkleAge;
float explosiveForce;
float pathRandomisation;
float drag;
float lifetime;
float flickerAge;
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
class ParameterControls
{
  ControlP5 cp5;
  
  int controlCount = 1;
  boolean isVisible = true;
  
  void addSliderControl(String name, float min, float max, float value)
  {
    cp5.addSlider(name)
     .setPosition(40, 40 + 25 * controlCount)
     .setSize(int(width * 0.75), 20)
     .setRange(min, max)
     .setValue(value)
     .setCaptionLabel(camelCaseToSpaces(name))
     .setColorCaptionLabel(color(255,255,255));
     
     controlCount += 1;
  }
  
  ParameterControls(PApplet applet)
  {
    cp5 = new ControlP5(applet);
    addSliderControl("timeScalePower", -4, 4, -4);
    addSliderControl("lengthScalePower", -4, 4, 0);
    addSliderControl("gravityStrength", 0.0, 1.0, 0.5);
    addSliderControl("burstParticleSize", BurstParticle.minSize, 100, 30);
    addSliderControl("burstFrequency", 0, 10, 0);
    addSliderControl("pathRandomisation", 0, 1.0, 0.01);
    addSliderControl("burstForce", 0, 1, 0.5);
    addSliderControl("drag", 0, 1.0, 0.01);
    addSliderControl("lifetime", 0.0, 60, 60);
    addSliderControl("sparkleAge", 0.0, 10, 2);
    cp5.addFrameRate().setInterval(10).setPosition(40, 40);
  }
  
  void save()
  {
    cp5.getProperties().setSnapshot("save");
    cp5.getProperties().saveSnapshot("save");
  }
  
  void load()
  {
    cp5.getProperties().load("save");
  }
  
  void toggleVisibility()
  {
    if(isVisible)
    {
      cp5.hide();
    }
    else
    {
      cp5.show();
    }
    isVisible = !isVisible;
  }
};

ArrayList<BurstParticle> particles = new ArrayList<BurstParticle>();

void addBurst(PVector pos, float scale)
{
  for(int i = 0; i < scale * maxBurstSize; ++i)
  {
    BurstParticle particle = new BurstParticle();
    particle.pos = pos.copy();
    particle.vel = PVector.random3D().mult(burstForce);
    particles.add(particle);
  }
}

void cleanDeadParticles()
{
  ArrayList<BurstParticle> aliveList = new ArrayList<BurstParticle>();
  for(BurstParticle particle : particles)
  {
    if(particle.alive)
    {
      aliveList.add(particle);
    }
  }
  particles = aliveList;
}

class BurstParticle
{
  static final int minSize = 15;
  PVector pos = new PVector();
  PVector vel = new PVector(0, 0, 0);
  PVector acc = new PVector(0, -0);
  float age = 0.0;
  boolean flicker = true;
  boolean alive = true;
  
  void draw()
  {
    if(alive)
    {
      float fade = float(minSize) / (burstParticleSize * (1 + pos.z));
      float alpha = 255.0 * (fade * fade);
      fill(255, 255, 150, flicker ? alpha  : 0);
      noStroke();
      float size = 0.1;
      PVector screenPos = PVector.mult(pos, lengthScale);
      ellipse(screenPos.x, screenPos.y, size, size);
    }
  }
  
  void update(float dt)
  {
    float p = random(0, 1);
    flicker = p < (1.0 - 0.5 * atan(age / sparkleAge));
    p = random(0, 1);
    alive = alive && p < exp(-age / lifetime);
    PVector meander = PVector.random3D().mult(pathRandomisation);
    acc = PVector.mult(vel, -drag).add(PVector.mult(gravity, gravityStrength)).add(meander);
    vel.add(PVector.mult(acc, dt));
    pos.add(PVector.mult(vel, dt));
    age += dt;
  }
};


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
  
  for(BurstParticle particle : particles)
  {
    particle.update(dt);
  }
  cleanDeadParticles();
  pushMatrix();
  translate(width, height);
  scale(width);
  rotate(PI);
  fill(#888888);
  rect(0, 0, 1 * lengthScale ,float(height) / float(width) * lengthScale); 
  for(BurstParticle particle: particles)
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