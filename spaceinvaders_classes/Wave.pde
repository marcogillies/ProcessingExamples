class Wave {
  float speedX=2;
  float speedY=5;

  Invader [] invaders;

  Wave(int numInvaders) {

    invaders = new Invader[numInvaders];
    for (int i = 0; i < invaders.length; i++)
    {
      invaders[i] = new Invader(100+i*50, 50);
    }
  }

  void draw() {
    for (Invader invader : invaders)
    {
      invader.x += speedX;
      invader.draw();
    }

    if (invaders[0].x < 20 || invaders[invaders.length-1].x > width-20) {
      speedX = -speedX;
      for (Invader invader : invaders)
      {
        invader.y += speedY;
      }
    }
  }

  void hit(Bullet bullet)
  {
    for (Invader invader : invaders)
    {
        if(invader.hit(bullet)){
          return;
        }
    }
    
  }
}