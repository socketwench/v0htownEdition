include <./voidMantisSCAD/voidMantis.scad>
include <./v0printablePanels/splitMidPanel2/splitMidPanel2.scad>

Select = 0; // [0:Preview, 1:centerTop, 2:centerBottom]

module htownSplitMidPanel2_text() {
    let(fontSize=15) {
        rotate([0,0,90]) {
            translate([-fontSize*3.15,-fontSize*1.3,0])
                text("hackers.", size=fontSize, halign="right", font="Play");
            
            translate([0,-fontSize*1.28,0])
                text("town", size=fontSize, halign="right", font="Play:style=Bold");
        }
    }
}

module htownSplitMidPanel2_center() {
    difference() {
        splitMidPanel2_center();
        
        translate([0,170/2-5,2.6-0.4])
            linear_extrude(0.4)
                htownSplitMidPanel2_text();
        
        intersection() {
            translate([-30,-66,2.6-0.4])
                linear_extrude(0.4)
                    scale([0.15,0.15,0.15])
                        voidMantis(od=116.2, id=62, w=30);
            
            cube([59,170,2.6],anchor=BOTTOM);
        }
    }
}

module htownSplitMidPanel2_centerTop() {
    intersection() {
        htownSplitMidPanel2_center();
        splitMidPanel2_topCutout();
    }
}

module htownSplitMidPanel2_centerBottom() {
    intersection() {
        htownSplitMidPanel2_center();
        splitMidPanel2_bottomCutout();
    }
}

if (Select==0) {
    translate([0,1,0])
        htownSplitMidPanel2_centerTop();
    
    translate([0,-1,0])
        htownSplitMidPanel2_centerBottom();
} else if (Select==1) {
    htownSplitMidPanel2_centerTop();
} else if (Select==2) {
    htownSplitMidPanel2_centerBottom();
}
