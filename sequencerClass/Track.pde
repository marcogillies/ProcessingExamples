
/*
 * a track is a row of buttons associated
 * with a single sample
 */
class Track
{
  // a track contains multiple buttons so we use
  // an array
  Button [] buttons;
  
  // this is the position on screen of the track
  // (all tracks are at the same horizontal 
  // position so we don't need an xPos)
  int yPos;
  
  // this is the audio sample of the track
  SoundFile sample;

  // the constuctor takes in 
  // the y position of the track
  // the length (number of buttons)
  // and the file name of the audio sample
  Track(PApplet applet, int pos, int len, String sampleFile)
  {
    // set the ypos
    yPos = pos;
    
    // generate len number of buttons
    buttons = new Button[len];
    for (int i = 0; i < buttons.length; i++)
      buttons[i] = new Button(10 + 50*i, yPos, 40);
    // load the audio sample
    sample = new SoundFile(applet, sampleFile);
  }
  
  // checks whether the sample should play
  // it takes the current position of the metronome
  // as a parameter, checks whether the corresponding
  // button is on and if so triggers the sample
  void play(int pos)
  {
      if(buttons[pos].on)
        sample.play();
  }

  // the draw call just loops through all buttons
  // drawing each one
  void draw()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].draw();
    }
  }

  // mousePressed events are passed to each button
  void mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].mousePressed();
    }
  }
}