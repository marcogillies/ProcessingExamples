
// This will store the images we load from file
PImage [] images;
// the image we are currently displaying
int currentImage = 0;

// this is the time at which the 
// current slideshow frame started
// we use this to know when 
// to move to the next image
int frameStartTime = 0;

void setup()
{
  size(170, 100);
  // this loads the folder "images" from 
  // inside your data folder (that is what
  // "dataPath" does).
  File file = new File(dataPath("images"));
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
    images[i] = loadImage("images/"+files[i]);
  }
  
  frameStartTime = millis();
}

void draw()
{
  background(255);
  // don't need a loop in here because we
  // are only showing one image
  
  // draw the current image
  image(images[currentImage], 10, 10);
  
  // check if we have been on the current frame 
  // for over half a second (500 milliseconds). 
  // we work this out by taking the difference betwee
  // the current time in milliseconds and 
  // the start of the current frame 
  if(millis() - frameStartTime > 500)
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
