//Optics base with and without magnet

X=50; //Base Diameter
Y=25;  //Base Height
d=8; //Guide Rod Diameter
q=13; //Magnet Diameter
r=3.5; //Magnet Thickness
magnet_hole = true;// Change this true to false to remove the Hole for the Magnet

base_large();

module base_large(){
if (magnet_hole==true){
difference(){
cylinder(Y/5,X/2,X/2);
cylinder(r,q/2,q/2);
}
}else{
cylinder(Y/5,X/2,X/2);
}

difference(){
translate([0,0,Y/5])cylinder((Y),X/2,(d+6)/2);
translate([0,0,Y/5])cylinder((Y),(X/2)-6,((d+6)/2)-6);
}
difference(){
translate([0,0,Y/5+Y])cylinder((Y/5)*2,(d+6)/2,(d+6)/2);
translate([0,0,Y/5+Y])cylinder((Y/5)*2,(d+1)/2,(d+1)/2);
}
}





