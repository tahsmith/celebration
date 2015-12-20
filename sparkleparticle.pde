float sparkleParticleSize;
float sparklePathRandomisation;
float sparkleDrag;
float sparkleLifetime;
float flickerAge;
float sparkleAge;

class SparkleParticle extends Particle
{
  static final float minSize = 0.03;
  boolean flicker = true;
  boolean alive = true;
  
  SparkleParticle()
  {
    super(1, sparkleDrag, sparkleLifetime, sparklePathRandomisation); //<>//
  }
  
  void draw()
  {
    if(alive) //<>//
    {
      float fade = minSize / (sparkleParticleSize * (1 + pos.z));
      float alpha = 255.0 * (fade * fade);
      fill(0, 0, 255, flicker ? alpha  : 0);
      noStroke();
      ellipse(pos.x, pos.y, sparkleParticleSize, sparkleParticleSize);
    }
  }
  
  void update(float dt)
  {
    super.update(dt);
    float p = random(0, 1);
    flicker = p < (1.0 - 0.5 * atan(age / sparkleAge));
    p = random(0, 1);
  }
};