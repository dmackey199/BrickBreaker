class Ball
{
    float diameter;
    float x;
    float y;
    final float initialVX = 3;
    final float initialVY = -4;
    float vx;
    float vy;
   
    
    Ball()
    {
      diameter = 20;
      x = width/2;
      y= 720;
      vx = initialVX;
      vy = initialVY;
    }
    Ball(float diameter, float x, float y, float vx, float vy)
    {
      this.diameter = diameter;
      this.x = x;
      this.y = y;
      this.vx = vx;
      this.vy = vy;
    }
    void Draw()
    {
      fill(255);
      circle(x,y, diameter);
    }
    void Update()
    {
      x+= vx;
      y+= vy;
      if(x <= diameter/2 || x >= width - diameter/2)    //the ball hits the left or right bound, so negate the velocity so it switches directions
      {
        vx = -vx;
      }
      if(y <= diameter/2)    //the ball hits the top or bottom bound, so negate the velocity so it switches directions
      {
        vy = -vy;
      }
      if(y >= height - diameter/2)      //ball goes below bottom bound, resulting in a loss
      {
           gs.gameOver = true;
           gs.pause = true;
           gs.CheckGameConditions(gs.pause, gs.gameOver);
      }
    }
    void CheckBallPaddleCollision(Paddle paddle)
    {
      if(y >= paddle.y)
      {
        if(x - diameter/2 < paddle.x && x + diameter/2 >= paddle.x)
        {
          vx = -initialVX;
        }
        else if(x + diameter/2 > paddle.x + paddle.w && x - diameter/2 <= paddle.x + paddle.w)
        {
            vx = initialVX;
        }
      }
      
      else if(Math.pow(paddle.x-x, 2) + Math.pow(paddle.y - y, 2) <= Math.pow(diameter/2, 2)) //hits left corner of paddle
      {
          if(y < paddle.y)
          {
            vx = -initialVX;
            vy = initialVY;  
          }
          else //if(y >= paddle.y)
          { 
            vx = -initialVX;
            vy = -initialVY;  
          }
      }
      else if(Math.pow(paddle.x + paddle.w -x, 2) + Math.pow(paddle.y - y, 2) <= Math.pow(diameter/2, 2)) //hits right corner of paddle
      {
          if(y < paddle.y)
          {
            vx = initialVX;
            vy = initialVY;  
          }
          else //if(y > paddle.y)
          { 
            vx = initialVX;
            vy = -initialVY;  
          }
      }
      else if(x >= paddle.x && x < (paddle.x + paddle.w/3)) //if the ball's x is in the first third of the paddle
      {
          if(y + diameter/2 >= paddle.y && y + diameter/2 < paddle.y + paddle.h) //ball's x is in the first third of the paddle, but do their y's indicate they're touching
          {
            vx= -initialVX;
            vy = initialVY;    //only way ball collides with paddle is with a downward velocity, so it should be negated regardless
          }
      }
      else if(x >= (paddle.x + paddle.w/3) && x < (paddle.x + paddle.w * 2/ 3)) //if ball is in paddle's middle third
      {
          if(y + diameter/2 >= paddle.y && y + diameter/2 < paddle.y + paddle.h)
          {
              vx=0;    //change to 0 so it does not go left or right
              vy= initialVY;  //negate so it goes upward
          }
      }
      else if(x >= (paddle.x + paddle.w * 2/3) && x <= (paddle.x + paddle.w)) //if ball is in paddle's last third
      {
          if(y + diameter/2 >= paddle.y && y + diameter/2 < paddle.y + paddle.h)
          {
              vx= initialVX;
              vy = initialVY;
          }
      }
      
    }
}
