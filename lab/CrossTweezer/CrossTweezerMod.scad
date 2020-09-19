
difference() {
	union(){
rotate([0,0,0]) import(file="cross-tweezer-tough.stl");}

union(){
translate([78,5,2]) 
{rotate([0,-5,15]) cube([10,20,10]);}

translate([35,-7,9]) cube([15,12,10]);
}


}