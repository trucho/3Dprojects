
use <../NotoSansJP-DemiLight.otf>


dr = 55/2;
dh = 7;
dw = 1;
df = 8;


hr = dr/3;
hw = .75;
hh = (df-2);
hd = hr * sqrt(3);



module labels() {
   translate([0, 0, -2.4]) {
      rotate([0, 0, 0]) {translate([-2,14, 0]) {number(1);}}
      rotate([0, 0, 60]) {translate([-2, 14, 0]) {number(2);}}
      rotate([0, 0, 120]) {translate([-2, 14, 0]) {number(3);}}
      rotate([0, 0, 180]) {translate([-2, 14, 0]) {number(4);}}
      rotate([0, 0, 240]) {translate([-2, 14, 0]) {number(5);}}
      rotate([0, 0, 300]) {translate([-2, 14, 0]) {number(6);}}
      rotate([0, 0, 0]) {translate([-2,-1, 0]) {number(7);}}
   }
}

difference() {
   lid();
   union() {
      hexhex();
      labels();
   }
}


module lid() {
   difference() {
      cylinder(r=dr, h=dh, center=true);
      translate([0, 0, df]) {cylinder(r=dr-dw, h=dh+df, center=true);}
   }
}


module hexhex() {
   hexagon(hr,hh);
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
      scale([.3,.3,1]) {
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
