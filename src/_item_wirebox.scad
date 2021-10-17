/*
 The optional box for power and neopixeljack
*/
use <_item_case.scad>
use <cuberounded.scad>

module wirebox() {
  translate([-4.5,-4.5,4.6])
  union() {
    difference() {
      cuberounded([45.0,58.4,27],5.1);
      
      //removes box attachment with a small gap
      translate([-59.1,6.5,-2.6])
      thebox();
      
      //removes box attachment with offset for top
      translate([-59,6.5,55])
      mirror([0,0,1])
      thebox();
      
      //removes box attachment with offset for bottom
      translate([-59,6.5,-28])
      thebox();
      
      // removes box inner negative
      translate([-0.1,0,-0.1])
      cube([11.4,58.6,27.5]);
      
      // innerspace
      translate([19,3,2])
      cube([21.4,52,22]);
      
      translate([0,15,6])
      cube([20,29,17]);
      
      
      translate([0,4,-0.1])
      cube([14.4,50.5,3]);
      
      // Power hole
      translate([43.6,40,14])
      //11.5
      rotate([90,0,90])
      cylinder(r=5.75,h=1.5);
      
      // Power hole inner
      translate([40.3,40,14])
      //11.5
      rotate([90,0,90])
      cylinder(r=6.75,h=3.5);
      
      // Neopixeljack
      translate([40.3,15,12])
      union(){
        cube([4.8,8,4.5]);
        
        translate([0,2,0])
        cube([4.8,4,7.5]);
        
        translate([3.7,-1,-1.2])
        cube([1.1,10,6.9]);
      }
    }
  }
}

wirebox();