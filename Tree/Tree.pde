
float theta = radians(30);

void setup()
{
  size(640, 480);
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(4);
  translate(width/2, height);
  theta = radians (map (mouseX, 0, width, -90, 90));
  float len = map (mouseY, 0, height, height/3, 0);
  branch(len);
}

// Each branch now receives
// its length as an argument.
void branch(float len) {

  line(0, 0, 0, -len);
  translate(0, -len);

  // Each branch’s length
  // shrinks by two-thirds.
  len *= 0.66 ;

  if (len > 2) {
    pushMatrix();
    rotate(theta);
    // Subsequent calls to branch()
    // include the length argument.
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}

void keyPressed()
{
  save("tree.png");
}
