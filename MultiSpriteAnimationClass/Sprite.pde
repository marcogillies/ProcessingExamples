class Sprite
{
  // the current position of the sprite
  int x;
  int y;
  
  // we now have an array of animations
  // so we can play different animations
  // at different times
  Animation [] animations;
  // the currently playing animation
  int currentAnimation = 0;
  
  // this controls whether the 
  // sprite should be animating or not
  boolean animating = false;
  
  // This constructor takes an array of folder 
  // names, each folder contains an animation
  Sprite(String [] folderNames, int _x, int _y)
  {
    x = _x;
    y = _y;
    
    // create an array of animation, one for each folder 
    animations = new Animation[folderNames.length];
    for (int i = 0; i < folderNames.length; i++)
    {
      // create an animation for that folder
      animations[i] = new Animation(folderNames[i]);
    }
  }
  
  void draw()
  {
    // we only update if the character is
    // currently animation (updating
    // changes the frame)
    if(animating)
      animations[currentAnimation].update();
    // we always draw the current frame
    animations[currentAnimation].draw(x, y);
  }
  
  // a member function to move forward
  void forward()
  {
    // set the current animation to 
    // the forward animation
    currentAnimation = 0;
    // make the animation play
    animating = true;
    // move the character forward
    x += 1;
  }
  
  // a member function to move backward
  void back()
  {
    // set the current animation to 
    // the backward animation
    currentAnimation = 1;
    // make the animation play
    animating = true;
    // move the character backward
    x -= 1;
  }
  
  // stop the animation
  void stop()
  {
    animating = false;
  }
}
