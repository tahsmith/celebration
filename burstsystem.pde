float burstFrequency = 1.0;
float maxBurstSize = 500;
float burstPatchSize = 1.0;
float maxParticleCount = 5000;


class BurstSystem
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  float timeSinceLastBurst = 0.0;

  void addBurst(PVector pos, float scale)
  {
    for(int i = 0; i < scale * maxBurstSize / 2; ++i)
    {
      BurstParticle particle = new BurstParticle();
      particle.pos = PVector.add(pos, PVector.random3D().mult(burstPatchSize));
      particle.vel = PVector.random3D().mult(burstForce);
      particles.add(particle);
    }
    
    for(int i = 0; i < scale * maxBurstSize / 2; ++i)
    {
      SparkleParticle particle = new SparkleParticle();
      particle.pos = PVector.add(pos, PVector.random3D().mult(burstPatchSize));
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
  
  void update(float dt)
  {
    for(Particle particle : particles)
    {
      particle.update(dt);
    }
    cleanDeadParticles();
    float p = random(0, 1);
    if(p > exp(-timeSinceLastBurst / burstFrequency) && ((maxParticleCount - particles.size()) >= maxBurstSize))
    {
      timeSinceLastBurst = 0;
      PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
      burstSystem.addBurst(pos, random(0, 1));
    }
    else
    {
      timeSinceLastBurst += dt;
    }
  }
  
  void draw()
  {
    for(Particle particle : particles)
    {
      particle.draw();
    }
  }
};