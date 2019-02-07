import java.util.HashMap;
import java.util.Map;

class Pages extends DaysOfWeek {
  int number;
  int current;
  IntList values;
  StringList labels;
  float barHeight;

  Pages () {
    barHeight = relativeDimension*0.04;
    number = 3;
    current = 0;
    labels = new StringList ();    
    labels.append("Today");
    labels.append(TOMORROW);
    labels.append(DAY_AFTER_TOMORROW);

    values = new IntList ();
    for (int a = 0; a < events.totalBets; a ++)
      values.append(int(events.getNumberOfBets(a)));
  }
}
class BottomPagesGUI extends Pages {
  float diameter, smallDiameter, hoveringDiameter;
  float gap;
  float startX, startY;
  float pWidth, pHeight;
  float unselectedThickness = 1;
  float selectedThickness = 2;
  float bottomLineLength;
  float bottomLineThickness = 0.4;
  float textSize;
  float X, Y;

  BottomPagesGUI () {
    pWidth = width;
    pHeight = pages.barHeight;

    diameter = pHeight*0.2;
    hoveringDiameter = diameter*2;
    smallDiameter = diameter*0.6;
    gap = 2*diameter;
    bottomLineLength = pWidth*0.8;
    textSize = pHeight*0.13;
    startX = (pWidth - number*diameter - (number - 1)*gap)/2;
    startY = height - pHeight + (pHeight - diameter)/2;
  }
  void draw () {
    textFont(fonts.arimoRegular);
    for (int a = 0; a < 1; a ++) {
      float x = startX + gap*2 + diameter*(a) + diameter/2-17;
      float y = startY + diameter/2;

      if (tools.circleHovered(x, y, diameter, CENTER)) {
        noStroke();
        fill(mousePressed? colors.pagesClicked : colors.pagesHovering);
        circle (x, y, hoveringDiameter);

        fill(colors.pagesBorderUnselected);
        circle (x, y, smallDiameter);
      }
      if (pages.current == a) {
        noFill();
        stroke(colors.pagesBorderSelected);
        strokeWeight(selectedThickness);
        circle (x, y, diameter);

        noStroke();
        fill(colors.pagesBorderSelected);
        circle (x, y, smallDiameter);
      } else {
        noFill();
        stroke(colors.pagesBorderUnselected);
        strokeWeight(unselectedThickness);
        circle (x, y, diameter);
      }

      textSize(textSize);
      x += diameter/2;
      y -= diameter/2;
      textAlign(LEFT, BOTTOM);
      fill(pages.current == a? colors.pagesBorderSelected : colors.pagesBorderUnselected);
      //text(values.get(a), x, y);
    }

    //stroke(colors.pagesBorderUnselected);
    //strokeWeight(bottomLineThickness);
    //float x1 = width/2 - bottomLineLength/2;
    //float y1 = height - pHeight;
    //float x2 = width/2 + bottomLineLength/2;
    //float y2 = height - pHeight;
    //line(width/2, height - pHeight, x1, y1);
    //line(width/2, height - pHeight, x2, y2);
  }
  void mouseReleased () {
    for (int a = 0; a < 1; a ++) {
      float x = startX + gap*a + diameter*a + diameter/2;
      float y = startY + diameter/2;

      if (tools.circleHovered(x, y, diameter, CENTER)) {
        pages.current = a;
        bodyDetailGUI = new BodyDetailGUI ();
        bodyPagesGUI = new BodyPagesGUI ();
        break;
      }
    }
  }
}
class BodyPagesGUI extends BottomPagesGUI {
  float bWidth, bHeight;
  float unselectedThickness = 1;
  float selectedThickness = 2;
  float bodyLineLength;
  float bodyLineX, bodyLineY;
  float leftMost;
  float titleTextSize;
  float contentTextSize;
  float eachW, eachH;
  float x, y;
  float w, h;
  float bufferY;
  float columnsProportion [];
  float wheelFactor = 1.4;
  float scrollMinY, scrollMaxY;
  float scrollLength;
  float scrollThickness;
  float scrollX, scrollY;
  float shadowLength;
  float scrollFactor;
  float titleHeight;
  float scrollOpacity;
  int rows, columns;
  int maxRows, maxColumns;

  StringList matches;
  StringList matchesTime;
  StringList bets;

  boolean verticalScrollingRequired, mouseOnScroll;

  BodyPagesGUI () {
    maxRows = 7;
    maxColumns = 2;
    matches = new StringList ();
    matchesTime = new StringList();
    bets = new StringList ();

    scrollOpacity = 200;
    matches = events.getMatches(pages.current);
    matchesTime = events.getMatchTimes(pages.current);
    bets = events.getBets(pages.current);

    titleTextSize = relativeDimension*0.015;
    contentTextSize = relativeDimension*0.008;
    rows = matches.size();
    bWidth = width*0.9/2;
    textSize(titleTextSize);
    bHeight = height - pages.barHeight*2 - (textAscent() + textDescent());
    columnsProportion = new float [] {0.3, 0.7};
    columns = columnsProportion.length;
    startX = (width/2 - bWidth)/2;
    leftMost = startX;
    eachW = bWidth;
    eachH = bHeight/maxRows;
    bufferY = relativeDimension*0.01;
    shadowLength = relativeDimension*0.015;

    scrollFactor = rows < maxRows*2? map(rows, maxRows, maxRows*2, 0.9, 0.3) : 0.1;
    scrollLength = bHeight*scrollFactor;
    scrollMaxY = height - pages.barHeight - scrollLength;
    scrollThickness = relativeDimension*0.0025;
    scrollX = width/2;

    textSize(titleTextSize);
    scrollMinY = pages.barHeight + textAscent() + textDescent();
    titleHeight = scrollMinY;
    scrollY = scrollMinY;

    verticalScrollingRequired = (rows > maxRows);

    startY = scrollMinY;
    startY += verticalScrollingRequired ? 0 : (bHeight - eachH*matches.size())/2;
  }
  void draw () {
    textFont(fonts.arimoRegular);
    strokeWeight(unselectedThickness);
    stroke(colors.bodyBarUnselected);
    line(width/2, height/2, width/2, scrollMinY);
    line(width/2, height/2, width/2, height - pages.barHeight);

    noFill();
    stroke(colors.lightGrey, 60);
    rectMode(CORNER);
    textAlign(CENTER, CENTER);
    textSize(contentTextSize);
    rectMode(CORNER);
    float nowX = 0;
    String content = "";
    for (int a = 0; a < matches.size(); a ++) {
      for (int b = 0; b < columns; b ++) {
        x = startX;
        y = startY + eachH*a;
        if (y < pages.barHeight || y > height - pages.barHeight)
          continue;
        w = eachW*columnsProportion [b];
        h = eachH;
        nowX = 0;
        for (int c = 0; c < b; c ++)
          nowX += eachW*columnsProportion [c];
        x += nowX;
        content = "-";
        if (b == 0) {
          fill(bets.get(a).equals("0")? colors.lightGrey : colors.theme);
          content = matchesTime.get(a);
        } else if (b == 1) {
          fill(bets.get(a).equals("0")? colors.darkGrey : colors.theme);
          content = matches.get(a);
        }

        text(content, x, y, w, h);
        strokeWeight(1);
        x += w/2;
        if (a > 0  && a < rows)
          line(x - w/2, y, x + w/2, y);
      }
    }
    noStroke();
    fill(colors.background);
    rectMode(CORNER);
    rect(startX, scrollMinY - eachH, bWidth, eachH);
    rect(startX, height - pages.barHeight, bWidth, eachH);
    if (verticalScrollingRequired) {
      if (tools.rectHovered(scrollX - scrollThickness/2, scrollY, scrollThickness, scrollLength, CORNER))
        stroke(colors.theme);
      else
        stroke(colors.theme, scrollOpacity);
      strokeWeight(scrollThickness);
      strokeCap(PROJECT);
      line(scrollX, scrollY, scrollX, scrollY + scrollLength);

      startY = map(scrollY, scrollMinY, scrollMaxY, scrollMinY, pages.barHeight - (rows - 0.5)*eachH + bHeight);

      strokeWeight(1);
      for (int a = 0; a < shadowLength; a ++) {
        stroke(colors.background, map(a, 0, shadowLength, 255, 0));
        line(startX, scrollMinY + a, startX + bWidth, scrollMinY + a);

        stroke(colors.background, map(a, 0, shadowLength, 255, 0));
        line(startX, height - pages.barHeight - a, startX + bWidth, height - pages.barHeight - a);
      }
    }
    textSize(titleTextSize);
    textAlign(LEFT, TOP);
    fill(colors.bodyTitle);
    text(labels.get(pages.current), leftMost, pages.barHeight);
  }
  void mousePressed () {
    if (tools.rectHovered(scrollX - scrollThickness/2, scrollY, scrollThickness, scrollLength, CORNER))
      mouseOnScroll = true;
  }
  void mouseReleased () {
    mouseOnScroll = false;
  }
  void mouseWheel(MouseEvent event) {
    float wheelDirection = event.getCount();
    scrollY += wheelDirection*wheelFactor;
    scrollY = constrain(scrollY, scrollMinY, scrollMaxY);
  }
  void mouseDragged () {
    scrollY = map(constrain(mouseY, scrollMinY, height - pages.barHeight + eachH/2), scrollMinY, scrollMaxY, scrollMinY, scrollMaxY);
    scrollY = constrain(scrollY, scrollMinY, scrollMaxY);
  }
}
class BodyDetailGUI extends BodyPagesGUI {
  int columns, rows;
  int totalMatches;
  int totalBets;
  float moneyGained, moneyLost;
  float dWidth, dHeight;
  float eachW, eachH;
  float startX, starty;
  float  textSize;
  BodyDetailGUI () {
    columns = 1;
    rows = 3;
    totalMatches = events.dailyTotalMatches.get(pages.current);
    totalBets = events.getNumberOfBets(pages.current);
    moneyGained = float(events.moneyGained.get(pages.current));
    moneyLost = float(events.moneyLost.get(pages.current));
    bWidth = width*0.9/2;
    bHeight = bodyPagesGUI.bHeight*0.4;
    eachW = bWidth;
    eachH = bHeight/rows;
    textSize = eachH*0.4;
  }
  void draw () {
    textFont(fonts.arimoRegular);

    fill(colors.matchesTimeContent);
    textSize(textSize);
    textAlign(CENTER, CENTER);

    startX = width/2 + (width/2 - bWidth)/2 + (bWidth - columns*eachW)/2;
    startY = pages.barHeight + ((height - pages.barHeight*2) - bHeight)/2 + (bHeight - eachH*rows)/2;

    startX += eachW/2;
    startY += eachH/2;
    text(totalMatches + " match" + (totalMatches == 1? "" : "es"), startX, startY);
    startY += eachH;
    text(totalBets + " bet" + (totalBets == 1? "" : "s"), startX, startY);
    startY += eachH;
    text("▲" + moneyGained + " | ▼" + moneyLost, startX, startY);
  }
}
class CurrentTimeAndDate {
  String time;
  String date;
  float bufferX, bufferY;
  float timeTextSize;
  float dateTextSize;
  float startX, startY;
  CurrentTimeAndDate () {
    bufferX = relativeDimension*0.003;
    bufferY = bufferX;
    startX = width - bufferX;
    timeTextSize = relativeDimension*0.015;
    dateTextSize = relativeDimension*0.007;
  }
  void draw () {
    textFont(fonts.arimoRegular);
    time = (hour() < 10? "0" : "") + hour() + ":" + (minute() < 10? "0" : "") + minute ();
    time = time.trim();
    date = daysOfWeek.fullDate;
    date = cutYear (date);
    startY = bufferY;
    textSize(timeTextSize);
    fill(colors.theme);
    textAlign(RIGHT, TOP);
    text(time, startX, startY);

    startY += textDescent() + textAscent();
    textSize(dateTextSize);
    fill(colors.lightGrey);
    textAlign(RIGHT, TOP);
    text(date, startX, startY);
  }
  String cutYear (String date) {
    String splitted [] = split(date, " ");
    String cut = "";
    for (int a = 0; a < splitted.length - 1; a ++)
      cut += splitted [a] + " ";
    return cut.trim();
  }
}
class NetMoneyGUI {
  float w, h;
  float netTextSize;
  float detailTextSize;
  float currencyTextSize;
  float startX, startY;
  float curveRadius;
  NetMoneyGUI () {
    w = width/4;
    h = pages.barHeight*0.8;
    netTextSize = relativeDimension*0.015;
    detailTextSize = relativeDimension*0.006;
    curveRadius = h/2;
  }
  void draw () {
    textFont(fonts.arimoRegular);
    startX = 0;
    startY = 0;
    noStroke ();
    fill(colors.lightGrey, 40);
    rectMode(CORNER);
    rect(startX, startY, w, h, 0, 0, curveRadius, 0);

    startX += w/2;
    startY += h*2/3.0;
    boolean netIsPositive = int(events.netMoney) > 0;
    textSize(netTextSize);
    fill(netIsPositive? colors.green : colors.reddishPink);
    textAlign(CENTER, BOTTOM);
    text(nfp(events.netMoney, 0, 2).charAt(0) + nfc(events.netMoney, 2), startX, startY);

    startX = w*0.9;
    textAlign(RIGHT, BOTTOM);
    textSize(detailTextSize);
    fill(colors.mediumGrey);
    text(events.currency, startX, startY - textDescent());    
    startX = 0 + w/2;    
    fill(colors.darkGrey);
    textSize(detailTextSize);
    textAlign(CENTER, TOP);
    text("▲" + nfc(events.totalMoneyGained, 2) + " | ▼" + nfc(events.totalMoneyLost, 2), startX, startY);
  }
}
class TicketDetailsGUI {

  float tWidth, tHeight;
  float startX, startY;
  float origialStartX, originalStartY;

  float titleBarW, titleBarH;
  float titleBufferY;
  float cardsBufferX;
  float cardsBufferY;
  float cellW;
  float cellH;
  float columnProportion [];
  int rows;
  int columns;
  int cards;
  int totalMatches, totalBets;
  String columnLabels [];
  StringList IDs;
  StringDict usernames;
  StringDict matches;
  StringDict date, time;
  StringDict bets;
  StringDict odds;
  StringDict money;

  float cardW, cardH;
  float totalCardH, permissibleCardH;
  float eachBuffer;
  int alignmentsX [];
  PFont formatting [];
  color textFills [];

  char delimitingChar = ',';
  boolean verticalScrollingRequired, mouseOnScroll;

  float wheelFactor = 1.4;
  float scrollMinY, scrollMaxY;
  float scrollLength;
  float scrollThickness;
  float scrollX, scrollY;
  float scrollOpacity;
  float totalXright, totalYright;
  float shadowLength;

  TicketDetailsGUI () {
    tWidth = relativeDimension*0.4;
    tHeight = relativeDimension*0.2;

    titleBarW = tWidth;
    titleBarH = tHeight*0.05;
    shadowLength = titleBarH;
    titleBufferY = titleBarH*0.3;
    cardsBufferY = titleBarH*0.6; 
    cardsBufferX = titleBarH*0.6;

    permissibleCardH = tHeight - titleBufferY;

    cellH = titleBarH;

    columnProportion = new float [] {0.15, 0.15, 0.3, 0.15, 0.1, 0.15};
    columns = columnProportion.length;
    columnLabels = new String [] {"Ticket ID", "Username", "Match", "Bets", "Odds", "Money betted"};

    alignmentsX = new int [] {CENTER, CENTER, RIGHT, CENTER, CENTER, CENTER};
    formatting = new PFont [] {fonts.arimoBold, fonts.arimoRegular, fonts.arimoRegular, fonts.arimoBold, fonts.arimoRegular, fonts.arimoBold};
    textFills = new color [] {colors.theme, colors.darkGrey, colors.lightGrey, colors.darkGrey, colors.darkGrey, colors.theme};

    IDs = events.ticketIDs;
    usernames = events.usernames;
    cards = IDs.size();

    matches = new StringDict ();
    matches.set(IDs.get(0), "Arsenal - Chealsea, Man. United - Man. City");
    matches.set(IDs.get(1), "Blackburn Rovers - Watford");
    matches.set(IDs.get(2), "2Arsenal - Chealsea, Man. United - Man. City");
    matches.set(IDs.get(3), "2Blackburn Rovers - Watford");
    matches.set(IDs.get(4), "3Arsenal - Chealsea, Man. United - Man. City");
    matches.set(IDs.get(5), "3Blackburn Rovers - Watford");

    totalMatches = events.totalMatches;
    totalBets = events.totalBets;

    date = new StringDict ();
    date.set(IDs.get(0), "Tue, 26 Feb. Thu 28 Feb");
    date.set(IDs.get(1), "Fri, 1 Mar");
    date.set(IDs.get(2), "2Tue, 26 Feb. Thu 28 Feb");
    date.set(IDs.get(3), "2Fri, 1 Mar");
    date.set(IDs.get(4), "3Tue, 26 Feb. Thu 28 Feb");
    date.set(IDs.get(5), "3Fri, 1 Mar");

    time = new StringDict ();
    time.set(IDs.get(0), "20:45. 22:30");
    time.set(IDs.get(1), "12:00");
    time.set(IDs.get(2), "2 20:45. 22:30");
    time.set(IDs.get(3), "2 12:00");
    time.set(IDs.get(4), "3 20:45. 22:30");
    time.set(IDs.get(5), "3 12:00");

    bets = new StringDict ();
    bets.set(IDs.get(0), "Fulltime Result, Draw no bet, 1st half goals, 2nd half goals/Draw no bet, 1st half goals");
    bets.set(IDs.get(1), "Fulltime Result, Draw no bet");
    bets.set(IDs.get(2), "Fulltime Result, Draw no bet, 1st half goals, 2nd half goals/Draw no bet, 1st half goals");
    bets.set(IDs.get(3), "Fulltime Result, Draw no bet");
    bets.set(IDs.get(4), "Fulltime Result, Draw no bet, 1st half goals, 2nd half goals/Draw no bet, 1st half goals");
    bets.set(IDs.get(5), "Fulltime Result, Draw no bet");

    odds = new StringDict ();
    odds.set(IDs.get(0), "3.1, 23.5, 2.1, 1.4/2.3, 3.5");
    odds.set(IDs.get(1), "8.1, 23.75");
    odds.set(IDs.get(2), "3.1, 23.5, 2.1, 1.4/2.3, 3.5");
    odds.set(IDs.get(3), "8.1, 23.75");
    odds.set(IDs.get(4), "3.1, 23.5, 2.1, 1.4/2.3, 3.5");
    odds.set(IDs.get(5), "8.1, 23.75");

    money = events.ticketMoney;
    eachBuffer = titleBarH*0.5;

    startX = (width - tWidth)/2;
    startY = netMoneyGUI.h/2 + (height - tHeight)/2;

    scrollThickness = relativeDimension*0.0025;
    scrollX = startX + tWidth + cardsBufferX;
    scrollY = startY + titleBarH + titleBufferY;
    scrollOpacity = 200;

    startX = (width - tWidth)/2;
    startY = netMoneyGUI.h/2 + (height - tHeight)/2;
    origialStartX = startX;
    originalStartY = startY;

    scrollMinY = startY + titleBarH + titleBufferY;
    scrollMaxY = height - titleBarH;
    scrollLength = permissibleCardH*0.4;
  }
  void draw () {


    String content = totalBets + " bet" + (totalBets == 1? "" : "s");




    float x = startX, y = originalStartY, w, h = titleBarH;

    cardW = titleBarW;
    x = startX;
    y = startY + titleBarH + titleBufferY;
    w = cardW;

    float xx = startX, yy = y, ww, hh = 0;
    y = startY + titleBarH/2;
    yy = startY + titleBarH/2;
    totalCardH = 0;
    for (int a = 0; a < cards; a ++) {
      String ID = IDs.get(a);

      rows = 0;

      String genBets [] = split(bets.get(ID), "/");
      hh = cardH/genBets.length;
      for (int c = 0; c < genBets.length; c ++)
        rows += split(genBets [c], ",").length;
      cardH = titleBarH + cellH*rows;
      totalCardH += cardH;
      h = cardH;
      hh = cardH;

      rectMode(CORNER);
      noStroke();
      fill(colors.lightTheme);
      rect(x, y, w, h);

      strokeWeight(1);
      stroke(colors.theme);
      line(x, y, x, y + h);

      textMode(CENTER);
      xx = startX;

      for (int b = 0; b < columns; b ++) {
        ww = columnProportion [b]*cardW;
        if (b == 0)  content = ID;
        else if (b == 1)  content = usernames.get(ID); 
        else if (b == 5)  content = money.get(ID);
        else {
          content = "";
        }
        if (b != 2 && b != 3 && b != 4) {
          fill(textFills [b]);
          textFont(formatting [b]);
          textAlign(CENTER, CENTER);
          text(content, xx, yy, ww, hh);

          if (b == 5) {
            textFont(fonts.segoeUIsymbols);
            float xxx = xx + ww/2 - textWidth(content + " ")/2, 
              yyy = yy + hh/2;
            textAlign(RIGHT, CENTER);
            text(moneyEmoji + " ", xxx, yyy - textDescent()/2);
          }
        } else {
          if (b == 2) {
            String userMatches [] = split(matches.get(ID), delimitingChar);
            String eachDate [] = split(date.get(ID), ".");
            String eachTime [] = split(time.get(ID), ".");
            hh = cardH/userMatches.length;
            for (int c = 0; c < userMatches.length; c ++) {
              fill(colors.darkGrey);
              textFont(formatting [b]);
              textSize(fontSize.small);
              textAlign(CENTER, CENTER);
              text(userMatches [c].trim(), xx, yy + hh*c, ww, hh);

              fill(colors.lightGrey);
              textFont(formatting [b]);
              textSize(fontSize.tiny);
              textAlign(CENTER, TOP);
              text(eachTime [c].trim() + " | " + eachDate [c].trim(), xx, yy + hh*c + hh/2 + eachBuffer, ww, hh);
            }
          } else if (b == 3) {
            genBets = split(bets.get(ID), "/");
            hh = cardH/genBets.length;
            for (int c = 0; c < genBets.length; c ++) {
              String bet = genBets [c].replace(",", "\n").trim();

              fill(colors.darkGrey);
              textFont(fonts.arimoBold);
              textSize(fontSize.small);
              textAlign(RIGHT, CENTER);

              textSize(fontSize.small);
              text(bet, xx, yy + hh*c, ww, hh);
            }
          } else if (b == 4) {
            genBets = split(bets.get(ID), "/");
            String genOdds [] = split(odds.get(ID), "/");
            hh = cardH/genBets.length;
            for (int c = 0; c < genBets.length; c ++) {
              String odd = genOdds [c].replace(",", "\n").trim();

              fill(colors.darkGrey);
              textFont(fonts.arimoRegular);
              textSize(fontSize.small);
              textAlign(CENTER, CENTER);

              textSize(fontSize.small);
              text(odd, xx, yy + hh*c, ww, hh);
            }
          }
          hh = cardH;
        }

        xx += ww;
      }
      yy += cardsBufferY + cardH;
      y += cardH + cardsBufferY;
    }

    noStroke();
    fill(colors.white);
    rect(startX - 1, 0, titleBarW + 2, originalStartY);

    noStroke();
    fill(colors.darkGrey);
    rect(startX, originalStartY, titleBarW, titleBarH);

    x = startX;
    y = originalStartY; 
    h = titleBarH;

    textSize(fontSize.small);
    textFont(fonts.arimoBold);
    rectMode(CENTER);
    for (int a = 0; a < columns; a ++) {
      w = columnProportion [a]*titleBarW;
      textAlign(CENTER, CENTER);
      fill(colors.white);
      text(columnLabels [a], x + w/2, y + h/2 - textDescent()/2, w, h);
      x += w;
    }

    textFont(fonts.arimoRegular);

    totalXright = origialStartX + tWidth;
    totalYright = originalStartY - titleBufferY;

    fill(colors.darkGrey);
    textSize(fontSize.medium);
    textAlign(RIGHT, BOTTOM);
    content = totalBets + " bet" + (totalBets == 1? "" : "s");

    text(content, totalXright, totalYright);
    totalXright -= textWidth(content);
    fill(colors.theme);
    content = " | ";
    text(content, totalXright, totalYright);
    totalXright -= textWidth(content);

    fill(colors.darkGrey);
    content = totalMatches + " match" + (totalMatches == 1? "" : "es");
    text(content, totalXright, totalYright);
    totalXright -= textWidth(content);

    verticalScrollingRequired = totalCardH > permissibleCardH;

    rectMode(CORNER);

    if (verticalScrollingRequired) {
      stroke(colors.theme);
      strokeWeight(1);
      strokeCap(PROJECT);
      line(scrollX, scrollMinY, scrollX, scrollMaxY);

      if (tools.rectHovered(scrollX - scrollThickness/2, scrollY, scrollThickness, scrollLength, CORNER))
        stroke(colors.theme);
      else
        stroke(colors.theme, scrollOpacity);
      strokeWeight(scrollThickness);
      strokeCap(PROJECT);
      line(scrollX, scrollY, scrollX, scrollY + scrollLength);
      startY = map(scrollY, scrollMinY, scrollMaxY, scrollMinY, permissibleCardH - totalCardH - cards*cardsBufferY - titleBarH*2.5);
    }

    noStroke();
    fill(colors.white);
    rect(startX - 1, height - titleBarH, titleBarW + 2, titleBarH);

    for (int a = 0; a < shadowLength; a ++) {
      stroke(colors.background, map(a, 0, shadowLength, 120, 0));
      line(startX - 1, originalStartY + titleBarH + a, startX + tWidth + 2, originalStartY + titleBarH + a);

      stroke(colors.background, map(a, 0, shadowLength, 120, 0));
      line(startX - 1, height - titleBarH - a, startX + tWidth + 2, height - titleBarH - a);
    }
  }
  void mousePressed () {
    if (tools.rectHovered(scrollX - scrollThickness/2, scrollY, scrollThickness, scrollLength, CORNER))
      mouseOnScroll = true;
  }
  void mouseReleased () {
    mouseOnScroll = false;
  }
  void mouseWheel(MouseEvent event) {
    float wheelDirection = event.getCount();
    scrollY += wheelDirection*wheelFactor;
    scrollY = constrain(scrollY, scrollMinY, scrollMaxY - scrollLength);
  }
  void mouseDragged () {
    scrollY = map(constrain(mouseY, scrollMinY, scrollMaxY), scrollMinY, scrollMaxY, scrollMinY, scrollMaxY);
    scrollY = constrain(scrollY, scrollMinY, scrollMaxY - scrollLength);
  }
}
