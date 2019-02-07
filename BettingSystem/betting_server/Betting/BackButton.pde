class BackButton implements Button {

  float x, y;
  float length_, width_;
  boolean clicked;
 color clr=#FA3838;
  BackButton(float x, float y, float length_, float width_) {
    this.x=x;
    this.y=y;
    this.length_=length_;
    this.width_=width_;
    
  }
  public void drawButton() {
    fill(clr,20);
    if (!inButton())
    stroke(#636770,100);
    else
    stroke(#636770);
    strokeWeight(3);
    line(x-length_/2+3,y-1,x+length_*0.4,y-1);
    line(x-length_/2,y,x-length_*0.25,y+width_/2-2);
    line(x-length_/2,y-2,x-length_*0.25,y-width_/2+2);
  }
  public boolean inButton() {
    if (abs(x-mouseX)<length_/2 && abs(y-mouseY)<width_/2)
      return true;
    return false;
  }
 

   
  
  
 
}
