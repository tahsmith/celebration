void addParameters()
{
    parameterControls.addSliderControl("timeScalePower", -4, 4, -4);
    parameterControls.addSliderControl("lengthScalePower", -4, 4, 0);
    parameterControls.addSliderControl("gravityStrength", 0.0, 1.0, 0.5);
    parameterControls.addSliderControl("particleSize", 0, 100, 20);
    parameterControls.addSliderControl("burstFrequency", 0, 10, 10);
    parameterControls.addSliderControl("burstPathRandomisation", 0, 1.0, 0.01);
    parameterControls.addSliderControl("burstForce", 0, 1, 0.5);
    parameterControls.addSliderControl("burstDrag", 0, 1.0, 0.01);
    parameterControls.addSliderControl("burstParticleLifetime", 0.0, 60, 60);
    parameterControls.addSliderControl("burstAlphaFadeTime", 0, 3.0, 0.05);
    parameterControls.addSliderControl("burstColourFadeTime", 0, 3.0, 0.05);
    parameterControls.addSliderControl("burstHue", 0, 255, 0);
    parameterControls.addSliderControl("sparkleAge", 0.0, 10, 2);
    parameterControls.addSliderControl("sparkleParticleSize", 0, 0.5, 0.05);
    parameterControls.addSliderControl("sparklePathRandomisation", 0, 1.0, 0.01);
    parameterControls.addSliderControl("sparkleDrag", 0, 1.0, 0.01);
    parameterControls.addSliderControl("sparkleLifetime", 0.0, 60, 60);
    parameterControls.addSliderControl("sparkleFade", 0, 3.0, 1.0);
    parameterControls.addSliderControl("burstPatchSize", 0, 1, 0.1);
    parameterControls.addSliderControl("maxBurstSize", 0, 1000, 500);
    parameterControls.addSliderControl("maxParticleCount", 0, 1000, 500);
    parameterControls.addSliderControl("burstiness", 0, 5, 0); 
}