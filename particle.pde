float gravityStrength;
float particleSize;

abstract class Particle
{
  float mass;
  float drag;
  float lifetime;
  float pathRandomisation;
  float age;
  boolean alive = true;
  PVector acc;
  PVector vel;
  PVector pos;
  
  Particle(float mass, float drag, float lifetime, float pathRandomisation)
  {
    this.mass = mass;
    this.drag = drag;
    this.lifetime = lifetime;
    this.pathRandomisation = pathRandomisation;
  }
  
  void update(float dt)
  {
    float p = random(0, 1); //<>//
    alive = alive && p < exp(-age / lifetime);
    PVector meander = PVector.random3D().mult(pathRandomisation);
    acc = PVector.mult(vel, -drag).add(PVector.mult(gravity, gravityStrength)).add(meander);
    vel.add(PVector.mult(acc, dt));
    pos.add(PVector.mult(vel, dt));
    age += dt;
  }
  
  abstract void draw();
};