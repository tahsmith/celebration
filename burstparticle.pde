float burstParticleSize;
float burstParticleDrag;
float burstParticleLifetime;
float burstParticlePathRandomisation;
float burstFadeTime;

class BurstParticle extends Particle
{
  static final float minSize = 0.03;
  Particle particle;
  
  BurstParticle()
  {
    super(1, burstParticleDrag, burstParticleLifetime, burstParticlePathRandomisation);
  }
  
  void draw()
  {
    if(alive)
    {
      float fade = minSize / (burstParticleSize * (1 + pos.z) * age / (lifetime * burstFadeTime));
      //float alpha = 255.0 * (fade * fade);
      colorMode(HSB);
      fill(0,  255 * (1 - atan(fade * fade)), 255, 255 * fade * fade); //<>//
      noStroke();
      ellipse(pos.x, pos.y, burstParticleSize, burstParticleSize);
    }
  }
  
  void update(float dt)
  {
    super.update(dt); //<>//
  }
};