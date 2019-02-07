

abstract public class GuessForTeams {

  
  
    Guess homeTeamWin;
    Guess draw;
    Guess awayTeamWin;
    
    public GuessForTeams(float homeTeamWins,String ht,float draw,String d,float awayTeamWins,String at) {
        
        this.homeTeamWin=new Guess(homeTeamWins,ht);
        this.draw=new Guess(draw,d);
        this.awayTeamWin= new Guess(awayTeamWins,at);
    }
      

}
