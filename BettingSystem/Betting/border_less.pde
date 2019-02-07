class BorderlessButton implements Button{

  float x, y;
  float length_, width_;
  float changingLineX;
  String discription;
  boolean clicked;
  color clr=#FA3838;
  BorderlessButton(float x, float y, float length_, float width_, String discription) {
    this.x=x;
    this.y=y;
    this.length_=length_;
    this.width_=width_;
    this.discription= discription;
    
    this.changingLineX=0;
  }
  public void drawButton() {
    if (clicked){
      
      stroke(clr);
      line(x-length_/2,y+length_*0.08,x+length_/2-5,y+length_*0.08);
       fill(clr,200);
      textSize(length_*0.09);
      
    }
    else if (inButton()){
      fill(clr,200);
      textSize(length_*0.05);
    }
    else{
      fill(clr,150);
      textSize(length_*0.05);
    }
    textAlign(CENTER);

    text(discription, x, y+length_*0.05);
    
  }
  public boolean inButton() {
    if (abs(x-mouseX)<length_/2 && abs(y-mouseY)<width_/2)
      return true;
    return false;
  }
  public void effect() {

    if (inButton()) {
      fill(clr, 200);
      rectMode(CENTER);
      stroke(clr);
      strokeWeight(2);
      
      changingLineX=gradual(changingLineX,length_/2-5,5);
      line(x,y+length_*0.08,x-changingLineX,y+length_*0.08);
      line(x,y+length_*0.08,x+changingLineX,y+length_*0.08);
      
    }
    else
    changingLineX=0;
    
  }
  public float gradual(float from, float to, float rate){
  
  if (from<to)
    from+=(to-from)/rate;
  else if (from>to)
    from-=(from-to)/rate;
  
  return from;
  
  }
}
