class Box
{
  float x,y;
  int value;               //the score gained from destroying the box
  boolean broken = false;
  color col;
  int l = 25;
  
  Box(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void Update()
  {
      float dx, dy;
      dx = ball.x - max(x, min(ball.x, x + l));
      dy = ball.y - max(y, min(ball.y, y + l));
      if(((dx * dx) + (dy * dy)) < (ball.diameter/2 * ball.diameter/2))  //collision occured
      {
          broken = true;
          if((ball.x > x && ball.x < x+l) && ball.y < y)      //from above
          {
              ball.vy = ball.initialVY;
          }
          else if ((ball.x > x && ball.x < x+l) && ball.y > y)    //from below
          {
              ball.vy = -ball.initialVY;
          }
          else if((ball.y > y && ball.y < y+l)&&ball.x < x)    //collision from left
          {
              ball.vx = -ball.initialVX;
          }
          else if((ball.y > y && ball.y < y+l)&& ball.x > x)    //from right
          {
              ball.vx = ball.initialVX;
          }
          else if(ball.x < x && ball.y < y)
           //hit top left corner
          {
              ball.vy = ball.initialVY;
              ball.vx = -ball.initialVX;
          }
          //hit top right
          else if(ball.x > x && ball.y < y)
          {
              ball.vy = ball.initialVY;
              ball.vx = ball.initialVX;
          }
           //hit bot left corner
          else if(ball.x < x && ball.y > y)
          {
              ball.vy = -ball.initialVY;
              ball.vx = -ball.initialVX;
              
          }
          //hit bot right
          else if(ball.x > x && ball.y > y)
          {
              ball.vy = -ball.initialVY;
              ball.vx = ball.initialVX;
          }
      }
  }
  
  void Draw()
  {
    fill(col);
    rect(x,y,l, l);
  }
}
