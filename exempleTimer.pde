import java.util.Timer;
import java.util.TimerTask;

float msInterval = 3000.0; //Time between Timer Call in Milliseconds
float ellipseRadiusOriginal = 100.0; //Original Ellipse Size, not needed for timer operation
float ellipseRadius = ellipseRadiusOriginal; //Real Ellipse Size, not needed for timer operation
float ellipseRadiusMinimum = 50.0; //Minimum size the Ellipse can take, not needed for timer operation
float rectWidth; //Size of the loading bar, not needed for timer operation

void setup()
{
  size(400, 400);
  initTimer(); //Call to the initialisation of the general timer
}

void draw()
{
  background(0);
  fill(255);
  stroke(255);
  ellipseRadius = ellipseRadiusOriginal - (((millis() % msInterval) / msInterval) * ellipseRadiusOriginal) + ellipseRadiusMinimum;
  ellipse(width/2, height/2, ellipseRadius, ellipseRadius);
  rectWidth = width - (((millis() % msInterval) / msInterval) * width);
  rect(0, 0, rectWidth, 10);
}

//Initialisaion of the general timer
void initTimer()
{
  Timer timer = new Timer();
  timer.scheduleAtFixedRate(new TimerTask() {

    @Override
      public void run() {
        timerFunction(); //Call to the timerFunction to execute every msInterval milliseconds
    }
  }
  , 0, (int)msInterval); //msInterval parameter = time between code executions
}

//Code you want to execute every msInterval milliseconds
void timerFunction()
{
  rectWidth = width;
  ellipseRadius = 60.0;
}
