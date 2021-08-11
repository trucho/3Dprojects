
KKLbanner();

module celestia() {
   difference() {
      scale([.1, .1, .1]){surface(file = "Celestia.png", center = true);}
      translate([0, 0, -1]) {cube(size=[200, 200, 2], center=true);}
   }
}
