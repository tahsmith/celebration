float burstParticleSize;
float burstParticleDrag;
float burstParticleLifetime;
float burstParticlePathRandomisation;
float burstAlphaFadeTime;
float burstColourFadeTime;
float burstHue;

class BurstParticle extends Particle
{
  static final float minSize = 0.03;
  Particle particle;
  float fadeRandomisation = random(0.2, 0.8);
  
  BurstParticle()
  {
    super(1, burstParticleDrag, burstParticleLifetime, burstParticlePathRandomisation);
  }
  
  void draw()
  {
    if(alive)
    {
      float fade = minSize / (burstParticleSize * (1 + pos.z) * age / (burstAlphaFadeTime * lifetime));
      float temperatureInverse = pow(age / burstColourFadeTime * fadeRandomisation, 4);
      colorMode(HSB);
      fill(burstHue,  255 * atan(temperatureInverse), 255, 255 * fade * fade); //<>//
      noStroke();
      ellipse(pos.x, pos.y, burstParticleSize, burstParticleSize);
    }
  }
  
  void update(float dt)
  {
    super.update(dt); //<>//
  }
};