float burstParticleDrag = 1.0;
float burstParticleLifetime = 30.0;
float burstPathRandomisation = 1.0;
float burstAlphaFadeTime = 1.0;
float burstColourFadeTime = 0.0005;
float burstHue = 0.0;

class BurstParticle extends Particle
{
  Particle particle;
  float fadeRandomisation;
  
  BurstParticle()
  {
    super(1.0, burstParticleDrag, burstParticleLifetime, burstPathRandomisation);
    fadeRandomisation = random(0.2, 0.8);
  }
  
  void draw()
  {
    if(alive)
    {
      float fade = 1 / ((1 + pos.z) * (1 + age / (lifetime * burstAlphaFadeTime)));
      float temperatureInverse = pow(age / burstColourFadeTime, 4);
      drawCircle(pos.x * width * lengthScale, pos.y * width * lengthScale, burstHue,  255 * (1 - 1.0 / (1.0 + temperatureInverse)), 255, 255 * fade);
    }
  }
  
  void update(float dt)
  {
    super.update(dt);
  }
};