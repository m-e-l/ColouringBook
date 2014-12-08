
int border = 45;
int activeBorder = 15;
int frameSize = 15;
int mouseColor = 0;
int mouseBrightness = 200;
int mouseSaturation = 200;
int mouseOpacity = 200;
PImage figure;
int stepY = 5;
int stepX = 5;
int gridY = 0;
int gridX = 0;
int brushSize = 50;

void setup() 
{
  size(700,700);
  figure = loadImage("sketchfigurecopy.png");

  colorMode(HSB, (height - activeBorder), (width - activeBorder), (height - activeBorder), (width - activeBorder));
}

void draw()
{
// border around image  
  fill(0, 0, (height - activeBorder), (width - activeBorder));
  rect(0, 0, width, border);
  rect(0, 0, border, height);
  rect(0, (height-border), width, border);
  rect((width-border), 0, border, height);
  
  
// frame to show current colour
  fill(mouseColor, mouseSaturation, mouseBrightness, (width - activeBorder));
  rect(activeBorder, activeBorder, (width-2*activeBorder), frameSize);
  rect(activeBorder, activeBorder, frameSize, (height-2*activeBorder));
  rect(activeBorder, (height-activeBorder-frameSize), width-2*activeBorder, frameSize);
  rect((width-activeBorder-frameSize), activeBorder, frameSize, height-2*activeBorder);
  
  
  
  image(figure, border, border, (width - (2*border)), (height - (2*border)));
  
  // populate right hand side with hue values
  for (gridY = 0; gridY < (height-activeBorder); gridY += stepY)
  {
     noStroke();
     fill(gridY, (width - activeBorder), (height - activeBorder), (width - activeBorder)); 
     rect((width-activeBorder), gridY, activeBorder, stepY);
  }

  // populate bottom row with saturation values
 
  for (gridX = 0; gridX < (width-activeBorder); gridX += stepX)
  {
     noStroke();
     fill((mouseColor), gridX, (height - activeBorder), (width - activeBorder)); 
     rect((width - stepX - gridX), (height- activeBorder), stepX, activeBorder);
  }
 
  
  
  // populate left side with brightness values
  for (gridY = 0; gridY < (height - activeBorder); gridY += stepY)
  {
     noStroke();
     fill((mouseColor), (width - activeBorder), gridY, (width - activeBorder)); 
     rect(0, (height - gridY - stepY), activeBorder, stepY);
  }
  
  // populate top side with opacity values

  for (gridX = 0; gridX < (width - activeBorder); gridX += stepX)
  {
     noStroke();
     fill((mouseColor), (gridX), (height - activeBorder), (width - activeBorder)); 
     rect(gridX, 0, stepX, activeBorder);
  }
  
  
  if(mousePressed == true)
  {
 
 // rules for selecting opacity, saturation, brightness, hue
    
    if((mouseY < activeBorder) && mouseX < (width - activeBorder))
    {
      mouseOpacity = mouseX;
    }
    
    else if ((mouseY > (height - activeBorder)) && (mouseX > activeBorder))
    {
      mouseSaturation = (width - activeBorder - mouseX);
    }
    
   else if (mouseX > (width - activeBorder))
    {
     mouseColor = mouseY;
    }
   else if (mouseX < activeBorder)
   {
     mouseBrightness = height - mouseY;
   }
        
        
      else if (mouseX <= (width-activeBorder))
      {
       noStroke();  
       fill(mouseColor, mouseSaturation, mouseBrightness, mouseOpacity);
       //fill(mouseColor, 20, 70, 10);
       ellipse(mouseX, mouseY, brushSize, brushSize);
       }
  
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    saveFrame("transparencytest.jpg");
  }

}

