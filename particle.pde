float gravityStrength = 1;
float particleSize = 10;

abstract class Particle
{
  float mass;
  float drag;
  float lifetime;
  float pathRandomisation;
  float age = 0;
  boolean alive = true;
  PVector acc= new PVector(0.0, 0.0, 0.0);
  PVector vel= new PVector(0.0, 0.0, 0.0);
  PVector pos= new PVector(0.0, 0.0, 0.0);
  
  Particle(float mass, float drag, float lifetime, float pathRandomisation)
  {
    this.mass = mass;
    this.drag = drag;
    this.lifetime = lifetime;
    this.pathRandomisation = pathRandomisation;
  }
  
  void update(float dt)
  {
    float p = random(0, 1);
    alive = alive && (p < (exp(- dt / lifetime)));
    PVector meander = randomDir3d();
    meander.mult(pathRandomisation);
    acc = PVector.add(PVector.add(PVector.mult(vel, -drag), gravity), meander);
    vel.add(PVector.mult(acc, dt));
    pos.add(PVector.mult(vel, dt));
    age += dt;
  }
  
  abstract void draw();
};