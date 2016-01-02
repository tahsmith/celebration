float burstParticleDrag = 1.0;
float burstParticleLifetime = 30.0;
float burstParticlePathRandomisation = 1.0;
float burstAlphaFadeTime = 1.0;
float burstColourFadeTime = 0.0005;
float burstHue = 0.0;

class BurstParticle extends Particle
{
  static final float minSize = 0.03;
  Particle particle;
  float fadeRandomisation;
  
  BurstParticle()
  {
    super(1.0, burstParticleDrag, burstParticleLifetime, burstParticlePathRandomisation);
    fadeRandomisation = random(0.2, 0.8);
  }
  
  void draw()
  {
    if(alive)
    {
      float fade = minSize / ((1 + pos.z) * age / (burstAlphaFadeTime * lifetime)); //<>//
      float temperatureInverse = pow(age / burstColourFadeTime * fadeRandomisation, 4); //<>// //<>//
      drawCircle(pos.x * width * lengthScale, pos.y * width * lengthScale, burstHue,  255 * atan(temperatureInverse), 255, 255 * fade * fade);
    }
  }
  
  void update(float dt)
  { //<>//
    super.update(dt); //<>// //<>//
  }
};