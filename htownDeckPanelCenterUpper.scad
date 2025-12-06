include <./voidMantisSCAD/voidMantis.scad>

include <./v0printablePanels/deckPanel/deckPanel.scad>

union() {
    deckPanel_centerUpperBlank();

    linear_extrude(6)
        scale([0.08,0.08,0.08])
            voidMantis();
}