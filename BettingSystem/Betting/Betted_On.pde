import java.util.HashMap;

class BettedOn {

  String username;
  int ticketNo=0;
  float money;
  
  HashMap <Football, ArrayList<Guess>> match_guess;
  
  BettedOn(String username,HashMap <Football, ArrayList<Guess>> match_guess) {
    this.username=username;
    this.match_guess=match_guess;
  }
  BettedOn(BettedOn bet){
    this(bet.username,bet.match_guess);
  
  }

  public void addBet(Football match, Guess guess) {
    
    if (match_guess.containsKey(match)){
      match_guess.get(match).add(guess);
     
      
    }
     else{
      ArrayList<Guess> temp= new ArrayList<Guess>();
      temp.add(guess);
     match_guess.put(match,temp);
     
     
  }
  }
}
