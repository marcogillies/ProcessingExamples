Wave wave;
Ship ship;
Bullet [] bullets = {};

void setup()
{
  size(400, 700); 
  ship = new Ship(width/2, height - 50);
  wave = new Wave(5);
  
  //bullets = new Bullet[0];
  
  fill(255);
  rectMode(CENTER);
  stroke(255);
}

void draw()
{
  background(0);

  ship.draw();

  wave.draw();
  
  if(bullets.length > 0){
    for (Bullet bullet : bullets){
      bullet.draw();
    }
    if(!bullets[0].isOnScreen()){
      bullets = (Bullet [])subset(bullets, 1, bullets.length-1);
    }
    println(bullets.length);
  }
}


void keyPressed()
{
  if (key==CODED)
  {
    if (keyCode==LEFT)
    {
      ship.moveLeft();
    }

    if (keyCode==RIGHT)
    {
      ship.moveRight();
    }
  }
  if (key == ' ')
  {
    ship.fire();
  }
}