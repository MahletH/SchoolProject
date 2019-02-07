import java.net.*;
import java.io.*;
class User{

Socket connector;
InputStreamReader input;
BufferedReader reader;
PrintWriter writer;
String message="";
User(){
   try{
  connector= new Socket("localhost",4433);
  
    }
    
  catch(Exception e){e.printStackTrace();}
  }
  
  
  
  public    void send (String messageSent){
     try{
  writer= new PrintWriter(connector.getOutputStream());
  writer.println(messageSent);
  writer.flush();
    }
    
  catch(Exception e){e.printStackTrace();}
  
  
  }
  
  public   void  read(){
    
    try{
    input= new InputStreamReader(connector.getInputStream());
    reader= new BufferedReader(input);
    message=reader.readLine();
    println(message+"----------");
    
    }
    
    catch(Exception e){e.printStackTrace();}
 
}
  




}
