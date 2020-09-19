
module block(innerRadius,outerRadius,externalRadius,angle,segments,s){
	segmentAngle=360/segments;
	xia=innerRadius*cos(angle);
	yia=innerRadius*sin(angle);
	xib=innerRadius*cos(angle+segmentAngle);
	yib=innerRadius*sin(angle+segmentAngle);
	xoa=outerRadius*cos(angle);
	yoa=outerRadius*sin(angle);
	xob=outerRadius*cos(angle+segmentAngle);
	yob=outerRadius*sin(angle+segmentAngle);
	xea=externalRadius*cos(angle);
	yea=externalRadius*sin(angle);
	xeb=externalRadius*cos(angle+segmentAngle);
	yeb=externalRadius*sin(angle+segmentAngle);

	zm=s/2-s*angle/360;
	zo=zm+s/2;
	zu=zm-s/2;
	polyhedron(
		points=[
			[xoa,yoa,zo], // 0
			[xia,yia,zm], // 1
			[xoa,yoa,zu],// 2
			[xob,yob,zo], // 3
			[xib,yib,zm], // 4
			[xob,yob,zu], // 5
			[xea,yea,zo], // 6
			[xeb,yeb,zo], // 7
			[xea,yea,zu], // 8
			[xeb,yeb,zu] // 9
		],
		triangles=[
			[0,1,2], // left
			[5,4,3], // right
			[0,3,1], // upper inner
			[3,4,1],	 // upper outer
			[1,5,2], // lower outer
			[4,5,1], // lower inner
			//[2,3,0], // back upper
			//[5,3,2], // back lower
			[6,7,0], // top outer
			[0,7,3], // top inner
			[2,9,8], // bottom outer
			[2,5,9], // bottom inner
			[6,0,8], // left upper
			[8,0,2], // left lower
			[3,7,9], // right upper
			[5,3,9], // right lower
			[8,7,6], // back upper
			[9,7,8], // back lower
		]
	);
}

module winding(innerRadius,outerRadius,externalRadius,segments,s,n){
	for(a=[0:360/segments:n*360]){
		block(
			innerRadius=innerRadius,
			outerRadius=outerRadius,
			externalRadius=externalRadius,
			angle=a,
			segments=segments,
			s=1
		);
	}
}

module thread(innerRadius,outerRadius,externalRadius,segments,s,n){
	difference(){
		winding(innerRadius=innerRadius,outerRadius=outerRadius,externalRadius=externalRadius,segments=segments,s=s,n=n);
		translate([0,0,s])
			cylinder(r=2*externalRadius,h=2*s,center=true);
		translate([0,0,-s*n+1])
			cylinder(r=2*externalRadius,h=2*s,center=true);
	}
}

/*
winding(
	innerRadius=28.6,
	outerRadius=29.6,
	externalRadius=35,
	angle=0,
	segments=36,
	s=1.1,
	n=10
);
*/

thread(
	innerRadius=28.6,
	outerRadius=29.6,
	externalRadius=35,
	segments=36,
	s=1.1,
	n=10
);