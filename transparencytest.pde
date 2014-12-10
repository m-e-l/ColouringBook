
int border = 50;
int activeBorder = 15;
int frameSize = 33;
int mouseColor = 400;
int mouseBrightness = 200;
int mouseSaturation = 200;
int mouseOpacity = 200;
PImage figure;
int stepY = 5;
int stepX = 5;
int gridY = 0;
int gridX = 0;
int brushSize = 50;
int maxHue = 500;
int maxBrightness = 800;
int maxSaturation = 800;
int maxOpacity = 800;


void setup() 
{
  size(700,700);
  figure = loadImage("sketchfigurecopy.png");
  maxHue = height - activeBorder;
  maxSaturation = width - activeBorder;
  maxBrightness = height - activeBorder;
  maxOpacity = width - activeBorder;

  colorMode(HSB, maxHue, maxSaturation, maxBrightness, maxOpacity);
  cursor(CROSS);
  
 
}

void draw()
{
  

  
// border around image  
  noStroke();
  fill(0, 0, 0);
  rect(0, 0, width, border);
  rect(0, 0, border, height);
  rect(0, (height-border), width, border);
  rect((width-border), 0, border, height);
  
  
// frame to show current colour
  noStroke();
  fill(mouseColor, mouseSaturation, mouseBrightness, maxOpacity);
  rect(activeBorder, activeBorder, (width-2*activeBorder), frameSize);
  rect(activeBorder, activeBorder, frameSize, (height-2*activeBorder));
  rect(activeBorder, (height-activeBorder-frameSize), width-2*activeBorder, frameSize);
  rect((width-activeBorder-frameSize), activeBorder, frameSize, height-2*activeBorder);
  
  
  
  image(figure, border, border, (width - (2*border)), (height - (2*border)));
  
  // populate right hand side with hue values
  for (gridY = 0; gridY < (height-activeBorder); gridY += stepY)
  {
     noStroke();
     fill(gridY, maxSaturation, maxBrightness, maxOpacity); 
     rect((width-activeBorder), gridY, activeBorder, stepY);
     
  // draw square to indicate current hue value   
     noFill();
     stroke(#555555);
     strokeWeight(2);
     rect((width-activeBorder), (mouseColor - (activeBorder/2)), (activeBorder), (activeBorder));
  }

  // populate bottom row with saturation values
 
  for (gridX = 0; gridX < (width-activeBorder); gridX += stepX)
  {
     noStroke();
     fill(mouseColor, gridX, maxBrightness, maxOpacity); 
     rect((width - stepX - gridX), (height- activeBorder), stepX, activeBorder);
     
     noFill();
     stroke(#555555);
     strokeWeight(2);
     rect((width - activeBorder - mouseSaturation - (activeBorder/2)), (height-activeBorder), (activeBorder), (activeBorder));
  }
 
  
  
  // populate left side with brightness values
  for (gridY = 0; gridY < (height - activeBorder); gridY += stepY)
  {
     noStroke();
     fill(mouseColor, maxSaturation, gridY, maxOpacity); 
     rect(0, (height - gridY - stepY), activeBorder, stepY);
     
     noFill();
     stroke(#555555);
     strokeWeight(2);
     rect(0, (height - mouseBrightness - (activeBorder/2)), (activeBorder), (activeBorder));
  }
  
  // populate top side with opacity values

  for (gridX = 0; gridX < (width - activeBorder); gridX += stepX)
  {
     noStroke();
     fill(mouseColor, (gridX), maxBrightness, maxOpacity); 
     rect(gridX, 0, stepX, activeBorder);
     
     noFill();
     stroke(#555555);
     strokeWeight(2);
     rect((mouseOpacity-(activeBorder/2)), 0, (activeBorder), (activeBorder));

  }
  
  
  if(mousePressed == true)
  {
 
 // rules for selecting opacity, saturation, brightness, hue
    
    if((mouseY < activeBorder) && mouseX <= (width - activeBorder))
    {
      mouseOpacity = mouseX;

    }
    
    else if ((mouseY > (height - activeBorder)) && (mouseX >= activeBorder))
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
        
        
      else if (mouseX <= (width - activeBorder))
      {
       noStroke();  
       fill(mouseColor, mouseSaturation, mouseBrightness, mouseOpacity);
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

  if (key == '-')
  {
    if (brushSize <= 5)
    {
      brushSize = 5;
    }
    else brushSize -= 5;
  }
  
  if (key == '+')
  {
    brushSize += 5;
  }

}

