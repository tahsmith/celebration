float sparklePathRandomisation;
float sparkleDrag;
float sparkleLifetime;
float flickerAge;
float sparkleAge;
float sparkleFade;
static final float sparkleC1 = 0.5 * exp(1);

class SparkleParticle extends Particle
{
  boolean flicker = true;
  boolean alive = true;
  
  SparkleParticle()
  { //<>//
    super(1, sparkleDrag, sparkleLifetime, sparklePathRandomisation); //<>//
  }
  
  void draw()
  { //<>//
    if(alive && flicker) //<>//
    {
      float fade = 1 / (1 + pos.z);
      float alpha = 255.0 * (fade * fade) * sparkleFade;
      drawCircle(pos.x * width * lengthScale, pos.y * width * lengthScale, 0, 0, 255, alpha);
    }
  }
  
  void update(float dt)
  {
    super.update(dt);
    float p = random(0, 1);
    float normedAge = age / sparkleAge ;
    flicker = p < (sparkleC1 * normedAge * normedAge * exp(-normedAge));
    p = random(0, 1);
  }
};