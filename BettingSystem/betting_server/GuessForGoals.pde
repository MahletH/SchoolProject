

public  class GuessForGoals {



  Guess under1$5;
  Guess under2$5;
  Guess under3$5;
  Guess over1$5;
  Guess over2$5;
  Guess over3$5;

  public GuessForGoals( float under1$5,String u1, float under2$5,String u2, float under3$5,String u3, float over1$5,String o1, float over2$5,String o2, float over3$5,String o3) {
   
    this.under1$5= new Guess( under1$5,u1);
    this.under2$5= new Guess(under2$5,u2);
    this.under3$5= new Guess(under3$5,u3);
    this.over1$5= new Guess(over1$5,o1);
    this.over2$5= new Guess(over2$5,o2);
    this.over3$5= new Guess(over3$5,o3);
  }
}
