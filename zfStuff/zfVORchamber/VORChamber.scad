
% translate([0, 0, (ChH-zfH)/2-.01]) {zfSketch(zfH+.01);}
/* % coverslip(); */


use <NotoSansJP-DemiLight.otf>

/* text("五"); */
// Chamber dimensions (in mm)
ChL = 6.5;
ChW = 5.0;
ChH = 4.0;
zfH = 1.0;

coverR = 2.5;
coverH = .2;

/* number(1); */

difference() {
   chamber();
   union() {
      //coverslip();
      coverslipBack();
      # number(3);
      ledGuide();
   }
}


module chamber() {
   difference() {
      cube(size=[ChL, ChW, ChH], center=true);
      translate([0, 0, (ChH-zfH)/2+.01]) {zfSketch(zfH+.01);}
   }
}

// I think this might create a Fresnel window and make stimulus invisible
module coverslip() {
   translate([(ChL-coverR)/2, 0, ChH/2]) {
      cylinder(r=coverR, h=.2, center=true, $fn=20);
      translate([coverR, 0, 0]) {cube(size=[coverR*2, coverR*2+.1, .2], center=true);}
   }
}
module coverslipBack() {
   translate([-.7, 0, ChH/2]) {
      difference() {
         cylinder(r=coverR, h=.2, center=true, $fn=20);
         //translate([coverR, 0, 0]) {cube(size=[coverR*2, coverR*2, .4], center=true);}
      }
   }
}

module ledGuide() {
   translate([1.2, -1.2, ChH/2-.4]) {
      cylinder(r=.2, h=10, center=true, $fn=20);
   }
}
module number(n) {
   translate([.8, .8, ChH/2-.1]) {
      scale([.1,.1,1]) {
         linear_extrude(height = 1, center = true, convexity = 10, twist = 0)
         if (n==1) { text("一", font = "NotoSansJP-DemiLight");}
         else if (n==2) { text("二", font = "NotoSansJP-DemiLight");}
         else if (n==3) { text("三", font = "NotoSansJP-DemiLight");}
         else if (n==4) { text("四", font = "NotoSansJP-DemiLight");}
         else if (n==5) { text("五", font = "NotoSansJP-DemiLight");}
         else if (n==6) { text("六", font = "NotoSansJP-DemiLight");}
         else if (n==7) { text("七", font = "NotoSansJP-DemiLight");}
         else if (n==8) { text("八", font = "NotoSansJP-DemiLight");}
      }
   }
}

module zfSketch(h) {
   // tail platform
   translate([0, 0, h/4+.01]) {
      cube(size=[ChL+.01, .4, h/2+.01], center=true);
   }
   // tail flat
   /* cube(size=[ChL+.01, .4, h/2], center=true); */
   translate([(ChL-1.0)/2, 0, 0]) {
      cube(size=[1.0+.01, 1.1, h], center=true);
      translate([0, 0, -h]){trapezoid(ChW,1.1,1.1,h);}
      translate([-(1.0+.46)/2, 0, -h]) {trapezoid(1.1,.4,.46,h);}
   }
}



module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);
	}}
}
