
/*----------------------------------------------------------------------------------------------
RadarChart class is used to draw a radar chart. This is an example of how to use the RadarChart class
to plot a radar chart. I will use a simple example of countries as an entitiy and plot attributes of countries 
such as Primary energy production, renewable electricty generation, energy consumption, Carbon dioxide emissions,
population. This example will aslo demostrate to plot additional entities on the same chart to aid comparison. 

And, the example also displays how this chart can be used to demostrate the gradient over a scale of 
another dimension, in this example its time, ranging from 1981 to 2009.
----------------------------------------------------------------------------------------------------*/

RadarChart rc;

void setup(){  
  
  setupBackground();
  
  setupRadarChart();  //scale and draw the axes of all dimensions of the entity
 
  plotRadarChart();  //plot the data points values
}

void draw(){
  
}

