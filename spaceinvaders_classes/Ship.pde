class Ship
{
   int x, y;
   int speed = 10;
   
   Ship(int _x, int _y){
     x = _x;
     y = _y;
   }
   
   void draw(){
     triangle(x, y-30, x-20, y, x+20, y);
   }
   
   void moveLeft(){
    x -= speed;
    if (x < 20)
      x = 20;
   }
   
   void moveRight(){
     x += speed;
     if (x > width-20)
        x = width-20;
   }
   
   void fire(){
     bullets = (Bullet [])append(bullets, new Bullet(x, y));
   }
}