class food
{
  int COUNT = 2000; //count for array
  PImage food[] = new PImage [COUNT]; //image array to spawn many images
  //food variables
  float y[] = new float[COUNT];  
  float x[] = new float[COUNT];
  //movement and size
  float speedX[] = new float[COUNT];
  float speedY[] = new float[COUNT];
  float FoodSizeDia[] = new float[COUNT];
  //color variables
  float colorR[] = new float[255];
  float colorG[] = new float[255];
  float colorB[] = new float[255];
  
  food() //default constructor for food
  {
    for (int i=0; i<COUNT; i++)
    {
      y[i] = random (800,1000);
      x[i] = random (0, 1800);
      FoodSizeDia[i] = random (20,50);
      speedX[i] = random(100/FoodSizeDia[i], 200/FoodSizeDia[i]);
      food[i] = loadImage("food.png");
    }
        for (int i=0; i<255; i++)
    {
      colorR[i] = random(0, 255);
      colorG[i] = random(0, 255);
      colorB[i] = random(0, 255);
    }
  }
  
  void render()
    {
    for (int i=0; i<255; i++) //change color (worked before image)
    {
      fill(colorR[i], colorG[i], colorB[i]);
    }
    for (int i=0; i<COUNT; i++)
    {
      food[i].resize(30, 30);
      image(food[i], x[i], y[i]);
    }
  }
  
  //mvement code, including boundaries for them to bounce back
   void Move()
  {
    for (int i=0; i<COUNT; i++)
    {
      x[i] = x[i] + speedX[i];
      y[i] = y[i] + speedY[i];
      //bounce back
      if (x[i]>2000||x[i]<0)
      {
        speedX[i] = speedX[i]*-1;
      }
      if (y[i]>1000||y[i]<0)
      {
        speedY[i] = speedY[i]*-1;
      }
    }
  }
}
