import controlP5.*;

PGraphics circleImage;
float circleImageHalfWidth;
float circleImageHalfHeight;

void drawCircle(float x, float y, int r, int g, int b, int alpha)
{
  tint(r, g, b, alpha);
  image(circleImage, x - circleImageHalfWidth, y - circleImageHalfHeight);
}

void initialiseCircle(int radius)
{
   circleImageHalfHeight = radius;
   circleImageHalfWidth = radius;
   circleImage = createGraphics(radius * 2, radius * 2);
   circleImage.noSmooth();
   circleImage.beginDraw();
   circleImage.background(0,0,0,0);
   circleImage.noStroke();
   circleImage.fill(255, 255, 255);
   circleImage.ellipse(radius,radius,radius,radius); 
   circleImage.endDraw();
}

ControlP5 controlP5;

void setup()
{
 size(640, 480);
 controlP5 = new ControlP5(this);
 controlP5.addFrameRate();
 initialiseCircle(50);
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