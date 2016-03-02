class Invader
{
   float x;
   float y; 
   
   boolean alive = true;
   
   Invader (float _x, float _y){
     x = _x;
     y = _y;
   }
   
   void draw(){
     if(alive){
       rect(x, y, 20, 20);
     }
   }
   
   boolean hit(Bullet bullet){
     if (bullet.x > x-10 && bullet.x < x+20
        && bullet.y > y-10 && bullet.y < y+20)
      {
        die();
        return true;
      }
      return false;
   }
   
   void die(){
     alive = false;
   }
}