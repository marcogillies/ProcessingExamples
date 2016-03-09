
// a Sprite variable
Sprite hero;

void setup()
{
  size(170, 100);
  // create an array containing all of 
  // the folder names, one for each animation
  String [] folders = {"forward", "backward"};
  // create the sprite object
  hero = new Sprite(folders, 10, 10);
}

void draw()
{
  background(255);
 
  // draw the sprite
  hero.draw();
  
  // move the sprite around based 
  // on the input keys
  // These call member functions
  // of the sprite class
  if(keyPressed)
  {
    if(key == CODED)
    {
      if(keyCode == LEFT)
        hero.back();
      if(keyCode == RIGHT)
        hero.forward();
    }
  }
  
}

// stop the animation when the player
// releases the key
void keyReleased()
{
  hero.stop();
}
