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
}

