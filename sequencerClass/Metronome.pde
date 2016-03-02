
/*
 *   This class represents the current position of the playhead
 *   i.e. which position on the track is currently being played.
 *   It moves the playhead forward at a certain number of 
 *   beats per second
 */
class Metronome
{
  // the current position of the playhead
  int pos;
  // how many beats are played per second
  float beatsPerSecond;
  // I use this internally to keep track of how much time 
  // has passed since we last moved the playhead
  float startTime = 0;
  
  // the number of steps (columns) in the sequence
  int len;
  
  // the size of the bar to be drawn
  int height;
  int width;
  
  // the distance (in pixels) that the playhead
  // should move each beat
  int stepSize;

  // the constructor takes in 
  // the number of beats per second
  // the width and height of a bar
  // and the length (number of buttons/beats)
  Metronome(float bps, int w, int h, int l)
  {
    // the position always starts at 0
    pos = 0;
    startTime = 0;
    // set all of the variables based on the parameters
    beatsPerSecond = bps; 
    height = h; 
    width = w; 
    stepSize = w;
    len = l;
  }

  // updates the positions
  // checks if the beat time has elapsed and if so moves foward
  // returns true if we have moved forwrd and  false if we haven't
  boolean update()
  {
    // check if the time since the last beat is more 
    // than the beat length. 
    // millis() gives the current time in milliseconds startTime is 
    // the start time of the current beat we subtract startTime from 
    // millis to get the time since the last beat
    // The length of a beat is 1 second divided by the beatsPerSecond. 
    // Since we are working in milliseconds one second is 1000 ms
    if(millis() - startTime > 1000.0/beatsPerSecond)
    {
      // set the start time of the current beat 
      // tp the currnet time
      startTime = millis();
      // move the playhead on
      pos += 1;
      // loop back to the beginning if it  has moved off the end 
      if(pos >= len)
        pos = 0;
      // return true as we have moved on
      return true;
    }
    // return false because we haven't moved on
    return false;
  }

  // draws the metronome as a vertical bar 
  // based on the current position and the step 
  // size
  void draw()
  {
    fill(0, 0, 200, 120);
    rect(int(pos)*stepSize + 5, 10, width, height);
  }
}