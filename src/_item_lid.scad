/*
 The lid for the case
*/
use <cuberounded.scad>

module picker(stick=false){
  translate([8.5,2.5,8])
  union(){
    rotate([180,0,0])
    cylinder(4.5,1.8,0.5);
    
    if (stick) {
      translate([0,0,-2.5])
      cylinder(h=24.0,r=2.3);
      
      translate([0,0,17.5])
      cylinder(h=4.1,r=5.3);
    }
  }
}

module anchor(m=false,length=10.2,size=3.5){
  difference(){
    cube([length-0.2,size-0.2,size-0.2]);

    translate([m?length:-0.1,m?0:size-0.1,m?0:-0.1])
    rotate([m?0:180,-90,0])
    linear_extrude(length)
    polygon(points=[[0,0],[size,size],[0,size]],paths=[[0,1,2]],convexity=1);
  }
}


module opener(){
  cube([11,4,2.3]);
  
  translate([0,53,-0.1])
  cube([11,5,2.3]);
}

module snaphelper() {
  translate([20,3.4,-1.3])
  union(){
    cube([9.8,48.4,2.5]);
    
    translate([25,0,0])
    cube([9.8,48.4,2.5]);
  }
}

module backlid_snapins() {
  translate([20,1.4,-1.3])
  union(){
    backlid_snapinset_rl();
    
    translate([25,0,0])
    backlid_snapinset_rl();

  }
}

module backlid_snapinset_rl() {
  anchor();
  
  translate([0,50.1,0])
  anchor(m=true);
}

module prelid(){
  translate([2.6,2.6,-7.5])
  difference(){
    cuberounded([71.1,50,5],4.1);

    translate([-0.1,-0.1,-8.8])
    cube([72,52,12.2]);

    translate([65,32,4])
    rotate([180,0,0])
    linear_extrude(2)
    text("WLED",15,font="Liberation Sans:style=Bold",halign="right");
  }

  backlid_snapins();

  color("azure",0.15)
  snaphelper();

  translate([0,0,-28.6])
  difference(){
    cuberounded([76,54.5,27],5.1);
    
    translate([-0.1,-0.1,-2])
    cuberounded([76.2,54.7,27],5.1);
    
    translate([19.5,-0.2,24.9])
      union(){
        opener();
        
        translate([25,0,0])
        opener();
      }
  }
}

module lid() {
  translate([0,0.1,4])
  difference(){
    prelid();
    
    translate([4.2,4.2,5])
    cuberounded([68,46,2],5.1);
  }
}

lid();