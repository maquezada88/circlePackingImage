ArrayList<Circle> circles;
ArrayList<String> pics = new ArrayList<String>();
PImage img;

void setup() {
  size(800, 800);
  
  img = loadImage("kitten.jpg");
  pics.add("mona.jpg");
  pics.add("JBGivingTalk.jpg");
  pics.add("ralph-grove.jpeg");
  pics.add("dukeDog.jpeg");
  img.loadPixels();
  circles = new ArrayList<Circle>();
}

void draw() {
  background(0);
  frameRate = 55;
  int amount = 35;
  int counter = 0;
  int attempts = 0;

  while (counter <  amount) {
    Circle newC = newCircle();
    if (newC != null) {
      circles.add(newC);
      counter++;
    }
    attempts++;
    if (attempts > 500) {
      noLoop();
      break;
    }
  }


  for (Circle c : circles) {
    if (c.growing) {
      if (c.touchingEdges()) {
        c.growing = false;
      } else {
        for (Circle other : circles) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            if (d - 2 < c.r + other.r) {
              other.growing=false;
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.display();
    c.expand();
  }
}

Circle newCircle() {

  float x = random(width);
  float y = random(height);

  boolean valid = true;
  for (Circle circle : circles) {
    float d = dist(x, y, circle.x, circle.y);
    if (d < circle.r) {
      valid = false;
      break;
    }
  }

  if (valid) {
    int index = int(x) + int(y) * img.width;
    color col = img.pixels[index];
    return new Circle(x, y, col);
  } else {
    return null;
  }
}

int count = 0;
  void keyReleased() {
      if(key=='n'){
        img = loadImage(pics.get(count%pics.size()));
        count++;
        img.loadPixels();
        circles.clear();
        surface.setResizable(true);
        surface.setSize(img.width, img.height);
     }
    }
    
    void keyPressed(){
    }
