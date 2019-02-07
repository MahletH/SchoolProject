import controlP5.*;
class BetDisplayer {

  NormalButton cancle= new NormalButton(1500,0,90,30,"cancle");
 
  NormalButton placeBet= new NormalButton(1500,0,90,30,"Bet");
  BettedOn bet;
  PFont teamFont= createFont("Noto Serif", 20);
  PFont timeFont=createFont("Caros", 10);
  float pos=280;
  float totalOdd;
  ControlP5 c5;
  Textfield betMoney;
  int size;
  boolean notEnoughMoney=false;
  String moneyEmoji = "💰";
BetDisplayer(ControlP5 c5){
  this.c5=c5;
   cancle.clr=#FA3838;
   placeBet.clr=#099B33;
c5.setAutoDraw(false);
 betMoney= c5.addTextfield("")
    .setPosition(1350, pos)
    .setSize(100, 30)
    .setAutoClear(false)
    .setFont(timeFont)
    .setColorBackground(#FFFFFB)
    .setColorActive(#38FF38)
    .setColor(color(31,31,31))
    .setColorForeground(#FA3838);


}

  public void draw() {
    float temp=pos;
    int count=0;
    totalOdd=1;
    if (bet!=null && bet.match_guess.size()!=0){
    for (Football i : bet.match_guess.keySet()) {
      
      for(Guess j: bet.match_guess.get(i)){
      fill(31);
      textFont(teamFont);
      textAlign(LEFT);
      text(i.homeTeam, 1210, temp+count*100);
      textAlign(LEFT);
      text(" Vs ", 1230+textWidth(i.homeTeam), temp+count*100);
      textAlign(RIGHT);
      text(i.awayTeam, textWidth("Vs")+1550, temp+count*100);
      textAlign(CENTER);
      textFont(timeFont);
      text(j.toString(), 1250, temp+count*100+50);
      text(j.odd.value, 1400, temp+count*100+50);
      totalOdd*=j.odd.value;
      stroke(31);
      strokeWeight(1);
      line(1210,temp+count*100+60,1590,temp+count*100+60);
      
      count++;
    }
    }
    size=count+1;
    c5.draw();
    cancle.y=temp+count*100-20;
    placeBet.y=temp+count*100+20;
    cancle.drawButton();
    placeBet.drawButton();
    textSize(20);
    if(!betMoney.getText().equals("") && Float.parseFloat(betMoney.getText())>10){
     textAlign(LEFT, CENTER);
     fill(color(247, 165, 0));
     textSize(10);
     text(moneyEmoji+nf(totalOdd*Float.parseFloat(betMoney.getText()),0,2),1325,temp+count*100+50);
    }
    betMoney.setPosition(1350,temp+count*100+5);
    if (notEnoughMoney){
    fill(#FA3838);
    textAlign(LEFT);
    textSize(15);
      text("You can't bet this low",1250,temp+count*100+90);
    }
    textSize(20);
  }
  else{
  c5.setAutoDraw(false);
  }
  }


  public void addBet(BettedOn bet) {

    this.bet=bet;
  }
}
