import processing.sound.*; //sound library


//main code variables
int Screen;
dog dog; // class
food food;
int startTime = -1; //default start time variable for timers
//music code
SoundFile file;
String audioName = "noisestorm.mp3";
String path;



void setup()
{
  size(1800, 1000);
  //initialize classes
  food = new food();
  //play music code
  path = sketchPath(audioName);
  file = new SoundFile(this, "noisestorm.mp3");
  file.play();
}

void draw()
{
  //Screen changing
  background(255);
  if (Screen == 2)
  {
    dogscreen();
  }
  if (Screen == 3)
  {
    endscreen();
  }
}

void dogscreen()
{
  text("F to Feed", 1200, 500);
  text("P to Pet", 1200, 700);
  text("Careful! You might run out of food!", 1200, 900);
  dog.PickingName = true; //pick your dog's name
  if (millis() - startTime > 4000) //wait 4 secs for name select and then start the game 
  {
    dog.PickingName = false;
    dog.render();
    dog.variables();
    food.render();
    food.Move();
  }
  if (food.COUNT < 0) //die when out of food
  {
    Screen = 3;
  }
}

void endscreen()
{
  text("Final Score", width/2-200, height/2 - 100);
  text(dog.finalScore, width/2-200, height/2); //display score
}

void keyPressed() //Used mainly to change variables
{
  if (key == '1')
  {
    Screen = 1;
  }
  if (key == '2')
  {
    Screen = 2;
    startTime = millis();
    dog = new dog();
  }

  if (Screen == 2)
  {
    if (dog.PickingName == true)
    {
      dog.name += key;
      if (keyPressed)
      {
        dog.charactersName += 1;
      }
    }
  }
  {
    if (key == 'f')
    {
      food.COUNT -= dog.age * 2;
    }
  }
}
