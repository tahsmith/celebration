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
    addSliderControl("timeScalePower", -4, 4, -4);
    addSliderControl("lengthScalePower", -4, 4, 0);
    addSliderControl("gravityStrength", 0.0, 1.0, 0.5);
    addSliderControl("particleSize", 0, 100, 20);
    addSliderControl("burstFrequency", 0, 10, 10);
    addSliderControl("burstPathRandomisation", 0, 1.0, 0.01);
    addSliderControl("burstForce", 0, 1, 0.5);
    addSliderControl("burstDrag", 0, 1.0, 0.01);
    addSliderControl("burstParticleLifetime", 0.0, 60, 60);
    addSliderControl("burstAlphaFadeTime", 0, 3.0, 0.05);
    addSliderControl("burstColourFadeTime", 0, 3.0, 0.05);
    addSliderControl("burstHue", 0, 255, 0);
    
    addSliderControl("sparkleAge", 0.0, 10, 2);
    addSliderControl("sparkleParticleSize", 0, 0.5, 0.05);
    addSliderControl("sparklePathRandomisation", 0, 1.0, 0.01);
    addSliderControl("sparkleDrag", 0, 1.0, 0.01);
    addSliderControl("sparkleLifetime", 0.0, 60, 60);
    addSliderControl("sparkleFade", 0, 3.0, 1.0);
    
    addSliderControl("burstPatchSize", 0, 1, 0.1);
    addSliderControl("maxBurstSize", 0, 1000, 500);
    addSliderControl("maxParticleCount", 0, 10000, 1000);
    addSliderControl("burstiness", 0, 1, 0);
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