import java.net.*;
import java.io.*;
class User{

Socket connector;
InputStreamReader input;
BufferedReader reader;
PrintWriter writer;
String username;
String message="";
boolean connected=false;
User(){
  connect();
  }
  
  
  
  public   void send (String messageSent){
     try{
  writer= new PrintWriter(connector.getOutputStream());
  writer.println(messageSent);
  writer.flush();
    }
 catch(Exception e){connected=false;
                        connect();}
  
  }
  
  public   void  read(){
    
    try{
    input= new InputStreamReader(connector.getInputStream());
    reader= new BufferedReader(input);
    message=reader.readLine();
    println("In user"+message);
    
    }
    
    catch(Exception e){connected=false;
                        connect();}
 
}
  
 public void connect(){
 
  try{
  connector= new Socket("localhost",4433);
  connected=true;
  
    }
    
  catch(Exception e){e.printStackTrace();}
 }




}
