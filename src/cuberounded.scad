            // Set to 0.01 for higher definition curves (renders slower)
$fs = 0.701;

module cuberounded(size = [1, 1, 1], radius = 1, xonly = false) {
  size = (size[0] == undef) ? [size, size, size] : size;

  translate_min = radius;
  translate_xmax = size[0] - radius;
  translate_ymax = size[1] - radius;
  translate_zmax = size[2] - radius;

  hull() {
    for (translate_x = [translate_min, translate_xmax]) {
      for (translate_y = [translate_min, translate_ymax]) {
        for (translate_z = [translate_min, translate_zmax]) {
          translate([translate_x, translate_y, translate_z])
          rotate(
            (xonly == true) ?
              [0, 90, 0] : 
              [0, 0, 0]
          )
          cylinder(h = radius * 2, r = radius, center = true);
        }
      }
    }
  }
}

include <wled_shield_case.scad>