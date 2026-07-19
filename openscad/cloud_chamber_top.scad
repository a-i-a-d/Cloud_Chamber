wall = 4;
gap = 0.2;
cooler_x = 121;
cooler_y = 46;
cooler_z = 25;
cooler_45 = 6;
cooler_gap_x = 2.6;
cooler_gap_y = 17;
cooler_pins_offset_x = 10;
cooler_pins_z = 10;
fan_x = 120;
fan_y = 25;
fan_z = 25;
fan_hook_x = 1;
fan_hook_y = 4;
minkovsky_offset=(sqrt(pow(cooler_45,2)+pow(cooler_45,2)))/2;

cooler_case();

module cooler_case()
{
    difference()
    {
        cube([cooler_x+2*wall,cooler_y+fan_y,cooler_z+wall]);
        translate([wall,0,wall])
        {
            cooler();
        }
        translate([wall-abs(cooler_x-fan_x)/2,cooler_y,wall])
        {
            fan();
        }
    }
}

module fan()
{
    cube([fan_x,fan_y,fan_z]);
    translate([-fan_hook_x,fan_y-fan_hook_y,0])
    {
        cube([fan_x+2*fan_hook_x,fan_hook_y,fan_z]);
    }
}

module cooler()
{
    difference()
    {
        cooler_block();
        cooler_cutout();
    }
}

module cooler_block()
{
    // pins
    translate([cooler_pins_offset_x,0,0])
    {
        cube([cooler_x-2*cooler_pins_offset_x,cooler_y,cooler_pins_z]);
    }
    // cooler    
    translate([minkovsky_offset-gap,-gap,cooler_pins_z])
    {
        minkowski()
        {
            cube([cooler_x-2*minkovsky_offset+2*gap,cooler_y-2*minkovsky_offset+2*gap,(cooler_z-cooler_pins_z)/2]);
            rotate([0,0,45])
            {
                cube([cooler_45,cooler_45,(cooler_z-cooler_pins_z)/2]);
            }
        }
    }
}

module cooler_cutout()
{
    for(i=[-gap,cooler_x-cooler_gap_x])
    {
        translate([i,(cooler_y-cooler_gap_y)/2-gap,0])
        {
            cube([cooler_gap_x+gap,cooler_gap_y+gap,cooler_z]);
        }
    }
}