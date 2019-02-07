class  NormalButton implements Button{

  float x, y;
  float length_, width_;
  boolean clicked;
  String discription;
  color clr=color(247, 165, 0);
  NormalButton(float x, float y, float length_, float width_, String discription) {
    this.x=x;
    this.y=y;
    this.length_=length_;
    this.width_=width_;
    this.discription= discription;
  }
  public void drawButton() {
    noStroke();
   fill(clr,200);
   if(inButton())
   fill(clr);
   rectMode(CENTER);
   
    rect(x, y, length_, width_,10);
    fill(231);
  textAlign(CENTER);
  textSize(13);
  text(discription,x,y+4);
  }
  public boolean inButton() {
    if (abs(x-mouseX)<length_/2 && abs(y-mouseY)<width_/2)
      return true;
    return false;
  }
  
}
