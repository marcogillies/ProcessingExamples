
/*
 *  This is the class that represents sequencer buttons
 */
class Button
{
  // these are the elements that control the 
  // display of the button: position and size
  int xPos; 
  int yPos; 
  int width;
  
  // this is the state of a button which 
  // can either be on or off so it is
  // a boolean
  boolean on;
  
  // the construct simply takes in the display parameters 
  // and uses them to set the member variables
  // the button state is initially set to off
  Button(int x, int y, int w)
  {
    xPos = x;
    yPos = y;
    width = w;
    
    on = false;
  }
  
  // the burron is drawn as a rectangle 
  // with dimensions given by the display variables.
  // A different fill colour is used depending on the 
  // button state. 
  void draw()
  {
    if(on)
    {
      fill(255, 0, 0);
    }
    else
    {
      fill(200, 200, 200);
    }
    rect(xPos, yPos, width, width);
  }

  // check whether hte mouse is pressed inside the 
  // button and then toggle the on/off state
  void mousePressed()
  {
    if(mouseX > xPos && mouseX < xPos + width
      && mouseY > yPos && mouseY < yPos + width)
    {
      on = !on;
    }
  }
}