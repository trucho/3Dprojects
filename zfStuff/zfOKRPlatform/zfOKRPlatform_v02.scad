
/* % translate([0, 0, (ChH-zfH)/2-.01+10]) {zfSketch(zfH+.01);} */
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
/*
difference() {
   OKRplatform();
   fiberAttachmentFiber();
} */
translate([0, -faR-2, 0]) {fiberAttachment();}





/* translate([0, -faR-2, faH/2+10]) {#fiberOptic_single2();} */


// platform dimensions
pR = 20; //based on 50mm petri dish lid
pH = 3; //not sure this matters

pR1 = pR-2;
pR2 = pR1-4;
pHTot = pH*2;

faR = 5;
faH = pHTot;

foL = pR1+faR/2;
foR = 0.6;

module fiberOptic_single() {
   translate([0, (-foL+faR)/2-foR,0]) {
      rotate([90, 0, 0]) {cylinder(r=foR, h=foL-8, center=true, $fn=100);}
   }
   translate([0, (-foR+faR)/2, foL/2+.2]) {
      rotate([0, 0, 90]) {cylinder(r=foR, h=foL-2, center=true, $fn=100);}
   }
   translate([0, (-foL+faR)/2-foR+8,.75]) {
      rotate([110, 0, 0]) {cylinder(r=foR, h=5, center=true, $fn=100);}
   }
   translate([0, (-foL+faR)-1, 0]) {irLED();}
}

module fiberOptic_single_square() {
   translate([0, (-foL+faR)/2-foR,0]) {
      rotate([90, 0, 0]) {cylinder(r=foR, h=foL, center=true, $fn=100);}
   }
   translate([0, (-foR+faR)/2, foL/2]) {
      rotate([0, 0, 90]) {cylinder(r=foR, h=foL, center=true, $fn=100);}
   }
   translate([0, (-foR+faR)/2-.15, foR/2-.15]) {sphere(r=foR*1.5, $fn=100);}
   translate([0, (-foL+faR)-1, 0]) {irLED();}
}

ledR = 5/2;
ledH = 6;

module irLED() {
   translate([0, 0, 0]) {
      rotate([-90, 0, 0]) {
         sphere(r=ledR, $fn=100);
         translate([0, 0, -ledH/2]) {cylinder(r=ledR, h=ledH, center=true, $fn=100);}
      }
   }
}

module fiberAttachmentFiber() {
   translate([0, 0, faH/2]) {
      union() {
         cylinder(r=faR, h=faH+.005, center=true, $fn=100);
         rotate([0, 0, 90]) {
            translate([-pR1/2, 0, -faH]) {
               trapezoid(pR2*2,faR*2, pR1,faH);
            }
         }
      }
      fiberOptic_single();
   }
}

module fiberAttachment() {
   translate([0, 0, faH/2]) {
      difference() {
         union() {
            cylinder(r=faR, h=faH+.005, center=true, $fn=100);
            rotate([0, 0, 90]) {
               translate([-pR1/2, 0, -faH]) {
                  trapezoid(pR2*2,faR*2, pR1,faH);
                  translate([-10.4, 0, faH]) {cube(size=[ledH ,faR*2, faH], center=true);}
               }
            }
         }
         fiberOptic_single();
      }
   }
}

module OKRplatform() {
   translate([0, 0, pH/2]) {
      difference() {
         OKRplatform_fullcircle();
         translate([0, -20, 0]) {cube(size=[pR*2,40,pH*6], center=true); }
      }
      backing();
   }
}

module backing() {
   cube(size=[pR*2, .25, pH], center=true);
   translate([0, 0, pH/4]) {cube(size=[pR1*2, .25, pH+(pH/2)], center=true);}
   translate([0, 0, pH/2+zfH/2]) {cube(size=[pR2*2, .25, pH+(pH/2)], center=true);}
}
module OKRplatform_fullcircle() {
   // outer cylinder
   cylinder(r=pR, h=pH, center=true, $fn=100);
   //fish holder + lip to hold methylcellulose
   difference() {
      translate([0, 0, pH/2]) {cylinder(r=pR1, h=pH, center=true, $fn=100);}
      translate([0, 0, pH+(pH/2)-0.25]) {cylinder(r=pR1-.25, h=pH, center=true, $fn=100);}
   }
   // tail holder with 30deg spacing
   difference() {
      translate([0, 0, pH+(pH/2)-0.25-(zfH*2/2)]) {cylinder(r=pR2, h=zfH*2, center=true, $fn=100);}
      union() {
         rotate([0, 0, 15+000]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
         rotate([0, 0, 15+030]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
         rotate([0, 0, 15+060]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
         rotate([0, 0, 15+090]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
         rotate([0, 0, 15+120]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
         rotate([0, 0, 15+150]) {translate([pR2-ChL/2, 0, pH+(pH/2)-0.25+zfH/2]) {cube(size=[ChL+.01, .4*2, zfH*3], center=true);}}
      }
   }
}
/* number(1); */

/* difference() {
   chamber();
   union() {
      //coverslip();
      coverslipBack();
      # number(3);
      ledGuide();
   }
} */


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
