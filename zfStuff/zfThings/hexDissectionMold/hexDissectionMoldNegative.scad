
use <../NotoSansJP-DemiLight.otf>


pdr = 35/2;
pdh = 2;
hr = pdr/3;
hw = .75;
hh = 6.5;
hd = hr * sqrt(3);



module labels() {
   translate([0, 0, hh/2-.5]) {
      rotate([0, 0, 0]) {translate([-1,3, 0]) {number(1);}}
      rotate([0, 0, 60]) {translate([-1, 3, 0]) {number(2);}}
      rotate([0, 0, 120]) {translate([-1, 3, 0]) {number(3);}}
      rotate([0, 0, 180]) {translate([-1, 3, 0]) {number(4);}}
      rotate([0, 0, 240]) {translate([-1, 3, 0]) {number(5);}}
      rotate([0, 0, 300]) {translate([-1, 3, 0]) {number(6);}}

      rotate([0, 0, 0]) {translate([-1,15, 0]) {number(1);}}
      rotate([0, 0, 60]) {translate([-1, 15, 0]) {number(2);}}
      rotate([0, 0, 120]) {translate([-1, 15, 0]) {number(3);}}
      rotate([0, 0, 180]) {translate([-1, 15, 0]) {number(4);}}
      rotate([0, 0, 240]) {translate([-1, 15, 0]) {number(5);}}
      rotate([0, 0, 300]) {translate([-1, 15, 0]) {number(6);}}
   }
}

hexhex();
#labels();
lid();

module lid() {
   translate([0, 0, hh/2+pdh/2-.1]) {
      %cylinder(r=pdr, h=pdh, center=true);
      difference() {
         cylinder(r=pdr*1.25, h=pdh, center=true);
         union() {
            hexagon(hr/2, 2*(hh+pdh));
            rotate([0, 0, 30+60*0]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
            rotate([0, 0, 30+60]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
            rotate([0, 0, 30+60*2]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
            rotate([0, 0, 30+60*3]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
            rotate([0, 0, 30+60*4]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
            rotate([0, 0, 30+60*5]) {translate([0, pdr-hr/2, 0]) {hexagon(hr/2, 2*(hh+pdh));}}
         }
      }
   }
}


module hexhex() {
   /* #hexagon(hr/2); */
   translate([0, hd, 0]) {hexagon(hr, hh);}
   translate([0, -hd, 0]) {hexagon(hr, hh);}
   translate([hr*1.5, -hd/2, 0]) {hexagon(hr, hh);}
   translate([hr*1.5, hd/2, 0]) {hexagon(hr, hh);}
   translate([-hr*1.5, hd/2, 0]) {hexagon(hr, hh);}
   translate([-hr*1.5, -hd/2, 0]) {hexagon(hr, hh);}

}
module hexagon(hex_radius,hex_height) {
   cylinder(r=hex_radius-hw, h=hex_height, $fn=6, center = true);
}


module number(n) {
   translate([0,0,0]) {
      scale([.14,.14,1]) {
         linear_extrude(height = 2, center = true, convexity = 10, twist = 0)
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
