import processing.sound.*;

/* 
 *  A class representing a simple step sequencer
 */



// the sequencer is represented as an array of 
// tracks and a playhead 
Track [] tracks;
Metronome playhead;

void setup()
{
  size(420, 215); 

  
  // create the tracks
  tracks = new Track[4];
  tracks[0] = new Track(this, 15, 8, "777__vitriolix__808-kick.wav");
  tracks[1] = new Track(this, 65, 8, "3718__noisecollector__909-clap.wav");
  tracks[2] = new Track(this, 115, 8, "26903__vexst__snare-4.wav");
  tracks[3] = new Track(this, 165, 8, "45102__matias-reccius__crashb.wav");
  
  // create the playhead passing in the length of the tracks
  // array as the total number of beats
  playhead = new Metronome(1, 50, tracks.length*50, 8);
}

// the draw method just calls functionality in the classes
void draw()
{
  background(255);
  noStroke();
  
  // draw all the buttons
  for (int i = 0; i < tracks.length; i++)
  {
    tracks[i].draw();
  }
  
  // check if the playhead has moved on
  // if so play all of the tracks at the 
  // new position
  if(playhead.update())
  {
    for (int i = 0; i < tracks.length; i++)
    {
      tracks[i].play((int)playhead.pos);
    }
  }
  
  // draw the playhead
  playhead.draw();
}

// the mousePressed method just passes 
// the mouse event on to the tracks. 
void mousePressed()
{
  for (int i = 0; i < tracks.length; i++)
  {
    tracks[i].mousePressed();
  }
}