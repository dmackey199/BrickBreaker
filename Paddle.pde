class Paddle
{
  float x;
  final float y = 750;
  float w = 150;
  final float h = 20;

  
  Paddle()
  {
    x = 325;
  }
  Paddle(float w)
  {
     this.w = w;
  }
  void Draw()
  {
    fill(0);
    rect(x,y,w, h);
  }
  void Update()
  {
    if(custom)
    {
        x = mouseX;
    }
  }
  void Move(String str)
  {
      if(str == "left")
      {
         x -=15;
      }
      else if(str == "right")
      {
        x += 15;
      }
      if(x <= 0)
      {  
          x=0;
      }
      if(x+w >= width)
      {
          x = width -w;
      }
  }
}
