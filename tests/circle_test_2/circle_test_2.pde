import controlP5.*;

PImage circleImage;

void drawCircle(float x, float y, int r, int g, int b, int alpha)
{
  tint(r, g, b, alpha);
  image(circleImage, x, y);
}

void initialiseCircle(int radius)
{
 circleImage = createImage(2 * radius, 2 * radius, ARGB);
 circleImage.loadPixels();
 for (int i = 0; i < circleImage.width; i++) {
   for(int j = 0; j < circleImage.height; ++j)
   {
     if (radius * radius > (i - radius) * (i - radius) + (j - radius) * (j - radius))
     {
       circleImage.pixels[i + j * circleImage.width] = color(255, 255, 255);
     }
     else
     {
       circleImage.pixels[i + j * circleImage.width] = color(0, 0, 0, 0);
     }
   }
 }
 circleImage.updatePixels();
}

ControlP5 controlP5;

void setup()
{
 size(640, 480);
 controlP5 = new ControlP5(this);
 controlP5.addFrameRate();
 initialiseCircle(20);
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