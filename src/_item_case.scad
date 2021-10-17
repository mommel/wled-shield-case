/*
 The box for the first versions of wled shield case
*/
use <_item_lid.scad>
use <cuberounded.scad>

module sidestickholder(){
  translate([5,-1,7.5])
  cube([6.5,2,18.5]);
  
  translate([62.7,-1,6.4])
  cube([5,2,19]);
}

module pickers(sticks=false){
  picker(sticks);

  translate([0,41.2,0])
  picker(sticks);

  translate([56.2,0.2,0])
  picker(sticks);

  translate([56.2,41.2,0])
  picker(sticks);
}

module picker(stick=false){
  translate([8.5,2.5,8])
  union(){
    rotate([180,0,0])
    cylinder(4.5,1.8,0.5);
    
    if (stick) {
      translate([0,0,-1.5])
      cylinder(h=20.0,r=2.3);
      
      translate([0,0,17.5])
      cylinder(h=1,r=5.3);
    }
  }
}

module fixinghole() {
  union(){
    cylinder(1.4,3.2,3.2);
    
    translate([0,0,1.0])
    cylinder(1.1,2.8,2.8);
    
    translate([0,0,3.-1])
    cylinder(1.4,2.3,2.3);
    
    translate([0,0,3.0])
    cylinder(1.4,3.2,3.2);
  }
}

module mesh(size=[1,1,1]){
  size=(size[0]==undef) ? [size,size,size] : size;
  
  linear_extrude(size[2])
  for(rx=[0:size[0]-1]){
    translate([rx*4,,0])
    for(ry=[0:size[1]-1]){
      translate([0,ry*9,0])
      union(){
        polygon(points=[[0,0],[3,0],[0,3]],paths=[[0,1,2]],convexity=10);
        
        translate([0,1,0])
        polygon(points=[[3,3],[0,3],[3,0]],paths=[[0,1,2]],convexity=10);
        
        translate([0,5,0])
        polygon(points=[[3,3],[3,0],[0,0]],paths=[[0,1,2]],convexity=10);
        
        translate([0,6,0])
        polygon(points=[[0,0],[3,3],[0,3]],paths=[[0,1,2]],convexity=10);
      }
    }
  }
}

module wireholes(){
  fixinghole();

  translate([0,5,0])
  fixinghole();

  translate([0,10,0])
  fixinghole();

  translate([0,15,0])
  fixinghole();

  translate([0,20,0])
  fixinghole();

  translate([0,25,0])
  fixinghole();
}

module thebox() {
  
  sidestickholder();
  
  translate([0,46.2,0])
  sidestickholder();
  
  pickers(sticks=true);
  
  translate([-4.5,-4.5,4.6])
  difference() {
    // The BOX
    translate([-2,-2,-2])
    cuberounded([80,58.5,27],5.1);
    
    // Space for the lid
    prelid();
    
    // Inner Grind
    translate([3.4,3.4,-1]) 
    cuberounded([69.4,48.4,22.5],4.1);
    
    // Frontside cabel injection hole 
    translate([72,11,-4])
    cuberounded([7,33.2,14.9],0.8,true);
    
    // Frontside cabel injection hole 
    translate([74.5,9,-3])
    cuberounded([2.0,37.2,16.9],0.8,true);
    
    // Backside ventilation
    translate([3.5,10,0])
    rotate([-90,-90,90])
    scale([2,2,1.5])
    mesh([3,2,4]);
    
    // Leftside inner tag WLED
    translate([66.6,3.7,4])
    rotate([90,0,0])
    linear_extrude(0.5)
    text("WLED",15,font="Liberation Sans:style=Bold",halign="right");
    
    // Leftside outside tag WLED
    translate([69.6,-1.5,3.4])
    rotate([90,0,0])
    linear_extrude(0.5)
    text("WLED",15,font="Liberation Sans:style=Bold",halign="right");
    
    translate([4.5,4.5,-5])
    union(){
      // Button hole
      translate([31.8,53,22.5])
      rotate([90,90,0])
      cylinder(h=4,r1=2,r2=2.4);
      translate([27.5,50,27.3])
      rotate([90,90,0])
      cube([9,9,4.5]);
      
      // wire attachments
      translate([58.5,9.7,26.0])
      wireholes();
      
      //displaywindow inner
      translate([-2.2,-1.6,0])
      translate([12.7,9.4,26.4])
      cuberounded([14,30.5,2],0.4);
      cube(0);
      
      //displaywindow outer
      translate([-2.2,-1.6,0])
      translate([13.3,11.6,26.4])
      cuberounded([13,27.5,4],0.5);
      cube(0);
      
      // mesh below display
      translate([2,0,0])
      translate([27.7,1,26.4])
      scale([1.5,1.65,1.5])
      mesh([1,3,4]);
      
      // mesh below display line 2
      translate([13,44.6,0])
      translate([27.7,1,26.4])
      scale([1.5,1.65,1.5])
      rotate([0,0,180])
      mesh([1,3,4]);
      
      // mesh on top of display
      translate([1,1,26.4])
      mesh([1,5,4]);
      
      // Signes for holes
      translate([48,8,29.3])
      linear_extrude(3)
      union(){
        translate([21,0,0])
        rotate([0,0,90])
        text("IN",6,font="Liberation Sans:style=Bold");
        
        translate([20.5,8.4,0])
        rotate([0,0,90])
        text("|",6,font="Liberation Sans:style=Bold");
        
        translate([21,11.6,0])
        rotate([0,0,90])
        text("LED",6,font="Liberation Sans:style=Bold");
        
        translate([7,0,0])
        text("PWR",4,font="Liberation Sans:style=Bold",halign="right");
        
        translate([7,5.1,0])
        text("GND",4,font="Liberation Sans:style=Bold",halign="right");
        
        translate([7,10.2,0])
        text("GND",4,font="Liberation Sans:style=Bold",halign="right");
        
        translate([7,15.3,0])
        text("5V",4,font="Liberation Sans:style=Bold",halign="right");
        
        translate([7,20.4,0])
        text("CLK",4,font="Liberation Sans:style=Bold",halign="right");
        
        translate([7,25.5,0])
        text("Data",4,font="Liberation Sans:style=Bold",halign="right");
      }
    }
  }
}

module case(){
  translate([-4.5,4.5,29.6])
  rotate([0,180,0])
  thebox();
}

case();