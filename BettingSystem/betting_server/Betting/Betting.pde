import controlP5.*;
BorderlessButton availableMatches;
BorderlessButton bettedOn;
RoundedButton login;
RoundedButton signup;
RoundedButton done;
BackButton back;
ControlP5 loginInput;
ControlP5 signupInput;
Textfield userName;
Textfield password;
Textfield firstName;
Textfield lastName;
Textfield newUserName;
Textfield newPassword;
Textfield repeatNewPassword;
User user;
boolean errorSignup=false;
boolean errorEmpty=false;
boolean errorOnPass=false;
boolean errorUserName=false;
PFont loginFont;
PFont mainPageFont;
PFont logoFont;
String page="login"; // how goes here will be determined by the file that will tell us if the user logout or not
String subPage="";
final String verifyCode="verify";
 final String signupCode="signup";
final String  requestSeparator="!@#";
boolean locker;
void setup() {
  size(1600, 1000);
  user= new User();
  loginFont= createFont("caros", 15);
  mainPageFont= createFont("Abel", 15);
  logoFont= createFont("Roboto",40);
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

  thread("read");
  if (page.equals("login")) {


    loginPage();
  } else if (page.equals("signup")) {

    signupPage();
  } else if (page.equals("loggedin")) {


    textFont(logoFont);
    textAlign(CENTER);
    fill(#FA3838,200);
    textSize(50);
    text("H  A  L  M   B  e  t  t  i  n  g",width/2,100);
    textFont(mainPageFont);
    bettingOn(); // displays what the user is betting on
    fill(#00FF38, 5);
    noStroke();
    rectMode(LEFT);
    rect(0, 0, width, 200);
    availableMatches.effect();
    availableMatches.drawButton();
    bettedOn.effect();
    bettedOn.drawButton();
    stroke(#FA3838, 100);
    strokeWeight(2);
    line(1200, 200, 1200, height);
    if (subPage.equals("matches")) {

      matchesPage();
    }

    if (subPage.equals("bettedOn")) {

      bettedOnPage();
    }
  }
}



public void matchesPage() {
  textAlign(CENTER);
  fill(#636770);
  textSize(30);
  text("Available matches will be displayed here", 600, (height-100)/2);
}

public void bettedOnPage() {
  textAlign(CENTER);
  fill(#636770, 200);
  textSize(30);
  text("Betted on matches will be displayed here", 600, (height-100)/2);
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
     
      userName.clear();
      password.clear();
      errorOnPass=false;
      errorEmpty=false;
      loadUser(enteredUserName);
      // load user data
      user.message="false";
    } 
  
  else{
   errorOnPass=true;
    errorEmpty=false;
  }
  }
  else {
     errorEmpty=true;
      errorOnPass=false;
    }
}

public void errorEmpty(){
 textFont(loginFont);
    textSize(20);
     fill(#FA3838);
    
    textAlign(LEFT);
      text("Can't leave  empty spaceses", width/2-300, height/2-200);
}

public void errorOnPass(){

 textFont(loginFont);
    textSize(20);
     fill(#FA3838);
    
    textAlign(LEFT);
     text("Incorrect password/username", width/2-300, height/2-200);}



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
  if (errorSignup) {
    fill(#FA3838, 200);
    textSize(20);
    textAlign(LEFT);
    text("Password mismatch", width/2+320, height/2+90);
  }
   if (errorUserName){
  
   fill(#FA3838, 200);
    textSize(20);
    textAlign(LEFT);
    text("Can't leave this empty", width/2+320, height/2-110);
  
  }
  
  done.drawButton();

  back.drawButton();
}

public void loadUser(String username){

page="loggedin";




}

public void signupUser(){
        String fName=firstName.getText();
        String lName=lastName.getText();
        String uName=newUserName.getText();
        String newPass= newPassword.getText();
    if (fName.equals("")|| uName.equals("")||newPass.equals(""))
      {
      errorUserName=true;
      
      }
else if (newPassword.getText().equals(repeatNewPassword.getText())) {
        //load the new user's account on the user variable
        // send the info to server
        // check that the inputs are not emptys
       
        firstName.clear();
        lastName.clear();
        newUserName.clear();
        newPassword.clear();
        repeatNewPassword.clear();
        String message= signupCode+requestSeparator+fName+","+lName+","+uName+","+newPass;
        user.send(message);
        errorSignup=false;
        errorUserName=false;
        loadUser(uName);
      } 
      else {
        // tell the user to correct his password
    errorUserName=false;
        errorSignup=true;
      }
    


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

public void mouseReleased() {

  if (page.equals("loggedin")) {

    if (availableMatches.inButton()) {
      availableMatches.clicked=true;
      bettedOn.clicked=false;
      subPage="matches";
    } else if (bettedOn.inButton()) {
      bettedOn.clicked=true;
      availableMatches.clicked=false;
      subPage="bettedOn";
    }
  } else if (page.equals("login")) {

    if (login.inButton()) {
      confirmLogIn();
    } else if (signup.inButton()) {
      page="signup";
    }
  } else if (page.equals("signup") ) {
    if (done.inButton()) {
     signupUser();
    } else if (back.inButton()){
      page="login";
       firstName.clear();
        lastName.clear();
        newUserName.clear();
        newPassword.clear();
        repeatNewPassword.clear();
      
}
  }
}

public void keyPressed() {

  if (page.equals("loggedin")) {
    if (keyCode==17)
      locker=true;

    else if (locker && keyCode==76)
      page="login";
  } else if (page.equals("login")) {

    //if( keyCode==10){
    //  confirmLogIn();


    //}
  }
}
public void read() {
  user.read();
}
