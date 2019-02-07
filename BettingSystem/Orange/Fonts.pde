class Fonts {
  PFont arimoRegular, arimoItalic, arimoBold, arimoBoldItalic, 
    segoeUIsymbols;
  Fonts () {
    arimoRegular = createFont("/Arimo-Regular.ttf", fontSize.small);
    arimoItalic = createFont("/Arimo-Italic.ttf", fontSize.small);
    arimoBold = createFont("/Arimo-Bold.ttf", fontSize.small);
    arimoBoldItalic = createFont("/Arimo-BoldItalic.ttf", fontSize.small);

    segoeUIsymbols = createFont("/Segoe-UI-Symbol.ttf", fontSize.small);
  }
}
