class GameState
{
      boolean pause = false;
      boolean gameOver = false;
      
      void CheckGameConditions(boolean p, boolean go)
      {
          if(bricksBroken == totalBricks)
          {    
               gameOver = true;
               textSize(32);
               fill(0);
               text("You WIN!", 300, 70);
               text("Press 'c' to continue!", 300, 100);
               noLoop(); 
          }
          if(!p && !go)
          {
               textSize(32);
               fill(0);
               text("Score: " + score, 300, 40);
          }
          if(p)
          {
            if(!go)
            {
               textSize(32);
               fill(0);
               text("PAUSED", 300, 80);
            }
            else if(go)
            {
                textSize(32);
                fill(0);
                text("YOU LOSE", 300, 40);
                text("Final Score: " + score, 300, 70);
                text("Press 'c' to continue!", 300, 100);
                noLoop(); 
            }
          }   
      }
}
