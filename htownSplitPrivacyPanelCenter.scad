include <./voidMantisSCAD/voidMantis.scad>

include <./v0printablePanels/splitPrivacyPanel/splitPrivacyPanel.scad>

difference() {
    splitPrivacyPanel_centerBlank();

    translate([0,0,2.6-0.4])
        linear_extrude(0.4)
            scale([0.026,0.026,0.026])
                    voidMantis();
}