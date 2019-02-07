import com.google.gson.*;
import com.google.gson.stream.*;
import com.google.gson.internal.*;
import com.google.gson.internal.bind.*;
import com.google.gson.annotations.*;
import com.google.gson.reflect.*;



DaysOfWeek daysOfWeek;
CurrentTimeAndDate currentTimeAndDate;
Colors colors;
BottomPagesGUI bottomPagesGUI;
BodyPagesGUI bodyPagesGUI;
BodyDetailGUI bodyDetailGUI;
NetMoneyGUI netMoneyGUI;
TicketDetailsGUI ticketDetailsGUI;
Tools tools;
Pages pages;
Events events;
FontSize fontSize;
Fonts fonts;
Button generalButton, detailButton;
DotsPreloader preloader;
User admin;
final String  requestSeparator="!@#";
final String matchCode="SendMeMatches";
final String iBettedCode="IBettedOn";
float relativeDimension;
float bW, bH, bGap, bStartX, bStartY;
float fade = 255, toFade = 255;
float fadeFactor = 0.05;
String page = "GENERAL", moneyEmoji = "💰";
float waitDelay = 2000;

void setup () {
  surface.setSize(int(displayWidth*0.8), int(displayHeight*0.7));
  putWindowOnCenter();
  updateRelativeDimension ();
  
  bW = relativeDimension*0.05;
  bH = relativeDimension*0.025;
  bGap = bH*0.25;
  bStartX = (width - bW*2 - bGap)/2;
  bStartY = bH;

  daysOfWeek = new DaysOfWeek ();
  currentTimeAndDate = new CurrentTimeAndDate ();
  fontSize = new FontSize ();
  fonts = new Fonts ();
  tools = new Tools ();
  colors = new Colors ();
  events = new Events ();
  pages = new Pages ();
  admin=new User();
  admin.send(matchCode+requestSeparator);
  delay(1000);
  admin.read();
  events.setMatches(admin.message);
  bottomPagesGUI = new BottomPagesGUI ();
  bodyPagesGUI = new BodyPagesGUI ();
  bodyDetailGUI = new BodyDetailGUI ();
  netMoneyGUI = new NetMoneyGUI ();
  ticketDetailsGUI = new TicketDetailsGUI ();

  generalButton = new Button(bStartX + bW/2, bStartY, bW, bH);
  generalButton.label = "General";
  generalButton.borderColor = colors.theme;
  generalButton.fillColor = colors.theme;
  generalButton.textHoveredColor = colors.white;
  generalButton.textUnhoveredColor = colors.theme;

  bStartX += bGap + bW;

  detailButton = new Button(bStartX + bW/2, bStartY, bW, bH);
  detailButton.label = "Detail";
  detailButton.borderColor = colors.theme;
  detailButton.fillColor = colors.theme;
  detailButton.textHoveredColor = colors.white;
  detailButton.textUnhoveredColor = colors.theme;
  
  preloader = new DotsPreloader (height/2, height*0.9);
  preloader.hGap = bottomPagesGUI.gap;
}
void draw () {
  background(colors.background);
  if(admin.connected){
    thread("read");
  strokeWeight(4);
  stroke(colors.theme);

  if (page == "GENERAL") {
    bodyPagesGUI.draw();
    bodyDetailGUI.draw();
    bottomPagesGUI.draw();
    
    point(bStartX + generalButton.rectX/2, bStartY - generalButton.rectH/2);
  } else if (page == "DETAIL")
    ticketDetailsGUI.draw();

  currentTimeAndDate.draw();
  netMoneyGUI.draw();

  noStroke();
  textFont(fonts.arimoBold);
  generalButton.draw();
  detailButton.draw();
  
  rectMode(CORNER);
  noStroke();
  fill(255, fade);
  rect(0, 0, width, height);
  
  fade = lerp(fade, toFade, fadeFactor);
  
  if(millis() > waitDelay) {
    toFade = 0;
    preloader.getDown = true;
    preloader.finalY = bottomPagesGUI.startY + bottomPagesGUI.diameter/2;
  }
  else {
    textFont(fonts.arimoRegular);
    fill(colors.theme);
    textAlign(CENTER, TOP);
    textSize(fontSize.medium);
    text("Loading something", width/2, height*0.6);
  }
  
  preloader.dotsFill = colors.theme;
  preloader.draw();
}
else{

}
}
void keyPressed () {
  if (key == 'G' || key == 'g')
    page = "GENERAL";
  else if (key == 'D' || key == 'd')
    page = "DETAIL";
}
void mouseReleased () {
  bottomPagesGUI.mouseReleased();
  ticketDetailsGUI.mouseReleased();
}
void mousePressed () {
  bodyPagesGUI.mousePressed();
  ticketDetailsGUI.mousePressed();
}
void mouseWheel(MouseEvent event) {
  bodyPagesGUI.mouseWheel(event);
  ticketDetailsGUI.mouseWheel(event);
}
void mouseDragged () {
  bodyPagesGUI.mouseDragged ();
  ticketDetailsGUI.mouseDragged ();
}
void mouseClicked () {
  if(generalButton.mouseClicked()) {
    page = "GENERAL";
  }
  else if (detailButton.mouseClicked())
    page = "DETAIL";
}
void updateRelativeDimension () {
  relativeDimension = ceil(sqrt(pow(displayWidth, 2) + pow(displayWidth, 2)));
}
void putWindowOnCenter () {
  surface.setLocation((displayWidth - width)/2, (displayHeight - height)/2);
}

void read(){

  admin.read();

}
