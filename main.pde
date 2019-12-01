

import controlP5.*;

Ball ball;
Paddle paddle;
Box[][] bricks;
GameState gs;
int score = 0;
final int totalBricks = 60;
int bricksBroken = 0;
int columns = 10;
int rows = 6;
boolean custom = false;

ControlP5 cp5;


void setup()
{
  stroke(0);
  size(800,800);
  smooth();
  background(220,220,220);
  ball = new Ball();
  paddle = new Paddle();
  gs = new GameState();
  bricks = new Box[rows][columns];
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < columns; j++)
    {
        bricks[i][j] = new Box(250 + 30*j, 400 - 30*i);
        bricks[i][j].value = i+1;
        switch(i)
        {  
            case 0:
              bricks[i][j].col = color(255,0,0);
              break;
            case 1:
              bricks[i][j].col = color(0,255,0);
              break;
            case 2:
              bricks[i][j].col = color(0,0,255);
              break;
            case 3:
              bricks[i][j].col = color(255,0,255);
              break;
            case 4:
              bricks[i][j].col = color(255,255,0);
              break;
            case 5:
              bricks[i][j].col = color(0,255,255);
              break;
        }
        bricks[i][j].Draw();
        bricks[i][j].Update();
    }
  }
  
  cp5 = new ControlP5(this);
  cp5.addButton("Reset")
      .setPosition(10,20)
      .setCaptionLabel("Reset")
      .setSize(80,30)
      .setColorBackground(color(50,205,50));
  
}

void draw()
{
    background(220,220,220);
    ball.Draw();
    ball.Update();

    paddle.Draw();
    for(int i = 0; i < rows; i++)
    {
      for(int j = 0; j < columns; j++)
      {
        if(bricks[i][j] != null)
        {
          if(bricks[i][j].broken)
          {
              score += bricks[i][j].value; 
              bricksBroken++;
              bricks[i][j] = null;
          }
          else 
          {
            bricks[i][j] = new Box(250 + 30*j, 400 - 30*i);
            bricks[i][j].value = i+1;
            switch(i)
            {  
                case 0:
                  bricks[i][j].col = color(255,0,0);
                  break;
                case 1:
                  bricks[i][j].col = color(0,255,0);
                  break;
                case 2:
                  bricks[i][j].col = color(0,0,255);
                  break;
                case 3:
                  bricks[i][j].col = color(255,0,255);
                  break;
                case 4:
                  bricks[i][j].col = color(255,255,0);
                  break;
                case 5:
                  bricks[i][j].col = color(0,255,255);
                  break;
            }
            bricks[i][j].Draw();
            bricks[i][j].Update();
          } 
        }
      }
    }
    ball.CheckBallPaddleCollision(paddle);
    gs.CheckGameConditions(gs.pause, gs.gameOver);
}
void Reset()
{
   score = 0; 
   bricksBroken = 0;
   setup();
}

void keyPressed()
{
  if(!custom)
  {
      if(key == 97)
      {
        paddle.Move("left");
      }
      else if(key == 100)
      {
        paddle.Move("right");
      }
      else if(key == 99)
      {
          loop();
          Reset();
      }
  }
  if(key == 112)
  {
      gs.pause = !gs.pause;
      gs.CheckGameConditions(gs.pause, gs.gameOver);
      if(gs.pause)
      {
        noLoop();
      }
      else
      {
          loop();
      }
          
   }
}
