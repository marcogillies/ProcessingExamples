// this class represents a single animation that can
// be played on a sprite (e.g. forward and backward)
class Animation
{
  // This will store the images we load from file
  PImage [] images;
  // the image we are currently displaying
  int currentImage = 0;
  
  // this is the time at which the 
  // current slideshow frame started
  // we use this to know when 
  // to move to the next image
  int frameStartTime = 0;
  
  // the constructor just takes a folder as 
  // a parameter, the other parameters
  // are automatically set. 
  Animation(String folderName)
  {
    // this loads the folder named folderName
    // from inside your data folder (that is what
    // "dataPath" does).
    File file = new File(dataPath(folderName));
    // an array of file names within that folder
    String [] files = file.list();
    // create an array the same size as the 
    // array of files
    images = new PImage[files.length];
    // iterate through the array of files
    for (int i = 0; i < files.length; i++)
    {
      // load the image file into the images array
      // note I'm adding the folder name to the
      // file name so Processing knows where to 
      // find the file
      images[i] = loadImage(folderName+"/"+files[i]);
    }
  }
  
  // this animates the sprite, 
  // changing the images every 10th of
  // a second
  void update()
  {
    // check if we have been on the current frame 
    // for over half a second (500 milliseconds). 
    // we work this out by taking the difference betwee
    // the current time in milliseconds and 
    // the start of the current frame 
    if(millis() - frameStartTime > 100)
    {
      // reset the current frame start time to 
      // the current time
      frameStartTime = millis();
      // move to the next image
      currentImage ++;
      
      // check if we have reached the end
      // of the array, and if so go back 
      // to the beginning
      if(currentImage >= images.length)
      {
         currentImage = 0;
      }
    }
  }
  
  // this draws the sprite sheet
  // it takes in an x and a y which are members
  // of the sprite class, not this class
  void draw(int x, int y)
  {
    // draw the current image
    image(images[currentImage], x, y);
  }
}
