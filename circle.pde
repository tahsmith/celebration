PGraphics circleImage;
float circleImageHalfWidth;
float circleImageHalfHeight;

void drawCircle(float x, float y, float r, float g, float b, float alpha)
{
  if((alpha > 0.1) 
  && ((x + circleImageHalfWidth) > 0) 
  && ((x - circleImageHalfWidth) < width)
  && ((y + circleImageHalfHeight) > 0)
  && ((y - circleImageHalfHeight) < height))
  {
    tint(r, g, b, alpha);
    image(circleImage, x - circleImageHalfWidth, y - circleImageHalfHeight);
  }
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