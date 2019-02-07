import java.util.HashMap;
class OddDisplayer{
  
ArrayList <NormalButton> fhtOdds= new ArrayList <NormalButton>();
ArrayList <NormalButton> ftOdds= new ArrayList <NormalButton>();
ArrayList <NormalButton> fhgOdds= new ArrayList <NormalButton>();
ArrayList <NormalButton> ftgOdds= new ArrayList <NormalButton>();
  
  HashMap <NormalButton, Guess> map= new HashMap <NormalButton, Guess>();
  PFont teamFont= createFont("Noto Serif", 35);
  PFont betFont=createFont("Caros", 15); 
  Football match;
 OddDisplayer(){



  for (int i=0;i<3;i++)
  fhtOdds.add(new NormalButton(250+i*400,350,200,50,""));
  
  for (int i=0;i<3;i++)
  ftOdds.add(new NormalButton(250+i*400,450,200,50,""));
  
  for (int i=0;i<2;i++){
    
    for (int j=0;j<3;j++){
      
    fhgOdds.add(new NormalButton(250+i*400,570+j*55,200,50,""));
  }
  
  }
  for (int i=0;i<2;i++){
    for (int j=0;j<3;j++){
    ftgOdds.add(new NormalButton(250+i*400,790+j*55,200,50,""));
}
  }

}

public void draw(){
   fill(50);
    textAlign(CENTER);
    textFont(teamFont);
    text(match.homeTeam,250, 250); // dispalys hometeam
    textAlign(CENTER);
    text("Vs", 250+400, 250);
    textAlign(RIGHT);
    text(match.awayTeam, 1150, 250); 
    textFont(betFont);
    textAlign(LEFT);
    text("First Half Time Result",250-120,300);
    text("Full Time Result",250-120,405);
    text("First Half Goals",250-120,520);
    text("Full Time Goals",250-120,745);
for (NormalButton i: fhtOdds)
  i.drawButton();
  
for (NormalButton i: ftOdds)
  i.drawButton();
  
for (NormalButton i: fhgOdds)
  i.drawButton();  
  
for (NormalButton i: ftgOdds)
  i.drawButton();  
  
   





}

public void loadOdds(Football match){
  this.match=match;
  //first half winner guess
  
  fhtOdds.get(0).discription="HT win | "+(nf(match.firstHalfTime.homeTeamWin.odd.value,0,2));
  map.put( fhtOdds.get(0),match.firstHalfTime.homeTeamWin);
  
   fhtOdds.get(1).discription="Draw | "+nf(match.firstHalfTime.draw.odd.value,0,2);
  map.put( fhtOdds.get(1),match.firstHalfTime.draw);
  
 fhtOdds.get(2).discription="AT win | "+nf(match.firstHalfTime.awayTeamWin.odd.value,0,2);
  map.put( fhtOdds.get(2),match.firstHalfTime.awayTeamWin);
  

// fulltime winner guess
  ftOdds.get(0).discription="HT win | "+nf(match.fullTime.homeTeamWin.odd.value,0,2);
  map.put( ftOdds.get(0),match.fullTime.homeTeamWin);

 ftOdds.get(1).discription="Draw | "+nf(match.fullTime.draw.odd.value,0,2);
  map.put( ftOdds.get(1),match.fullTime.draw);

 ftOdds.get(2).discription="AT win | "+nf(match.fullTime.awayTeamWin.odd.value,0,2);
  map.put( ftOdds.get(2),match.fullTime.awayTeamWin);
  
  
  // first half goal guess
 
 fhgOdds.get(0).discription="under1.5 | "+nf(match.firstHalfGoals.under1$5.odd.value,0,2);
  map.put( fhgOdds.get(0),match.firstHalfGoals.under1$5);
  
   fhgOdds.get(1).discription="under2.5 | "+nf(match.firstHalfGoals.under2$5.odd.value,0,2);
  map.put( fhgOdds.get(1),match.firstHalfGoals.under2$5);

    fhgOdds.get(2).discription="under3.5 | "+nf(match.firstHalfGoals.under3$5.odd.value,0,2);
  map.put( fhgOdds.get(2),match.firstHalfGoals.under3$5);
  
    fhgOdds.get(3).discription="over1.5 | "+nf(match.firstHalfGoals.over1$5.odd.value,0,2);
  map.put( fhgOdds.get(3),match.firstHalfGoals.over1$5);
  
   fhgOdds.get(4).discription="over2.5 | "+nf(match.firstHalfGoals.over2$5.odd.value,0,2);
  map.put( fhgOdds.get(4),match.firstHalfGoals.over2$5);
  
   fhgOdds.get(5).discription="over.35 | "+nf(match.firstHalfGoals.over3$5.odd.value,0,2);
  map.put( fhgOdds.get(5),match.firstHalfGoals.over3$5);
 
 
 
 // fulltime score guess
  
 ftgOdds.get(0).discription="under1.5 | "+nf(match.secondHalfGoals.under1$5.odd.value,0,2);
  map.put( ftgOdds.get(0),match.secondHalfGoals.under1$5);
  
   ftgOdds.get(1).discription="under2.5 | "+nf(match.secondHalfGoals.under2$5.odd.value,0,2);
  map.put( ftgOdds.get(1),match.secondHalfGoals.under2$5);
 
    ftgOdds.get(2).discription="under3.5 | "+nf(match.secondHalfGoals.under3$5.odd.value,0,2);
  map.put( ftgOdds.get(2),match.secondHalfGoals.under3$5);
  
    ftgOdds.get(3).discription="over1.5 | "+nf(match.secondHalfGoals.over1$5.odd.value,0,2);
  map.put( ftgOdds.get(3),match.secondHalfGoals.over1$5);
  
   ftgOdds.get(4).discription="over2.5 | "+nf(match.secondHalfGoals.over2$5.odd.value,0,2);
  map.put( ftgOdds.get(4),match.secondHalfGoals.over2$5);
  
   ftgOdds.get(5).discription="over.35 | "+nf(match.secondHalfGoals.over3$5.odd.value,0,2);
  map.put( ftgOdds.get(5),match.secondHalfGoals.over3$5);


}






}
