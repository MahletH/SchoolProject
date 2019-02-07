import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
class DaysOfWeek {  
  String date;
  String fullDate;
  String TODAY;
  String TOMORROW;
  String DAY_AFTER_TOMORROW;
  String daysArr [] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
  StringDict dayNumbers;
  StringList days;
  DaysOfWeek () {
    days = new StringList ();
    dayNumbers = new StringDict ();
    int counter = 0;
    for (String day : daysArr) {
      days.append(day);
      dayNumbers.set(day, str(counter++));
    }
    update();
  }

  String dayOfWeek (String dateInNumber) {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy", java.util.Locale.ENGLISH);
    try {
      Date date = sdf.parse(dateInNumber);
      sdf.applyPattern("EEE, d MMM yyyy");
      String dayOfWeek = sdf.format(date);
      fullDate = dayOfWeek;
      dayOfWeek = split(dayOfWeek, ",") [0];
      for (String day : days)
        if (day.startsWith(dayOfWeek))
          return day;
    }
    catch (Exception e) {
      println(e);
    }
    return null;
  }
  void update () {
    date = day () + "/" + month () + "/" + year ();
    TODAY = dayOfWeek (date);
    int number = int(dayNumbers.get(TODAY));
    number += number >= 5? -6 : 1;
    TOMORROW = days.get(number);
    
    number = int(dayNumbers.get(TODAY));
    number += number >= 5? -5 : 2;
    DAY_AFTER_TOMORROW = days.get(number);
  }
}
