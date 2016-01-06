void addParameters()
{
    parameterControls.addSliderControl("timeScaleExponent", -4, 4, 0);
    parameterControls.addSliderControl("lengthScaleExponent", -4, 4, 0);
    parameterControls.addSliderControl("burstiness", 0, 0.999, 0); 
    parameterControls.addSliderControl("burstForce", 0, 1, 0.0);
    parameterControls.addSliderControl("burstPatchSize", 0, 1, 0.0);
    parameterControls.addSliderControl("maxParticleCount", 0, 1000, 250);
    parameterControls.addSliderControl("gravityStrength", 0.0, 1.0, 0.0);
    parameterControls.addSliderControl("particleSize", 0, 100, 40);
    parameterControls.addSliderControl("burstPathRandomisation", 0, 1.0, 0.05);
    parameterControls.addSliderControl("burstParticleDrag", 0, 1.0, 0.5);
    parameterControls.addSliderControl("burstParticleLifetime", 0.0, 60, 10);
    parameterControls.addSliderControl("burstAlphaFadeTime", 0, 3.0, 0.4);
    parameterControls.addSliderControl("burstColourFadeTime", 0, 3.0, 0.3);
    parameterControls.addSliderControl("burstHue", 0, 255, 0);
    parameterControls.addSliderControl("sparkleAge", 0.0, 10, 1);
    parameterControls.addSliderControl("sparklePathRandomisation", 0, 1.0, 0.05);
    parameterControls.addSliderControl("sparkleDrag", 0, 1.0, 0.5);
    parameterControls.addSliderControl("sparkleLifetime", 0.0, 60, 20);
    parameterControls.addSliderControl("sparkleFade", 0, 3.0, 1.0);
}