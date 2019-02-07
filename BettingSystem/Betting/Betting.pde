import java.awt.*; //<>//
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import controlP5.*; 
import com.google.gson.*;
import com.google.gson.stream.*;
import com.google.gson.internal.*;
import com.google.gson.internal.bind.*;
import com.google.gson.annotations.*;
import com.google.gson.reflect.*;
import java.util.ArrayList;

BorderlessButton availableMatches;
BorderlessButton bettedOn;
RoundedButton login;
RoundedButton signup;
RoundedButton done;
BackButton back;
MatchPrinter matchPrinter;
OddDisplayer oddDisplayer;
BettedOn bettingOn;
BetDisplayer betDisplayer;
ControlP5 loginInput;
ControlP5 signupInput;
Textfield userName;
Textfield password;
Textfield firstName;
Textfield lastName;
Textfield newUserName;
Textfield newPassword;
Textfield repeatNewPassword;
ControlP5 BetMoney;
Football matchToBeBettedOn=null;
User user;
Gson gson= new Gson();
ArrayList <Football> matches; 
MyBetDisplayer myBetDisplayer;
PImage backgroundImage;
PImage page404;

boolean errorSignup=false;
boolean errorEmpty=false;
boolean errorOnPass=false;
boolean errorUserNameEmpty=false;
boolean errorUserNameExists=false;
PFont loginFont;
PFont mainPageFont;
PFont logoFont;
boolean matchLoaded=false;
String page="login"; // how goes here will be determined by the file that will tell us if the user logout or not
String subPage="";
final String verifyCode="verify";
final String signupCode="signup";
final String  requestSeparator="!@#";
final String matchCode="SendMeMatches";
final String iBettedCode="IBettedOn";
boolean locker;
void setup() {
 // size(1600, 1000);
 fullScreen();
  user= new User();
  loginFont= createFont("caros", 15);
  mainPageFont= createFont("Abel", 15);
  logoFont= createFont("Roboto", 40);
  backgroundImage= loadImage("Betzon.png");
  page404=loadImage("404.png");
  matches= new ArrayList <Football>(); 
  myBetDisplayer= new MyBetDisplayer();
  matchPrinter= new MatchPrinter();
  oddDisplayer= new OddDisplayer();
 
  availableMatches= new BorderlessButton(300, 150, 600, 100, "Matches");
  bettedOn= new BorderlessButton(900, 150, 600, 100, "Betted On");
  login= new RoundedButton(width/2, height/2+110, 120, 60, "Log In");
  signup= new RoundedButton(width/2, height/2+180, 120, 60, "Sign Up");
  done= new RoundedButton(width/2, height/2+200, 120, 60, "Done");
  back= new BackButton(60, 35, 50, 25);
  signup.clr=#55FF38;
  loginInput= new ControlP5(this);
  signupInput= new ControlP5(this);
  signupInput.setAutoDraw(false);
  loginInput.setAutoDraw(false);
  BetMoney = new ControlP5(this);
  betDisplayer= new BetDisplayer(BetMoney);
  userName= loginInput.addTextfield("User name")
    .setPosition(width/2-300, height/2-100)
    .setSize(600, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColorActive(#38FF38)
    .setColor(#FA3838)
    .setColorForeground(#FA3838);

  password= loginInput.addTextfield("Password")
    .setPosition(width/2-300, height/2)
    .setSize(600, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)
    .setPasswordMode(true)
    .setColorForeground(#FA3838);





  firstName= signupInput.addTextfield("firstName")
    .setPosition(width/2-300, height/2-200)
    .setSize(250, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)

    .setColorForeground(#FA3838);

  lastName= signupInput.addTextfield("lastName")
    .setPosition(width/2+50, height/2-200)
    .setSize(250, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)
    .setColorForeground(#FA3838);

  newUserName= signupInput.addTextfield("User Name")
    .setPosition(width/2-300, height/2-100)
    .setSize(600, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)
    .setColorForeground(#FA3838);

  newPassword= signupInput.addTextfield("Create Password")
    .setPosition(width/2-300, height/2)
    .setSize(600, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)
    .setPasswordMode(true)
    .setColorForeground(#FA3838);

  repeatNewPassword= signupInput.addTextfield("Repeat assword")
    .setPosition(width/2-300, height/2+100)
    .setSize(600, 50)
    .setAutoClear(false)
    .setFont(loginFont)
    .setColorBackground(#FFFFFB)
    .setColor(#FA3838)
    .setColorActive(#38FF38)
    .setPasswordMode(true)
    .setColorForeground(#FA3838);
}
void draw() {
  background(#FFFFFB);
  if (user.connected){
  thread("read");
  if (page.equals("login")) {
    imageMode(CENTER);
    image(backgroundImage, width/2, 400, backgroundImage.width*0.5, backgroundImage.width*0.5);

    loginPage();
  } else if (page.equals("signup")) {

    signupPage();
  } else if (page.equals("loggedin")) {

    if (!matchLoaded)
      loadMatches();
    if (subPage.equals("matches")) {

      matchesPage();
    } else if (subPage.equals("bettedOn")) {

      bettedOnPage();
    } else if (subPage.equals("betting")) {

      oddDisplayer.draw();
    }
    betDisplayer.draw();
    fill(#FFFFFB);
    rectMode(LEFT);
    noStroke();
    rect(0, 0, width, 200);
    textFont(logoFont);
    textAlign(CENTER);
    fill(#FA3838, 200);
    textSize(50);
    text("H  A  L  M   B  e  t  t  i  n  g", width/2, 100);
    textFont(mainPageFont);

    fill(231, 10);
    noStroke();
    rectMode(LEFT);
    rect(0, 0, width, 200);
    bettingOn(); // displays what the user is betting on
    availableMatches.effect();
    availableMatches.drawButton();
    bettedOn.effect();
    bettedOn.drawButton();
    stroke(#FA3838, 100);
    strokeWeight(2);
    line(1200, 200, 1200, height);
  }
  }
  else{
    user.connect();
    imageMode(CENTER);
  image(page404,width/2,height/2);
 
  }
}



public void matchesPage() {
  textAlign(CENTER);
  fill(#636770);
  matchPrinter.draw();
  //textSize(30);
  //text("Available matches will be displayed here", 600, (height-100)/2);
}

public void displayOdds() {
}



public void bettedOnPage() {
  textAlign(CENTER);
  fill(#636770, 200);
  textSize(20);
 // text("Betted on matches will be displayed here", 600, (height-100)/2);
 myBetDisplayer.draw();
}

public void confirmLogIn() {
  String enteredUserName= userName.getText();
  String enteredPassword= password.getText();

  if (!enteredUserName.equals("") && !enteredPassword.equals("")) {
    String message=verifyCode+requestSeparator+enteredUserName+","+enteredPassword;
    // send the userName and password entered and get a confirmation
    user.send(message);
    delay(100);
    // if the confirmation is true then page="loggedin" and the user account should be loaded
    if (user.message.equals("true") ) {

      resetLoginPage();
      loadUser(enteredUserName);
      // load user data
    } else {
      errorOnPass=true;
      errorEmpty=false;
    }
  } else {
    errorEmpty=true;
    errorOnPass=false;
  }
}

public void resetLoginPage() {

  userName.clear();
  password.clear();
  errorOnPass=false;
  errorEmpty=false;
}
public void errorEmpty() {
  textFont(loginFont);
  textSize(20);
  fill(#FA3838);

  textAlign(LEFT);
  text("Can't leave  empty spaceses", width/2-300, height/2-150);
}

public void errorOnPass() {

  textFont(loginFont);
  textSize(20);
  fill(#FA3838);
  textAlign(LEFT);
  text("Incorrect password/username", width/2-300, height/2-150);
}



public void signupPage() {

  signupInput.draw();
  textFont(loginFont);
  fill(#FA3838, 200);
  textSize(15);
  textAlign(LEFT);
  text("First name", width/2-300, height/2-210);
  text("Last name", width/2+50, height/2-210);
  text("User name", width/2-300, height/2-110);
  text("New Password", width/2-300, height/2-10);
  text("Confirm Password", width/2-300, height/2+90);
  float spaceFromBox=textWidth(" Last name");
  textSize(10);
  text("(optional)", width/2+50+spaceFromBox, height/2-210);
  if (errorSignup) {
    fill(#FA3838, 200);
    textSize(20);
    textAlign(LEFT);
    text("Password mismatch", width/2+320, height/2+90);
  }
  if (errorUserNameEmpty) {

    fill(#FA3838, 200);
    textSize(20);
    textAlign(LEFT);
    text("Can't leave empty spaces", width/2-300, height/2-260);
  }
  if (errorUserNameExists) {

    fill(#FA3838, 200);
    textSize(20);
    textAlign(LEFT);
    text("User name is taken", width/2+320, height/2-50);
  }

  done.drawButton();

  back.drawButton();
}

public void loadUser(String username) {

  page="loggedin";
  availableMatches.clicked=true;
  bettedOn.clicked=false;
  subPage="matches";
  user.username=username; // assign user name from the text box to user name  in user object
  bettingOn= new BettedOn(username, new HashMap <Football, ArrayList<Guess>> ());
}

public void signupUser() {
  String fName=firstName.getText();
  String lName=lastName.getText();
  String uName=newUserName.getText();
  String newPass= newPassword.getText();
  if (fName.equals("")|| uName.equals("")||newPass.equals(""))
  {
    errorUserNameEmpty=true;
  } else if (newPassword.getText().equals(repeatNewPassword.getText())) {
    //load the new user's account on the user variable
    // send the info to server
    // check that the inputs are not emptys
    String message= signupCode+requestSeparator+fName+","+lName+","+uName+","+newPass;
    user.send(message);
    delay(150);

    if (user.message.equals("true")) {
      resetSignupPage();
      loadUser(uName);
    } else {
      errorUserNameExists=true;
      errorSignup=false;
      errorUserNameEmpty=false;
    }
  } else {
    // tell the user to correct his password
    errorUserNameEmpty=false;
    errorSignup=true;
  }
}
public void resetSignupPage() {
  firstName.clear();
  lastName.clear();
  newUserName.clear();
  newPassword.clear();
  repeatNewPassword.clear();
  errorSignup=false;
  errorUserNameEmpty=false;
  errorUserNameExists=false;
}

public void resetPages(){

user.username="";
betDisplayer.bet=null;
myBetDisplayer.bets.clear();
matchPrinter.map.clear();


}

public void loginPage() {
  // signing page will be displayed here


  loginInput.draw();
  textFont(loginFont);
  fill(#FA3838, 200);
  textSize(15);
  textAlign(LEFT);
  text("User name", width/2-300, height/2-110);
  text("Password", width/2-300, height/2-10);
  if(capsIsOn())
    text("Caps Lock is on",width/2+350,height/2);
  login.drawButton();

  signup.drawButton();
  if (errorEmpty)
    errorEmpty();
  if (errorOnPass)
    errorOnPass();
}


public void bettingOn() {
  fill(#FA3838, 200);
  textSize(35);
  textAlign(CENTER);
  text("Betting status", 1400, 180);
}

public void loadMatches() {
  if (matches.size()==0) {

    user.send(matchCode+requestSeparator);  
    
    delay(1000);
    String [] tempMatches=user.message.split(requestSeparator);
    for (String m : tempMatches) {
      matchPrinter.add(gson.fromJson(m, Football.class));
    }
    //println(matches.get(0));
    matchLoaded=true;
  }
}

public void mouseReleased() {

  if (page.equals("loggedin")) {

    if (availableMatches.inButton()) { // if the button matches is clicked
      if (subPage.equals("betting")) {
        matchToBeBettedOn=null;
        subPage="matches";
      }
      availableMatches.clicked=true;
      bettedOn.clicked=false;
      subPage="matches";
    } else if (bettedOn.inButton()) {  // if the button bettenOn is clicked
      bettedOn.clicked=true;
      availableMatches.clicked=false;
      subPage="bettedOn";
    }

    if (subPage.equals("matches")) {
      for (NormalButton i : matchPrinter.map.keySet()) {  //if one of the match buttons is clicked
        if (i.inButton() && mouseY>210) {
          if (matchPrinter.map.get(i).status_.equals(""))
          {
            matchToBeBettedOn=matchPrinter.map.get(i);
            subPage="betting";
            oddDisplayer.loadOdds(matchToBeBettedOn);
          }
        }
      }
    } else if (subPage.equals("betting")) {       // if one of the odds of the matchToBeBetted on is clicked

      for (NormalButton i : oddDisplayer.fhtOdds) {

        if (i.inButton()) {

          bettingOn.addBet(matchToBeBettedOn, oddDisplayer.map.get(i));
          betDisplayer.addBet(bettingOn);
        }
      }


      for (NormalButton i : oddDisplayer.ftOdds) {

        if (i.inButton()) {

          bettingOn.addBet(matchToBeBettedOn, oddDisplayer.map.get(i));
          betDisplayer.addBet(bettingOn);
        }
      }
      for (NormalButton i : oddDisplayer.fhgOdds) {

        if (i.inButton()) {

          bettingOn.addBet(matchToBeBettedOn, oddDisplayer.map.get(i));
          betDisplayer.addBet(bettingOn);
        }
      }
      for (NormalButton i : oddDisplayer.ftgOdds) {

        if (i.inButton()) {

          bettingOn.addBet(matchToBeBettedOn, oddDisplayer.map.get(i));
          betDisplayer.addBet(bettingOn);
        }
      }
    }

    if (betDisplayer.cancle.inButton())
      bettingOn.match_guess.clear();

    else if (betDisplayer.placeBet.inButton()) {
      // before sending out the bettingOn check if money is greater than zero
      if (!betDisplayer.betMoney.getText().equals("")){
        Float money=Float.parseFloat(betDisplayer.betMoney.getText());
      if(money>10){
       bettingOn.money=money;
      user.send(iBettedCode+requestSeparator+gson.toJson(bettingOn));
      betDisplayer.betMoney.clear();
      myBetDisplayer.bets.add(bettingOn); // bets are also loaded when the user logs in
      bettingOn.match_guess.clear();
      betDisplayer.notEnoughMoney=false;
    }
    else 
    betDisplayer.notEnoughMoney=true;
    
    }
    
    else 
    betDisplayer.notEnoughMoney=true;
    }
  } else if (page.equals("login")) {

    if (login.inButton()) {
      confirmLogIn();
    } else if (signup.inButton()) {
      page="signup";
      resetLoginPage();
    }
  } else if (page.equals("signup") ) {
    if (done.inButton()) {
      signupUser();
    } else if (back.inButton()) {
      page="login";
      resetSignupPage();
    }
  }
}

public void keyPressed() {

  if (page.equals("loggedin")) {

    if (keyCode==17)
      locker=true;

    else if (locker && keyCode==76) {
      page="login";
      matchLoaded=false;
      resetPages();
    }
  } else if (page.equals("login")) {

    //if( keyCode==10){
    //  confirmLogIn();


    //}
  }

  if (subPage.equals("matches")) {

    if (keyCode==UP)
      matchPrinter.pos+=15;
    else if (keyCode==DOWN)
      matchPrinter.pos-=15;

    matchPrinter.pos=constrain(matchPrinter.pos, height-280-170*matchPrinter.map.size(), 280); //  restricts the scrolling
  }
}
public void mouseWheel(MouseEvent event)

{
  if (subPage.equals("matches") && mouseX<1200) {
    matchPrinter.pos-=event.getCount()*2;
    matchPrinter.pos=constrain(matchPrinter.pos, height-280-170*matchPrinter.map.size(), 280);
  }
  if (page.equals("loggedin") && mouseX>1200) {

    betDisplayer.pos-=event.getCount()*2;
    betDisplayer.pos=constrain(betDisplayer.pos, height-280-100*(betDisplayer.size), 280);
    println(betDisplayer.pos);
  }
}

boolean capsIsOn () {
  return Toolkit.getDefaultToolkit().getLockingKeyState(KeyEvent.VK_CAPS_LOCK);
}

public void read() {
  user.read();
}
