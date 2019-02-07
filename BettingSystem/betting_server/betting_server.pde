import de.bezier.data.sql.*;
SQLite db;
SQLite db2;
Server myserver;
boolean doneLoading=false;
void setup() {
  db= new SQLite(this, "betting.db");
  db2=new SQLite(this,"betting2.db");
  
  myserver= new Server(db,db2);
}

void draw() {
  if (!doneLoading)
   //thread("loadMatch");
    if (myserver.user==null) {
      try {
        myserver.user= myserver.server.accept();
        println("connceted");
      }
      catch(Exception e) {
        e.printStackTrace();
      }
    } else {

    thread("read");
  }
}
public void read() {
  myserver.read();
}

public void loadMatch() {

  myserver.loadMatches();
  doneLoading=true;
}
