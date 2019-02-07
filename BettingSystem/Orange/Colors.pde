class Colors {
  color theme;
  color pagesBorderUnselected, pagesBorderSelected;
  color background;
  color pagesHovering;
  color pagesClicked;
  color bodyBarUnselected, bodyBarSelected;
  color bodyTitle;
  color matchesContent;
  color matchesTimeContent;
  color white;
  color lightGrey;
  color mediumGrey;
  color darkGrey;
  color green = #099B33;
  color reddishPink = #FF0554;
  color lightTheme;

  Colors () {
    theme = color(255, 153, 0);
    pagesBorderUnselected = #AAAAAA;
    pagesBorderSelected = theme;
    background = 255;
    pagesHovering = color (0, 15);
    pagesClicked = color (0, 40);
    bodyBarUnselected = color(theme, 120);
    bodyBarSelected = theme;
    bodyTitle = theme;
    matchesContent = #AAAAAA;
    matchesTimeContent = #5A5959;
    white = #FFFFFF;
    lightGrey = #AAAAAA;
    mediumGrey = #8E8C8D;
    darkGrey = #5A5959;
    lightTheme = color(theme, 40);
  }
}
