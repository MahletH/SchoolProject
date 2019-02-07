class Events {
  StringList matches;
  StringList matchesTime;
  IntList dailyTotalMatches;
  StringList bets;
  StringList moneyGained, moneyLost;
  StringList ticketIDs;
  StringDict usernames;
  StringDict ticketMoney;
  float totalMoneyGained, totalMoneyLost;
  float netMoney;
  int totalMatches;
  int totalBets;
  char matchesDelimeter = ',';
  char matchesTimeDelimeter = ',';
  char betsDelimeter = ',';
  String currency = "ETB";
  Gson gson=new Gson();
  Events () {
    matches = new StringList ();
    matchesTime = new StringList ();
    dailyTotalMatches = new IntList ();
    bets = new StringList ();
    moneyGained = new StringList ();
    moneyLost = new StringList ();
    ticketIDs = new StringList ();
    usernames = new StringDict ();
    ticketMoney = new StringDict ();

    //matches.append("Arsenal - Chealsea, Man. United - Man. City, Southampton - Liverpool");
    //matches.append("Arsenal - Chealsea, South Ampton - Liverpool");
    //matches.append("Blackburn Rovers - Watford, South Ampton - Liverpool, Sunderland - Hull City, Blackburn Rovers - Watford, South Ampton - Liverpool, Sunderland - Hull City, Blackburn Rovers - Watford, South Ampton - Liverpool, Sunderland - Hull City, Blackburn Rovers - Watford, South Ampton - Liverpool, Sunderland - Hull City");

    //matchesTime.append("12:45, 14:30, 20:45");
    //matchesTime.append("22:45, 10:45");
    //matchesTime.append("12:00, 22:30, 19:45, 12:00, 22:30, 19:45, 12:00, 22:30, 19:45, 12:00, 22:30, 19:45");

   

    //bets.append("0, 0, 1");
    //bets.append("1, 1");
    //bets.append("0, 0, 0, 0, 1, 0, 1, 0");

    moneyGained.append("309.25");
    moneyGained.append("35.02");
    moneyGained.append("1035.04");

    moneyLost.append("0.59");
    moneyLost.append("11.0");
    moneyLost.append("114.5");

    // 2gnaw page
    
    ticketIDs.append("AFC-4390911");
    ticketIDs.append("AFC-4391002");
    ticketIDs.append("AFC-4390913");
    ticketIDs.append("AFC-4391004");
    ticketIDs.append("AFC-4390915");
    ticketIDs.append("AFC-4391006");

    usernames.set("AFC-4390911", "sitefloss");
    usernames.set("AFC-4391002", "visiblyskinning");
    usernames.set("AFC-4390913", "sitefloss2");
    usernames.set("AFC-4391004", "visiblyskinning2");
    usernames.set("AFC-4390915", "sitefloss3");
    usernames.set("AFC-4391006", "visiblyskinning3");

    ticketMoney.set("AFC-4390911", "150.00");
    ticketMoney.set("AFC-4391002", "123.00");
    ticketMoney.set("AFC-4390913", "50.00");
    ticketMoney.set("AFC-4391004", "23.00");
    ticketMoney.set("AFC-4390915", "15.00");
    ticketMoney.set("AFC-4391006", "13.00");

    totalMoneyGained = 3001.57;
    totalMoneyLost = 401.05;
    netMoney = totalMoneyGained - totalMoneyLost;
    totalBets = getTotalNumberOfBets ();
    totalMatches = getTotalNumberOfMatches ();
  }
  
  
  void setMatches(String match){
    
  String matchDate="";
  String matchList="";
  String matchTimeList="";
  
     for (String m : match.trim().split(requestSeparator)) {
       
       Football tempMatch= gson.fromJson(m, Football.class);
       if (matchDate==""){
         
         matchDate=tempMatch.date;
         matchList+=tempMatch.homeTeam+" - "+tempMatch.awayTeam+matchesDelimeter;  
         matchTimeList+=tempMatch.time+matchesTimeDelimeter;
     }
        else if (matchDate==tempMatch.date){
         matchList+=tempMatch.homeTeam+" - "+tempMatch.awayTeam+matchesDelimeter;  
         matchTimeList+=tempMatch.time+matchesTimeDelimeter;
      }
        else{
      matches.append(matchList);
      matchesTime.append(matchTimeList);
    }
     }
     matches.append(matchList);
     matchesTime.append(matchTimeList);
     
  dailyTotalMatches.clear();
   for (int a = 0; a < matches.size(); a ++)
      dailyTotalMatches.append(getMatches(a).size());

  
  
 bets.append("0, 0, 0, 0, 1, 0, 1");
  
  }
  StringList getMatches (int day) {
    StringList matches = new StringList ();
    try {
      String matchesArr [] = split(this.matches.get(day), matchesDelimeter);
      for (String match : matchesArr)
        matches.append(match.trim());
    }
    catch (Exception e) {
    }
    return matches;
  }
  StringList getBets (int day) {
    StringList bets = new StringList ();
    try {
      String betsArr [] = split(this.bets.get(day), betsDelimeter);
      for (String bet : betsArr)
        bets.append(bet.trim());
    }
    catch (Exception e) {
    }
    return bets;
  }
  StringList getMatchTimes (int day) {
    StringList matchesTime = new StringList ();
    try {
      String matchesTimeArr [] = split(this.matchesTime.get(day), matchesTimeDelimeter);
      for (String matchTime : matchesTimeArr)
        matchesTime.append(matchTime.trim());
    }
    catch (Exception e) {
    }
    return matchesTime;
  }
  int getNumberOfMatches (int day) {
    int numberOfMatches = 0;

    try {
      numberOfMatches = (split(matches.get(day), matchesDelimeter).length - 1);
    }
    catch (Exception e) {
    }

    return numberOfMatches;
  }
  int getNumberOfBets (int day) {
    int numberOfBets = 0;

    try {
      String splitted [] = split(bets.get(day), betsDelimeter);
      for (String split : splitted)
        numberOfBets += int(split.trim());
    }
    catch (Exception e) {
    }

    return numberOfBets;
  }
  int getTotalNumberOfBets () {
    int totalNumberOfBets = 0;

    for (int a = 0; a < bets.size(); a ++)
      totalNumberOfBets += getNumberOfBets(a);

    return totalNumberOfBets;
  }
  int getTotalNumberOfMatches () {
    int totalNumberOfMatches = 0;

    for (int matches : dailyTotalMatches)
      totalNumberOfMatches += matches;

    return totalNumberOfMatches;
  }
}
