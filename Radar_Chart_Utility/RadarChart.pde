class RadarChart{
  
  float X;
  float Y;
  float chartWidth;
  float chartHeight;
  float angle;
  float marginWidth;
  float marginHeight;
  float centerX;
  float centerY;
  float axisLength;
  int intervals;
  float intervalLength;
  int distance = 5;
  int dimensions;
  int labelWidth;
  int labelHeight;
  float[] axisPointsX;
  float[] axisPointsY;
  
  //Constructor - sets margin width, margin height, number of intervals on the axes to default values
  RadarChart(float _X, float _Y, float _chartWidth, float _chartHeight,int dim){
    
    dimensions = dim; 
    angle = 360 / dim;
    marginWidth = 50;  //default values - edit defaults of use the construtor over load.
    marginHeight = 50; //default values - edit defaults of use the construtor over load.
    X = _X + marginWidth;
    Y = _Y + marginHeight;
    chartWidth = _chartWidth - (marginWidth * 2);
    chartHeight = _chartHeight - (marginHeight * 2);
    centerX = _X + (_chartWidth/2);
    centerY = _Y + (_chartHeight/2);
    axisLength = chartHeight/2 - marginHeight;
    intervals = 5; //number of intervals on the axes
    intervalLength = axisLength/float(intervals);
    
  }
  
  //Constructor - accepts all user input values
  RadarChart(float _X, float _Y, float _chartWidth, float _chartHeight, float _marginWidth, float _marginHeight, 
            int _intervals, int dim, int lblWidth, int lblHeight){
 
    dimensions = dim; 
    angle = 360 / dim;
    marginWidth = _marginWidth;
    marginHeight = _marginHeight;
    X = _X + marginWidth;
    Y = _Y + marginHeight;
    chartWidth = _chartWidth - (marginWidth * 2);
    chartHeight = _chartHeight - (marginHeight * 2);
    centerX = _X + (_chartWidth/2);
    centerY = _Y + (_chartHeight/2);
    axisLength = chartHeight/2 - marginHeight;
    intervals = _intervals;
    intervalLength = axisLength/float(intervals);
    labelHeight = lblHeight;
    labelWidth = lblWidth;
  }
  
  void setDimensions(int dim){  //to change the number of dimensions of the chart dynamically. Chart will have to be redrawn after this or drawChart() should be invoked in draw()
    dimensions = dim;
    angle = 360 / dimensions;
  }
  
  void drawChart(){
    
    stroke(0);
    strokeWeight(1);
    point(centerX,centerY);
    
    axisPointsX = new float[dimensions];
    axisPointsY = new float[dimensions];
    float xValue;
    float yValue;
    float ang = 0;
 
    for(int i = 0; i < dimensions; i++, ang += angle){  //increment angle of the axis/dimension drawn i.e. increment by 360/3 deg for a chart of 3 dimentions/axis

      float len = intervalLength;
      axisPointsX[i] = getX(ang, axisLength + labelHeight/3);
      axisPointsY[i] = getY(ang, axisLength + labelHeight/3);
      
      stroke(#ADA5A8);
      strokeWeight(1);
      line(centerX,centerY,axisPointsX[i],axisPointsY[i]);    //draw the axis line
      
      stroke(0);
      
      displayLabels(ang, axes[i]); 
      
      for(int index = 0; index < intervals; index++, len += intervalLength){
        xValue = getX(ang, len);
        yValue = getY(ang, len);
        
        strokeWeight(4);  //mark all the interval points on the axes drawn
        stroke(#ADA5A8);
        point(xValue,yValue);
        strokeWeight(1);
        stroke(0);
      }    
    }
  }
  
  //get the x-axis co-ordinate of a point on the axis/dimension being drawn in the radar chart
  private float getX(float ang, float len){
    return (centerX + (len * cos(radians(ang))));    
  }
  
  //get the x-axis co-ordinate of a point on the axis/dimension being drawn in the radar chart
  private float getY(float ang, float len){
    return (centerY + (len * sin(radians(ang))));
  }  
 
 
 /*display labels at the end of each axis. 
 To avoid the labels from overlapping over its own axis. The labels are positioned according to the quardant they are present in.
 I quadrant - text aligned left and bottom
 II quadrant - text aligned left and bottom but extra padding provided to the x and y co ordinates
 III quadrant - txt aligned left and bottom with padding to the y axis and x axis co-ordinate reduced by a label's width
 IV quadrant - text aligned left and bottom and x axis co-ordinate  reduced by a label's width 
 */ 
 
 private void displayLabels(float ang, Axis axis){
    float xValue = getX(ang, axisLength + labelHeight/4);
    float yValue = getY(ang, axisLength + labelHeight/4);
      
    PFont myFont = createFont("SansSerif", 10);
          textFont(myFont);
          fill(0);  
          textAlign(CENTER, TOP);                      
                    
     if(ang >= 0 && ang < 90){
       textAlign(LEFT, BOTTOM);
       text(axis.Name + " (" + axis.Unit + ")",xValue + labelWidth/6,yValue + labelHeight/4);        
     }
     if(ang >= 90 && ang < 180){    
        textAlign(LEFT, BOTTOM);   
          text(axis.Name + " (" + axis.Unit + ")",xValue - labelWidth,yValue + labelHeight/2);      
     }
     if(ang >= 180 && ang < 270){     
       textAlign(LEFT, BOTTOM);  
          text(axis.Name + " (" + axis.Unit + ")",xValue - labelWidth,yValue - labelHeight/6); 
     }
     if(ang >= 270 && ang < 360){ 
       textAlign(LEFT, BOTTOM);      
          text(axis.Name + " (" + axis.Unit + ")",xValue,yValue - labelHeight/6); 
     }
  } 
}

