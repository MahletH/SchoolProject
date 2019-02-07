class Tools {
  boolean circleHovered (float x, float y, float rad, int mode) {
    return mode == CORNER && dist(mouseX, mouseY, x + rad/2, y + rad/2) <= rad/2 ||
      mode == CENTER && dist(mouseX, mouseY, x, y) <= rad/2 ? true : false;
  }
  boolean rectHovered(float x, float y, float w, float h, float orientation) {
    return (((orientation == CORNER && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) ||
      (orientation == CENTER && mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2))? true : false);
  }
}
