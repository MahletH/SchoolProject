
class MyBetDisplayer {
  ArrayList <BettedOn> bets= new ArrayList <BettedOn> (); 
  ArrayList  <HashMap <Football, ArrayList<Guess>>> betList = new  ArrayList  <HashMap <Football, ArrayList<Guess>>>();
  float pos=280;
  PFont teamFont= createFont("Noto Serif", 20);
  PFont timeFont=createFont("Caros", 15);


  public void draw() {

    float temp=pos;
    int count=0;
    
    for(HashMap <Football, ArrayList<Guess>> aBet: betList){
      
      for (Football i : aBet.keySet()) {
        
        for (Guess j : aBet.get(i)) {
          fill(31);
          textFont(teamFont);
          textAlign(LEFT);
          text(i.homeTeam, 100, temp+count*100);
          textAlign(LEFT);
          text(" Vs ", 100+textWidth(i.homeTeam), temp+count*100);
          textAlign(RIGHT);
          text(i.awayTeam, textWidth("Vs")+500, temp+count*100);
          textAlign(CENTER);
          textFont(timeFont);
          text(j.toString(), 100, temp+count*100+50);
          text(j.odd.value, 500, temp+count*100+50);
          stroke(31);
          strokeWeight(1);
          line(1210, temp+count*100+60, 1590, temp+count*100+60);

          count++;
        } 
      }
    }
  }





  public void addBets(BettedOn bet) {
  HashMap <Football, ArrayList<Guess>> temp= new HashMap <Football, ArrayList<Guess>>();
  for (Football i: bet.match_guess.keySet()){
  
    temp.put(i,bet.match_guess.get(i));
  
  }
  betList.add(temp);
    
    
  }
}
