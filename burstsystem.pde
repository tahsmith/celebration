float burstFrequency = 1.0;
int maxBurstSize = 500;
float burstPatchSize = 0.0;
int maxParticleCount = 1000;
float burstiness = 1.0;


class BurstSystem
{
  ArrayList<Particle> particles;
  float timeSinceLastBurst = 0.0;

  BurstSystem()
  {
    particles = new ArrayList<Particle>();
  }

  void addBurst(PVector pos, int particleCount)
  {
    for(int i = 0; i < (particleCount + 1) / 2.0; ++i)
    {
      BurstParticle particle = new BurstParticle();
      particle.pos = new PVector(pos.x, pos.y, pos.z);
      particle.pos.add(PVector.mult(randomDir3d(), burstPatchSize));
      particle.vel = PVector.mult(randomDir3d(), burstForce);
      particles.add(particle);
    }
    
    for(int i = 0; i < (particleCount - 1) / 2.0; ++i)
    {
      SparkleParticle particle = new SparkleParticle();
      particle.pos = new PVector(pos.x, pos.y, pos.z);
      particle.pos.add(PVector.mult(randomDir3d(), burstPatchSize));
      particle.vel = PVector.mult(randomDir3d(), burstForce);
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
    int emptyParticleSpace = maxParticleCount - particles.size();
    if(p < (pow((float)emptyParticleSpace / maxParticleCount, burstiness)))
    {
      timeSinceLastBurst = 0;
      PVector pos = new PVector(random(0, 1), random(0, float(height) / float(width)), random(0, 1));
      burstSystem.addBurst(pos, emptyParticleSpace);
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