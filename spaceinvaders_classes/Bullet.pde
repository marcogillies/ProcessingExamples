class Bullet {
  int x, y;
  int speed = 5;

  Bullet(int _x, int _y) {
    x = _x;
    y = _y;
  }

  void draw() {
    y -= speed;
    ellipse(x, y, 5, 5);
    wave.hit(this);
  }  
  
  boolean isOnScreen(){
    return y > 0;
  }
}