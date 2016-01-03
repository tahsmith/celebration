import controlP5.*;

class ParameterControls
{
  ControlP5 cp5;
  
  int controlCount = 1;
  boolean isVisible = true;
  
  void addSliderControl(String name, float min, float max, float value)
  {
    cp5.addSlider(name)
     .setPosition(40, 40 + 25 * controlCount)
     .setSize(int(width * 0.75), 20)
     .setRange(min, max)
     .setValue(value)
     .setCaptionLabel(camelCaseToSpaces(name))
     .setColorCaptionLabel(color(255,255,255));
     
     controlCount += 1;
  }
  
  ParameterControls(PApplet applet)
  {
    cp5 = new ControlP5(applet);
    cp5.addFrameRate().setInterval(10).setPosition(40, 40);
  }
  
  void save(char k)
  {
    String name = "" + k;
    cp5.getProperties().setSnapshot(name);
    cp5.getProperties().saveSnapshot(name);
  }
  
  void load(char k)
  {
    String name = "" + k;
    cp5.getProperties().load(name);
  }
  
  void toggleVisibility()
  {
    if(isVisible)
    {
      cp5.hide();
    }
    else
    {
      cp5.show();
    }
    isVisible = !isVisible;
  }
};