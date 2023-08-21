class Circle {
  float x;
  float y;
  float r;
  color c;

  boolean growing = true;

  Circle(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    r = 1;
  }

  void expand(){
    if (growing) {
      r = r + 0.3;
    }
  }

  boolean touchingEdges() {
    return (x + r > width || x -  r < 0 || y + r > height || y -r < 0);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}