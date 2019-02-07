import org.jsoup.examples.*;
import org.jsoup.helper.*;
import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.parser.*;
import org.jsoup.safety.*;
import org.jsoup.select.*;
import org.jsoup.internal.*;
import org.jsoup.nodes.Attributes;

class MatchLoader{

  String APIkey = "23e0dbb141518a8c9b91a54d414796c4249cadfe9b383d869ee8bcc40940e5d8";

public JSONObject matchJson(String fromDate,String toDate, String leagueId) {

  // returns the json of the matches
  

 String link=getMatches(fromDate,toDate,leagueId);
  String strJson="{ matches:"+(getDocument(link)).toString().split("<body>")[1].split("</body>")[0]+"}";
  

  return JSONObject.parse(strJson);
  
 
  }


 public String getMatches (String from, String to, String league_id) {
   // returns the link for the matches available between the specified dates and league id  
   String link;
      String getEvents = "https://apifootball.com/api/?action=get_events";
    
    link =getEvents + "&" + "from=" + from + "&" + "to=" + to + "&" + "league_id=" + league_id + "&" + "APIkey=" + APIkey;
    return link;
 
    
  }
  
  public String getOdds(String match_id){
  // gives the link to get the odds
    String link;
      String getEvents = "https://apifootball.com/api/?action=get_predictions";
   
    link =getEvents + "&" +  "match_id=" +match_id+ "&" + "APIkey=" + APIkey;
    return link;
    
 
  }
  
  public JSONObject oddJson(String match_id){
    // returns the json of the odds of the match 
    String link=getOdds(match_id);
    String strJson="{ odds:"+(getDocument(link)).toString().split("<body>")[1].split("</body>")[0]+"}";
    

  return JSONObject.parse(strJson);
  
    
  
  
  
  
  }

  
  public Document getDocument (String url) {
     int timeout = 10000000;
    try {
      Document doc  = Jsoup.connect(url)
        .ignoreContentType(true)
        .timeout(timeout).validateTLSCertificates(false).get();
      return doc;
    }
    catch (Exception e) {
      println("page 404");
      return null;
    }
  }



}
