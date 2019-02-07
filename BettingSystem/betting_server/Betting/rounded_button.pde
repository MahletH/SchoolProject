class RoundedButton implements Button {

  float x, y;
  float length_, width_;
  boolean clicked;
  String discription;
  color clr=#FA3838;
  RoundedButton(float x, float y, float length_, float width_, String discription) {
    this.x=x;
    this.y=y;
    this.length_=length_;
    this.width_=width_;
    this.discription= discription;
  }
  public void drawButton() {

    noStroke();
    rectMode(CENTER);
    if (inButton()){
      fill(clr, 200);
       arc(x+length_/2, y, length_*0.45, width_+3, -PI/2, PI/2);
    arc(x-length_/2, y, length_*0.45, width_+3, PI/2, 1.5*PI);
    rect(x, y, length_, width_+3);

    textSize(length_*0.19);
    
  }
  else{
    fill(clr, 150);

    arc(x+length_/2, y, length_*0.45, width_, -PI/2, PI/2);
    arc(x-length_/2, y, length_*0.45, width_, PI/2, 1.5*PI);
    rect(x, y, length_, width_);

    textSize(length_*0.17);
   
  }
   textAlign(CENTER);
    fill(255);
   text(discription, x, y+length_*0.064);
  }
  public boolean inButton() {
    if (abs(x-mouseX)<length_/2+length_*0.45/2 && abs(y-mouseY)<width_/2)
      return true;
    return false;
  }
  public void effect() {

  
  }
}
