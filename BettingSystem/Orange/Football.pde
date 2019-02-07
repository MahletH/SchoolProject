

public class Football extends Sport {


  FirstHalfGoals firstHalfGoals;
  FirstHalfTime firstHalfTime;
  SecondHalfGoals secondHalfGoals;
  FullTime fullTime;
  String match_id;
  String homeTeam;
  String awayTeam;
  String hT_GTG="0";
  String hT_ATG="0";
  String GTG="0";
  String ATG="0";
  String status_;
  String duration;
  String date_;
  String time;
  String league_name;
  Football(FootballBuilder builder) {
    //bets.add(builder.firstHalfTime);
    //bets.add(builder.fullTime);
    //bets.add(builder.firstHalfGoals);
    //bets.add(builder.secondHalfGoals);
    this.firstHalfGoals=builder.firstHalfGoals;
    this. firstHalfTime=builder.firstHalfTime;
    this. secondHalfGoals=builder.secondHalfGoals;
    this. fullTime=builder.fullTime;
    this. homeTeam=builder.homeTeam;
    this. awayTeam=builder.awayTeam;
    this.date_=builder.date;
    this.status_=builder.status;
    this.league_name=builder.league_name;
    this.time=builder.time;
    this.match_id=builder.match_id;
  }

  // displaying method goes here  one for the match displaying and other for the odd displaying
}
