
Axis[] axes;

//basic utility methods used in setup() and draw()

void setupBackground(){
   
  background(#FFFFFF);  //back ground color white
 
  // Header label
  PFont myFont = createFont("SansSerif", 15);
  textFont(myFont);
  fill(#000000);  
  textAlign(CENTER, CENTER);
  text("Radar Chart Utility Test",percentX(45), percentY(3));   
}

void setupRadarChart(){    

  //sample dimensions of the radar chart
  //example - considering a country's energy production, consumption, emission and population data
  //Country as an entity and these parameters as dimensions
  axes = new Axis[5];
  axes[0] = new Axis(1,"Energy production","Quad BTU");
  axes[1] = new Axis(2,"Electricty generation","Quad BTu");
  axes[2] = new Axis(3,"Energy consumption","Quad BTU");
  axes[3] = new Axis(4,"CO2 emissions","Mil metric tons");
  axes[4] = new Axis(5,"Population","millions");
  
  rc = new RadarChart(percentX(25),percentX(3),percentX(40),percentY(70),percentX(5),percentY(5),6,5,percentX(15),percentY(12)); //5 dimensions, 6 intrevals
  
  rc.drawChart(); //draw the skeleton chart. 
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

/*-----------------------------------------------
-------------------------------------------------*/

class Axis{

  int id;
  String Name;
  String Unit;
  
  Axis(int _id, String _name, String _unit){
    id = _id;
    Name = _name;
    Unit = _unit;
  }
}
