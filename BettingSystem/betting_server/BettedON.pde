import java.util.HashMap;
import java.util.ArrayList;
class BettedOn {

  String username;
  int ticketNo=0;
  float money;
  
  HashMap <Football, ArrayList<Guess>> match_guess= new HashMap <Football, ArrayList<Guess>> ();
  HashMap <String, ArrayList<Guess>> match_guess2= new HashMap <String, ArrayList<Guess>> ();
  BettedOn(String username) {
    this.username=username;
  }

  public void addBet(Football match, Guess guess) {
    
    if (match_guess.containsKey(match)){
      match_guess.get(match).add(guess);
      match_guess2.get(match.match_id).add(guess);
    }
     else{
      ArrayList<Guess> temp= new ArrayList<Guess>();
      temp.add(guess);
     match_guess.put(match,temp);
     match_guess2.put(match.match_id,temp);
  }
  }
  public void setUsername(String name){
    this.username=name;
  }
  public String getUsername(){
    return this.username;
  }
  public void setTicketNo(int no){
    this.ticketNo=no;
  }
  public int getTicketNo(){
    return this.ticketNo;
  }
  public void setMoney(float amount){
    this.money=amount;
  }
  public float getMoney(){
    return this.money;
  }
}
