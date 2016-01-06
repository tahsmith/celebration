float sparklePathRandomisation = 1.0;
float sparkleDrag = 1.0;
float sparkleLifetime = 30.0;
float flickerAge = 1.0;
float sparkleAge = 1.0;
float sparkleFade = 1.0;
static final float sparkleC1 = 0.5 * exp(1);

class SparkleParticle extends Particle
{
  boolean flicker = true;
  
  SparkleParticle()
  {
    super(1.0, sparkleDrag, sparkleLifetime, sparklePathRandomisation);
  }
  
  void draw()
  {
    if(alive && flicker)
    {
      float fade = 1 / (1 + pos.z * pos.z);
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
  }
};