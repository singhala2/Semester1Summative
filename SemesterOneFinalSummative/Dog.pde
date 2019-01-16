class dog
{
  //dogs variables
  float x;
  float y;
  float xspeed;
  float yspeed;
  float health;
  float love;
  float finalScore;
  String name = ""; //blank allows you to choose name
  int age;
  float food;
  int StartTimeAge = 0; //start time for timers
  boolean PickingName = false;
  int charactersName;
  PImage dog;

  dog() //default constructor
  {
    x = width/2;
    y = height/2;
    age = 0;
    StartTimeAge = millis();
    dog = loadImage("dog.jpg"); //load dog image
  }

  void render() //make the dog appear
  {
    text(name, width/2 - (charactersName * 10) , height/2 + 200);
    fill(0, 0, 255);
    image(dog, width/2-100, height/2-100);
    fill(0, 255, 0);
    rect(200, 100, health, 40);
    rect(200, 200, love, 40);
    fill(0);
    textSize(20);
    text(health, 460, 120); 
    text(love, 460, 220);
    text("Health", 60, 120); 
    text("Love", 60, 220);
    textSize(40);
    text(age, 1400, 100);
    text("years old", 1450, 100);
  }

  void variables() //changes in health, love and age
  {
    //StartTimeAge = millis();
    if(millis() - StartTimeAge > age*4000)
    {
      age += 1;
    }
    love -= 1;
    health -= 1;
    if (keyPressed)
    {
      if (key == 'p')
      {
        if (love < 1000)
        {
          love += random(3, 6);
        }
      }
      if (key == 'f')
      {
        if (health < 1000)
        {
          health += random(3, 6);
        }
      }
    }
    finalScore = (age*love*health);
  }
}
