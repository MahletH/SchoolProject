import java.util.ArrayList;
import java.util.HashMap;
class MatchPrinter {


  HashMap <NormalButton, Football> map= new HashMap <NormalButton, Football>();
  HashMap <String,String> dateFormat= new HashMap<String,String>(){{
                                                                    put("01","Jan");
                                                                    put("02","Feb");
                                                                    put("03","Mar");
                                                                    put("04","Apr");
                                                                    put("05","May");
                                                                    put("06","Jun");
                                                                    put("07","Jul");
                                                                    put("08","Aug");
                                                                    put("09","Sep");
                                                                    put("10","Oct");
                                                                    put("11","Nov");
                                                                    put("12","Dec");
  } };
                                                                 
  
  PFont teamFont= createFont("Noto Serif", 20);
  PFont timeFont=createFont("Caros", 15);
  float pos=280;


  public void add(Football fb) {
    NormalButton tempButton= new NormalButton((width-400)/2, 0, 1100, 150, "");
    tempButton.clr=color(231, 231, 231);
    map.put(tempButton, fb);
  }

  public void draw() {
    float temp=pos;
    int count=0;
    for (NormalButton i : map.keySet()) {
      i.y=temp+count*170;
      if (map.get(i).status_.equals("")) {
        i.drawButton();
        genaMatches(i);
      } else if (map.get(i).status_.equals("live")) {
        i.clr=color(#099B33,200);
        i.drawButton();
        liveMatches(i);
      } else if (map.get(i).status_.equals("FT")) {
        i.clr=color(#FA3838, 100);
        i.drawButton();
        ftMatches(i);
      }


      count++;
    }
  }

  public void genaMatches(NormalButton i) {

    textFont(teamFont);
    textSize(i.width_*0.15);
    rectMode(CENTER);
    fill(color(247, 165, 0));
    rect(i.x, i.y-i.width_/2+15, 400, 30, 5);
    fill(231);
    textAlign(CENTER);

    text(map.get(i).league_name, i.x, i.y-i.width_/2+15+5 ); // displays league name
    fill(50);
    textAlign(RIGHT);
    textSize(i.width_*0.25);
    text(map.get(i).homeTeam, i.x-100, i.y); // dispalys hometeam
    textAlign(CENTER);
    text("Vs", i.x, i.y+1);
    textAlign(LEFT);
    text(map.get(i).awayTeam, i.x+100, i.y); // displays away team
    textAlign(CENTER);
    textFont(timeFont);
    textSize(i.width_*0.10);
    text(map.get(i).time, i.x, i.y+40);
    textAlign(LEFT);
    textSize(i.width_*0.10);
    text(arifDate(map.get(i).date_), i.x-i.length_/2, i.y+i.width_/2-10);
  }
  public void liveMatches(NormalButton i) {

    textFont(teamFont);
    textSize(i.width_*0.15);
    rectMode(CENTER);
    fill(color(247, 165, 0), 200);
    rect(i.x, i.y-i.width_/2+15, 400, 30, 5);
    fill(231);
    textAlign(CENTER);

    text(map.get(i).league_name, i.x, i.y-i.width_/2+15+5 ); // displays league name
    fill(231);
    textAlign(RIGHT);
    textSize(i.width_*0.25);
    text(map.get(i).homeTeam, i.x-100, i.y); // dispalys hometeam
    textAlign(CENTER);
    String goals=map.get(i).GTG+" | "+map.get(i).ATG;
    text(goals, i.x, i.y+1);
    textAlign(LEFT);
    text(map.get(i).awayTeam, i.x+100, i.y); // displays away team
    textAlign(LEFT);
    textFont(timeFont);
    textSize(i.width_*0.10);
    fill(#FA3838);
    text("Live | You can't bet", i.x-i.length_/2, i.y+i.width_/2-10);
  }

  public void ftMatches(NormalButton i) {

    textFont(teamFont);
    textSize(i.width_*0.15);
    rectMode(CENTER);
    fill(color(247, 165, 0), 100);
    rect(i.x, i.y-i.width_/2+15, 400, 30, 5);
    fill(231);
    textAlign(CENTER);

    text(map.get(i).league_name, i.x, i.y-i.width_/2+15+5 ); // displays league name
    fill(50);
    textAlign(RIGHT);
    textSize(i.width_*0.25);
    text(map.get(i).homeTeam, i.x-100, i.y); // dispalys hometeam
    textAlign(CENTER);
    String goals=map.get(i).GTG+" | "+map.get(i).ATG;
    text(goals, i.x, i.y+1);
    textAlign(LEFT);
    text(map.get(i).awayTeam, i.x+100, i.y); // displays away team
    textAlign(LEFT);
    textFont(timeFont);
    textSize(i.width_*0.10);
    fill(#FA3838);
    text("Match ended | You can't bet", i.x-i.length_/2, i.y+i.width_/2-10);
  }
  public String arifDate(String date){
  
    String [] dates= date.split("-");
    String arifDate=dateFormat.get(dates[1])+" "+dates[2] +" | "+dates[0];
    return  arifDate;
  }
}
