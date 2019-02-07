import java.net.*;
import java.io.*;
import de.bezier.data.sql.*;
import com.google.gson.*;
import com.google.gson.stream.*;
import com.google.gson.internal.*;
import com.google.gson.internal.bind.*;
import com.google.gson.annotations.*;
import com.google.gson.reflect.*;
import java.util.*;

class Server{
  MatchLoader matchLoader;
  SQLite db;
  SQLite db2;
  Gson gson= new Gson();
  InputStreamReader input;
  BufferedReader reader;
  PrintWriter writer;
  ServerSocket server;
  Socket user;
  String message;
  String order;
  String curUser;
  final String verifyCode="verify";
  final String signupCode="signup";
 final String  requestSeparator="!@#";
 final String matchCode="SendMeMatches";
 final String iBettedCode="IBettedOn";
 String fromDate="";
  String toDate="";
  FootballBuilder footballBuilder=new FootballBuilder();
  Server(SQLite db, SQLite db2){
    try{
  server = new ServerSocket(4433);
  this.db=db;
  this.db2=db2;
  this.db.connect();
  this.db2.connect();

  this.matchLoader= new MatchLoader();
    }
    
  catch(Exception e){e.printStackTrace();}
  }
  
  
  public void read(){
    

    try{
    input= new InputStreamReader(user.getInputStream());
    reader= new BufferedReader(input);
    message=reader.readLine();
    println(message);
    
    if (message.split(requestSeparator)[0].equals(verifyCode)){
      
      verify(message.split(requestSeparator)[1]);
      
    
    }
    else if( message.split(requestSeparator)[0].equals(signupCode)){
      
    signupUser(message.split(requestSeparator)[1]);
    }
    else if (message.split(requestSeparator)[0].equals(matchCode)){
    sendMatch();
    
    }
    else if (message.split(requestSeparator)[0].equals(iBettedCode)){
    
    registerBet(message.split(requestSeparator)[1]);
    
    }
    }
    catch(Exception e){myserver.user=null;}
 
}
public void sendMatch(){

db.query("select * from matches where match_date ");
String matchJsons="";
int count=1;
 FirstHalfTime fht=null;
  FirstHalfGoals fhg=null;
  FullTime ft=null;
  SecondHalfGoals shg=null;
while (db.next()){

  db2.query("select * from odds where match_id='%s' order by odd_name",db.getString("match_id"));
  
      while( db2.next()){
      float fh_at=db2.getFloat("odd_value");
      db2.next();
      float fh_d=db2.getFloat("odd_value");
      db2.next();
      float fh_ht=db2.getFloat("odd_value");
      db2.next();
      float fh_u15=db2.getFloat("odd_value");
      db2.next();
      float fh_u25=db2.getFloat("odd_value");
      db2.next();
      float fh_u35=db2.getFloat("odd_value");
      db2.next();
      float fh_o15=db2.getFloat("odd_value");
      db2.next();
      float fh_o25=db2.getFloat("odd_value");
      db2.next();
      float fh_o35=db2.getFloat("odd_value");
      db2.next();
      float ft_at=db2.getFloat("odd_value");
      db2.next();
      float ft_d=db2.getFloat("odd_value");
      db2.next();
      float ft_ht=db2.getFloat("odd_value");
      db2.next();
      float ft_u15=db2.getFloat("odd_value");
      db2.next();
      float ft_u25=db2.getFloat("odd_value");
      db2.next();
      float ft_u35=db2.getFloat("odd_value");
      db2.next();
      float ft_o15=db2.getFloat("odd_value");
      db2.next();
      float ft_o25=db2.getFloat("odd_value");
      db2.next();
      float ft_o35=db2.getFloat("odd_value");
      
    
     fht= new FirstHalfTime(fh_ht,fh_d,fh_at);
  fhg= new FirstHalfGoals(fh_u15,fh_u25,fh_u35,fh_o15,fh_o25,fh_o35);
  ft= new FullTime(ft_ht,ft_d,ft_at);
 shg= new SecondHalfGoals(ft_u15,ft_u25,ft_u35,ft_o15,ft_o25,ft_o35);
      }
   String [] status={"live","FT",db.getString("status"),db.getString("status"),db.getString("status"),db.getString("status"),db.getString("status") };
 Football fbMatch= footballBuilder.homeTeam(db.getString("HT"))
                                  .match_id(db.getString("match_id"))
                                  .awayTeam(db.getString("AT"))
                                  .FHT(fht)
                                  .FT(ft)
                                  .SHG(shg)
                                  .FHG(fhg)
                                  .status(status[(int)random(0,4)])
                                  .date(db.getString("match_date"))
                                  .time(db.getString("str_time"))
                                  .league_name(db.getString("league_name"))
                                  .build();
                         

 matchJsons+=gson.toJson(fbMatch)+requestSeparator;
 count++;


}
               

if (matchJsons!=""){
 println(matchJsons);
write(matchJsons);
println("sent");

}


}



public void signupUser(String statement){
  String [] userData=statement.split(",");
  
  if (db.connect()){
    db.query("select username from users where username='%s'",userData[2]);
    if (db.next()){
      
      write("false");  
    }
    else
    {
    db.query("insert into users (firstname,lastname,username,password) values ('%s','%s','%s','%s')",userData[0],
                                                                                                    userData[1],
                                                                                                     userData[2],
                                                                                                     userData[3]);
  
  write("true");
    }
  }




}
public void registerBet(String bet){

BettedOn tempBet=gson.fromJson(bet,BettedOn.class);
db.query("insert into bets (username,bet_no,money) VALUES ('%s','%f,'%f');",tempBet.getUsername(),tempBet.getTicketNo(),tempBet.getMoney());
for (Map.Entry<Football, ArrayList<Guess>> betInfo : tempBet.match_guess.entrySet()) {
                            Football betName = betInfo.getKey();
                            ArrayList<Guess> guesses = betInfo.getValue();
                            for(Guess g:guesses){
db.query("insert into everybet (match_id,odd_name,bet_no,success) VALUES ('%s','%s,'%f','false');",betName,g.odd,tempBet.getTicketNo());
//println(tempBet.getClass());
                            

}
}
}
public void showBets(){
  db.query("select b.bet_no,u.username,e.match_id,e.odd_name,b.money from bets as b, users as u,everybet as e where u.username= b.username and e.bet_no=b.bet_no;");
  
}
public  void  verify(String statement){

  
   db.query("select password from users where username='%s'",statement.split(",")[0].trim());
  if (db.next()){
  String password= db.getString("password");
  
  if (password.equals(statement.split(",")[1])){
   write("true");
   this.curUser=statement.split(",")[0];
  }else
   write("false");
  }
  else 
  write("false");

}

public void write(String message){
  try{
  writer= new PrintWriter(user.getOutputStream());
  writer.println(message);
  writer.flush();
 // println(message);
    }
    
  catch(Exception e){myserver.user=null;}
}

public JSONObject loadJson(String fromDate, String toDate, String leagueId){

return matchLoader.matchJson(fromDate,toDate,leagueId);

}
public void loadMatches(){
  
  fromDate=year()+"-"+month()+"-"+day();
  toDate=year()+"-"+month()+(int)((day()+3)/30)+"-"+((day()+3)%30);
  JSONObject json=loadJson(fromDate,toDate, "62"); // requests the matches

  
  try{
  JSONArray  matches= json.getJSONArray("matches");
 
  println("Match_id\t","league Name\t\t","Match Date\t","Home team\t\t\t","Away Team\t\t");
  for (int i=0; i<matches.size(); i++) {            // gets what it needs from the json

    JSONObject match=matches.getJSONObject(i);
    println(match.getString("match_id")+"\t\t"+match.getString("league_name")+"\t\t"+match.getString("match_date")+
      "\t "+match.getString("match_hometeam_name")+"\t\t "+match.getString("match_hometeam_score")+"\t\t"+match.getString("match_awayteam_name")+"\t\t"+
      match.getString("match_awayteam_score")+"\t\t\t"+match.getString("match_status"));
    db.query("insert into matches values('%s','%s','%s','%s','%d','%d','%d','%d','%s','%s','%s')",match.getString("match_id"),match.getString("league_name")
                                                                                                ,match.getString("match_hometeam_name"),match.getString("match_awayteam_name")
                                                                                                ,0,0,0,0,match.getString("match_status"),match.getString("match_date"),match.getString("match_time"));
                                                                                  
    JSONObject odd= getOdds(match.getString("match_id"));
    JSONArray odds= odd.getJSONArray("odds");
   
    JSONObject eachOdd=odds.getJSONObject(0);
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_HT",100/(Float.parseFloat(eachOdd.getString("prob_HW")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_D",100/(Float.parseFloat(eachOdd.getString("prob_D")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_AT",100/(Float.parseFloat(eachOdd.getString("prob_AW")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_HT",100/(Float.parseFloat(eachOdd.getString("prob_HW_D")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_D",100/(Float.parseFloat(eachOdd.getString("prob_AW_D")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_AT",100/(Float.parseFloat(eachOdd.getString("prob_HW_AW")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_o1.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_15")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_o2.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_25")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_o3.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_35")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_U1.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_-15")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_U2.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_-25")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FH_U3.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_h_-35")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_o1.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_15")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_o2.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_25")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_o3.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_35")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_U1.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_-15")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_U2.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_-25")+1)));
    db.query("insert into odds values('%s','%s','%f')",match.getString("match_id"),"FT_U3.5",100/(Float.parseFloat(eachOdd.getString("prob_ah_a_-35")+1)));
    
    
  
  
  
      // get the odds of the matches
      // store the data on the database
      // send the data to the admin and users
                                              
            
  }
println("done");}
  catch(RuntimeException e){e.printStackTrace();}
  



  }
  
  
  public JSONObject getOdds(String match_id){
  
  JSONObject json= matchLoader.oddJson(match_id);
  
    
  return json;
  
  }
public void sendMeBet(){
  db.query("select b.bet_no,u.username,u.firstname,u.lastname,e.match_id,e.odd_name,b.money from users as u,bets as b, everybet as e where u.username=b.username and e.bet_no=b.bet_no;");
  while(db.next())
{
  BettedOn bet= new BettedOn(db.getString("username"));
  
}
}





}
