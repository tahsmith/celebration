import controlP5.*;

void drawCircle(float x, float y, int r, int g, int b)
{
  fill(r, g, b);
  noStroke();
  ellipse(x, y, 10, 10);
}

ControlP5 controlP5;

void setup()
{
 size(640, 480);
 controlP5 = new ControlP5(this);
 controlP5.addFrameRate();
}

void draw()
{
  background(0);
    for(int i = 0; i < 100; ++i)
    {
      for(int j = 0; j < 100; ++j)
      {
        drawCircle(i * width / 100, j * height / 100, 255, 0, 0, 255);
      }
    }
}