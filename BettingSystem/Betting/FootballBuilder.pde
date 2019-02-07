class FootballBuilder {

  FirstHalfGoals firstHalfGoals;
  FirstHalfTime firstHalfTime;
  SecondHalfGoals secondHalfGoals;
  FullTime fullTime;
  String match_id;
  String homeTeam;
  String awayTeam;
  String homeTeamGoals;
  String awayTeamGoals;
  String status;
  String duration;
  String date;
  String time;
  String league_name;
  
  public FootballBuilder FHG(FirstHalfGoals firstHalfGoals) {
    this.firstHalfGoals=firstHalfGoals;
    return this;
  }

  public FootballBuilder FHT(FirstHalfTime firstHalfTime) {
    this.firstHalfTime=firstHalfTime;
    return this;
  }

  public FootballBuilder SHG(SecondHalfGoals secondHalfGoals) {
    this.secondHalfGoals=secondHalfGoals;
    return this;
  }

  public FootballBuilder FT(FullTime fullTime) {
    this.fullTime=fullTime;
    return this;
  }


  public FootballBuilder homeTeam(String homeTeam) {
    this.homeTeam=homeTeam;
    return this;
  }
  public FootballBuilder league_name(String league_name ) {
    this.league_name=league_name;
    return this;
  }
  public FootballBuilder match_id(String match_id) {
    this.match_id=match_id;
    return this;
  }
  
   public FootballBuilder awayTeam(String awayTeam) {
    this.awayTeam=awayTeam;
    return this;
  }
  
  public FootballBuilder date(String date) {
    this.date=date;
    return this;
  }
  public FootballBuilder status(String status) {
    this.status=status;
    return this;
  }
  public FootballBuilder time(String time) {
    this.time=time;
    return this;
  }
  public Football build() {
    return new Football(this);
  }
}
