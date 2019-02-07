class DotsPreloader {
  int dots = 3;
  float diameter;
  float startX, startY [], toStartY [];
  float yTravelDistance;
  float hGap;
  float transitionFactor = 0.15;
  float t = 0;
  boolean getDown = false;
  float initialY = height/2, finalY = height/2;
  color dotsFill = #00A8FF;
  float opacity = 255;
  boolean allDown = true;

  DotsPreloader (float initialY, float finalY) {
    this.initialY = initialY;
    this.finalY = finalY;

    diameter = 18;
    hGap = diameter*0.3;
    yTravelDistance = diameter*1.5;

    startY = new float [dots];
    toStartY = new float [dots];

    for (int a = 0; a < dots; a ++) {
      startY [a] = initialY;
      toStartY [a] = height/2 - yTravelDistance;
    }
  }
  void draw () {
    startX = (width - dots*diameter - (dots - 1)*hGap)/2 + diameter/2;
    noStroke();
    fill(dotsFill, opacity);

    float x, y;
    for (int a = 0; a < dots; a  ++) {
      x = startX + diameter*a + hGap*a;
      if (!getDown)
        toStartY [a] = initialY + sin(radians(t) + a*PI*0.125)*yTravelDistance;

      startY [a] = lerp(startY [a], toStartY [a], transitionFactor);
      y = startY [a];
      circle(x, y, diameter);
    }
    t += TWO_PI*0.8;
    for (int a = 0; a < dots; a ++)
      toStartY [a] = (getDown? finalY : initialY);
    if (getDown) {
      allDown = true;
      for (int a = 0; a < dots; a  ++) {
        allDown = (int) dist(startY [a], 0, toStartY [a], 0) < 2;
      }
      if(allDown)
        opacity = lerp(opacity, 0, 0.3);
    }
  }
}
