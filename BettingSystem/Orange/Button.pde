class Button {
  float rectX, rectY, rectW, rectH, toWidth, nowWidth, borderThickness = 2, 
    animationFactor = 0.2;
  color borderColor = 255, fillColor = 255, 
    textHoveredColor = 50, textUnhoveredColor = 255;
  String label = "BUTTON";
  Button (float rectX, float rectY, float rectW, float rectH) {
    this.rectX = rectX;
    this.rectY = rectY;
    this.rectW = rectW;
    this.rectH = rectH;
    toWidth = 0;
  }
  void draw() {
    if (tools.rectHovered(rectX, rectY, rectW, rectH, CENTER)) {
      if (mousePressed)
        toWidth = rectW;
      else
        toWidth = rectW*0.85;
    } else
      toWidth = 0;

    noFill();
    stroke(borderColor);
    strokeWeight(borderThickness);
    rectMode(CENTER);
    rect(rectX, rectY, rectW, rectH);

    fill(fillColor);
    noStroke();
    rect(rectX, rectY, nowWidth, rectH);

    if (tools.rectHovered(rectX, rectY, rectW, rectH, CENTER))
      fill(textHoveredColor);
    else
      fill(textUnhoveredColor);

    textSize(rectY*0.3);
    textAlign(CENTER, CENTER);
    text(label, rectX, rectY);
    nowWidth = lerp(nowWidth, toWidth, animationFactor);
  }
  boolean mouseClicked () {
    return tools.rectHovered(rectX, rectY, rectW, rectH, CENTER);
  }
}
