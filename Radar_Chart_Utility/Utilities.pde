
//basic utility methods used in setup() and draw()

void setupBackground(){
 
  size(800,600);  //screen size set to 800*600
  background(#FFFFFF);  //back ground color white
 
  // Header label
  PFont myFont = createFont("SansSerif", 15);
  textFont(myFont);
  fill(#000000);  
  textAlign(CENTER, CENTER);
  text("Radar Chart Utility Test",percentX(45), percentY(3));   
}

void setupRadarChart(){    

  rc = new RadarChart(percentX(15),percentX(3),percentX(40),percentY(70),percentX(5),percentY(5),7,5,percentX(8),percentY(8));
}

void plotRadarChart(){
  
}

//methods to use percentage instead of absolute values
//X - axis
int percentX(int value){
  return (value * width)/100;
}

//Y - axis
int percentY(int value){
  return (value * height)/100;
}
