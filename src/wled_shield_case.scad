/*
  All components for the wled shield case
*/
// Rednerquality 0.01 for print 0.9 for dev
$fs = 0.01;

use <_item_lid.scad>;
translate([4,4,0])
lid();

use <_item_case.scad>;
translate([-4,4,0])
case();

use <_item_wirebox.scad>;
translate([-40,-55,-4])

wirebox();