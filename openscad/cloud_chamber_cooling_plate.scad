$fn=256;

part="main_body";
//part="insulation_top";
//part="insulation_stencil_copper";
//part="insulation_stencil_peltier";
//part="light_connector";
//part="led_carrier";

gap = 0.2; // gap for better fitting

// cooling plate
peltier_x = 40;
peltier_y = peltier_x;

plate_height = 2;
cooling_tower_height = 11;

copper_x = 51.2;
copper_y = copper_x;

rim_width = 2.2;
rim_height = 1;

insulation_width = 8;
insulation_screw_dia = 2;

cable_distance = 36;
cable_dia = 2.4;

// insulation top
insulation_top_z = 0.6;
insulation_top_addon_z = 1;

// fan connection screws
screw_dist = 75;
screw_dia  = 4.2;
screw_height = 6;
screw_block_height = 7.5;

// acrylic cover values
cover_x = 78.6;
cover_y = 78.6;
cover_z = 5; // how deep the gap for the cover will be
cover_wall = 1.7; // how wide the gap for the cover will be

// stencil
stencil_height = 2;

// light connector
led_dia = 30;
led_x = 37;
led_screw_dia = 3;
led_screw_dist = 23;
lconnector_wall = 2;
lconnector_x = 10;
lightsloc_x = 10;
lightsloc_z = 10;
lights_y = 65;
lconnector_box_height = 50;


// calculated values
outside_x = max((screw_dist + 2*screw_dia),cover_x+2);
outside_y = max((screw_dist + 2*screw_dia),cover_y+2);
outside_height = cooling_tower_height-1;

cover_offset_x = (outside_x-cover_x)/2;
cover_offset_y = (outside_y-cover_y)/2; 

screw_off_x = (2*screw_dia)/2;
screw_off_y = screw_off_x;

insulation_screw_height = outside_height-cover_z;
insulation_screw_dist_x = screw_dist;
insulation_screw_dist_y = insulation_screw_dist_x - 2*(2.5*screw_dia);
insulation_screw_off_x = max(screw_off_x,(outside_x-insulation_screw_dist_x)/2);
insulation_screw_off_y = max(screw_off_x+2.5*screw_dia,(outside_y-insulation_screw_dist_y)/2);

outside_wall_width_x = (outside_x-copper_x)/2-insulation_width;
outside_wall_width_y = (outside_y-copper_y)/2-insulation_width;

lconnector_y = outside_y;
lconnector_z = outside_height/2;


if(part=="main_body")
{
    main_body();
    %led_carrier();
    %light_connector();
    %insulation_top();
}

if(part=="insulation_top")
{
    %main_body();
    %led_carrier();
    %light_connector();
    insulation_top();
}

if(part=="insulation_stencil_peltier")
{
    %main_body();
    %insulation_top();
    %led_carrier();
    %light_connector();
    insulation_stencil_peltier();
}
    
if(part=="insulation_stencil_copper")
{
    %main_body();
    %insulation_top();
    %led_carrier();
    %light_connector();
    insulation_stencil_copper();    
}

if(part=="light_connector")
{
    %main_body();
    %insulation_top();
    %led_carrier();
    light_connector();
}

if(part=="led_carrier")
{
    %main_body();
    %insulation_top();
    led_carrier();
    %light_connector();
}

module light_connector()
{
    translate([outside_x,0,-lconnector_box_height+outside_height+lightsloc_z+1])
    {
        difference()
        {
            cube([lconnector_x,lconnector_y,lconnector_box_height-(outside_height/2+lightsloc_z+1)-2*gap]);
            translate([0,lconnector_wall,lconnector_wall])
            {
                cube([lconnector_x,
                      lconnector_y-2*lconnector_wall,
                      lconnector_box_height-(outside_height/2+lightsloc_z+1)-2*gap-lconnector_wall]);
            }
            translate([-sqrt(2*pow(lconnector_wall,2))/2,
                           0,
                           lconnector_box_height-1.5*outside_height-sqrt(2*pow(lconnector_wall,2))/2])
            {
                rotate([0,45,0])
                {
                    #cube([lconnector_wall,lconnector_y,lconnector_wall]);
                }
            }
        }
    }
    
    translate([outside_x,0,outside_height])
    {
        // connection
        difference()
        {
            hull()
            {
                cube([lconnector_x,lconnector_y,1]);
                translate([lightsloc_x,0,lightsloc_z])
                {
                    cube([lconnector_x,lconnector_y,1]);
                }
            }
            for(i=[-1,1])
            {
                translate([lconnector_x/2,lconnector_y/2+(i*(lconnector_y/2-10)),-outside_height+3])
                {                
                    cylinder(d=3.3,h=20);
                    translate([0,0,outside_height/2+5])
                    {
                        cylinder(d=7,h=10);
                    }
                }
            }
        }
        // case
        translate([lightsloc_x,0,lightsloc_z-lconnector_box_height+1])
        {
            difference()
            {
                union()
                {
                    cube([50,lconnector_y,lconnector_box_height]);
                    for(i=[-1,1])
                    {
                        translate([50,lconnector_y/2+i*(lconnector_y/2-8/2-1.2),8/2+10])
                        {
                            rotate([0,90,0])
                            {
                                cylinder(d1=8,d2=6,h=5);
                            }
                        }
                    }
                }
                
                for(i=[-1,1])
                {
                    translate([50-lconnector_wall,lconnector_y/2+i*(lconnector_y/2-8/2-1.2),8/2+10])
                    {
                        rotate([0,90,0])
                        {
                            cylinder(d1=3.2,h=5+lconnector_wall);
                        }
                    }
                }
                translate([0,lconnector_wall,lconnector_wall])
                {
                    cube([50-3*lconnector_wall,lconnector_y-2*lconnector_wall,lconnector_box_height-2*lconnector_wall]);
                    translate([50-2*lconnector_wall,0,-lconnector_wall])
                    {
                        cube([lconnector_wall+2*gap,lconnector_y-2*lconnector_wall,lconnector_box_height-lconnector_wall]);
                        translate([-2*lconnector_wall,(14/2)*1.2,-lconnector_wall])
                        {
                            cube([4.1*lconnector_wall,lconnector_y-17*1.2,lconnector_box_height-lconnector_wall]);
                        }
                        
                    }
                }
                translate([50-7.1*lconnector_wall,0,lconnector_box_height-5*lconnector_wall])
                {
                    #cube([4.1*lconnector_wall,lconnector_wall,2*lconnector_wall]);
                }
            }
        }
    }
}

module led_carrier()
{
    translate([outside_x,0,outside_height])
    {
        translate([lightsloc_x+50-2*lconnector_wall+gap,lconnector_wall+gap,lightsloc_z-lconnector_box_height+1-5])
        {
            difference()
            {
                cube([lconnector_wall-2*gap,lconnector_y-2*lconnector_wall-2*gap,lconnector_box_height-lconnector_wall+5]);
                // screw holes
                translate([-lconnector_wall,led_dia/2+8*1.2,lconnector_box_height-led_dia/2-5*1.2+5])
                {                        
                    rotate([0,90,0])
                    {
                        for(i=[-1,1])
                        {
                            translate([0,i*led_screw_dist/2,0])
                            {
                                cylinder(d=led_screw_dia,h=2*lconnector_wall);
                            }
                        }
                    }
                }
                translate([-lconnector_wall,lconnector_y-led_dia/2-11*1.2,lconnector_box_height-led_dia/2-5*1.2+5])
                {
                    rotate([0,90,0])
                    {
                        for(i=[-1,1])
                        {
                            translate([0,i*led_screw_dist/2,0])
                            {
                                cylinder(d=led_screw_dia,h=2*lconnector_wall);
                            }
                        }
                    }
                }
            }
            translate([-lconnector_wall,led_dia/2+8*1.2,lconnector_box_height-led_dia/2-5*1.2+5])
            {
                rotate([0,90,0])
                {
                    difference(){
                        cylinder(d=led_dia+1*1.2,h=lconnector_wall);
                        cylinder(d=led_dia,h=lconnector_wall);
                        translate([-5-led_dia/2,-5,0])
                        {
                            cube([10,10,lconnector_wall]);
                        }
                    }
                }
            }
            translate([-lconnector_wall,lconnector_y-led_dia/2-11*1.2,lconnector_box_height-led_dia/2-5*1.2+5])
            {
                rotate([0,90,0])
                {
                    difference(){
                        cylinder(d=led_dia+1*1.2,h=lconnector_wall);
                        cylinder(d=led_dia,h=lconnector_wall);
                        translate([-5-led_dia/2,-5,0])
                        {
                            cube([10,10,lconnector_wall]);
                        }
                        // screw holes
                        for(i=[-1,1])
                        {
                            translate([0,i*led_screw_dist/2,0])
                            {
                                cylinder(d=led_screw_dia,h=2*lconnector_wall);
                            }
                        }
                    }
                }
            }
        }
    }
}

module insulation_stencil_copper()
{
    difference()
    {
        translate([(outside_x-copper_x)/2-insulation_width+1*gap,(outside_y-copper_y)/2-insulation_width+1*gap,rim_height])
        {
            cube([copper_x+2*insulation_width-2*gap,copper_y+2*insulation_width-2*gap,stencil_height]);
        }
        translate([(outside_x-copper_x)/2-gap,(outside_y-copper_y)/2-gap,rim_height])
        {
            cube([copper_x+2*gap,copper_y+2*gap,stencil_height]);
        }
        
    }
}

module insulation_stencil_peltier()
{
    difference()
    {
        translate([(outside_x-copper_x)/2-insulation_width+1*gap,(outside_y-copper_y)/2-insulation_width+1*gap,rim_height])
        {
            cube([copper_x+2*insulation_width-2*gap,copper_y+2*insulation_width-2*gap,stencil_height]);
        }
        translate([(outside_x-peltier_x)/2-gap,(outside_y-peltier_y)/2-gap,rim_height])
        {
            cube([peltier_x+2*gap,peltier_y+2*gap,stencil_height]);
        }
    }
}

module insulation_top()
{
    difference()
    {
        insulation_cover();
        insulation_cover_cutout();
    }
}

module insulation_cover()
{
    translate([2*screw_dia+gap,0,outside_height])
    {
        cube([outside_x-4*screw_dia-2*gap,outside_y,insulation_top_z]);
    }
    translate([0,2*screw_dia+gap,outside_height])
    {
        cube([outside_x,outside_y-4*screw_dia-2*gap,insulation_top_z]);
    }
    translate([outside_wall_width_x+gap,outside_wall_width_y+gap,outside_height-insulation_top_addon_z])
    {
        cube([outside_x-2*outside_wall_width_x-2*gap,outside_y-2*outside_wall_width_y-2*gap,insulation_top_addon_z]);
    }
}

module insulation_cover_cutout()
{
    translate([outside_wall_width_x+insulation_width,
               outside_wall_width_y+insulation_width,
               outside_height-insulation_top_addon_z])
    {
        cube([outside_x-2*(outside_wall_width_x+insulation_width),
               outside_y-2*(outside_wall_width_y+insulation_width),
               insulation_top_z+insulation_top_addon_z]);
    }
    insulation_screw_holes(dia=insulation_screw_dia+0.3);
}

module lconnector()
{
    translate([outside_x,0,outside_height/2])
    {
        difference()
        {
            cube([lconnector_x,lconnector_y,lconnector_z]);
            for(i=[-1,1])
            {
                translate([lconnector_x/2,lconnector_y/2+(i*(lconnector_y/2-10)),0])
                {                
                    cylinder(d=3.3,h=20);
                    translate([0,0,outside_height/2+5])
                    {
                        cylinder(d=7,h=10);
                    }
                }
            }
        }
    }
}

module main_body()
{
    difference()
    {
        cube([outside_x,outside_y,outside_height]);
        cover_cutout();
        inner_cutout();
        insulation_screw_holes();
        cable_openings();
    }
    fan_connector_screw_blocks();
    lconnector();
}

module inner_cutout()
{
    translate([(outside_x-copper_x)/2,(outside_y-copper_y)/2,rim_height])
    {
        cube([copper_x,copper_y,outside_height-rim_height]);
    }
    translate([(outside_x-copper_x)/2+rim_width,(outside_y-copper_y)/2+rim_width,0])
    {
        cube([copper_x-2*rim_width,copper_y-2*rim_width,outside_height]);
    }
    translate([outside_wall_width_x,outside_wall_width_y,plate_height])
    {
        cube([copper_x+2*insulation_width,copper_y+2*insulation_width,outside_height-plate_height]);
    }
    
}
    
module cover_cutout()
{
    translate([cover_offset_x,cover_offset_y,0])
    {
        difference()
        {
            cube([cover_x,cover_y,cover_z]);
            translate([cover_wall,cover_wall,0])
            {
                cube([cover_x-2*cover_wall,cover_y-2*cover_wall,cover_z]);
            }
        }
    }
}

module insulation_screw_holes(dia=insulation_screw_dia)
{
    place_screws(insulation_screw_dist_x,insulation_screw_dist_y,insulation_screw_off_x,insulation_screw_off_y,cover_z+1)
    {
        cylinder(d=dia,insulation_screw_height+insulation_top_z);
    }
    place_screws(insulation_screw_dist_y,insulation_screw_dist_x,insulation_screw_off_y,insulation_screw_off_x,cover_z+1)
    {
        cylinder(d=dia,insulation_screw_height+insulation_top_z);
    }
}

module fan_connector_screw_blocks()
{
    place_screws(screw_dist,screw_dist,screw_off_x,screw_off_y,outside_height)
    {
        difference()
        {
            translate([-screw_dia,-screw_dia,0])
            {
                cube([2*screw_dia,2*screw_dia,screw_block_height]);
            }
            translate([0,0,screw_block_height-screw_height])
            {
                cylinder(d=screw_dia,screw_height);
            }
        }
    }
}

module cable_openings()
{
    for(i=[-cable_distance/2,-cable_distance/2+cable_dia+1,+cable_distance/2,+cable_distance/2-cable_dia-1])
    {
        translate([outside_x/2+i,0,cover_z+cable_dia/2+0.6])
        {
            rotate([270,0,0])
            {
                #cylinder(d=cable_dia,h=outside_wall_width_x);
            }
        }
    }
}

module place_screws(dist_x,dist_y,off_x,off_y,off_z)
{
    translate([off_x,off_y,off_z])
    {
        for(i=[[0,0],[dist_x,0],[0,dist_y],[dist_x,dist_y]])
        {
            translate([i[0],i[1],0])
            {
                children([0:$children-1]);
            }
        }
    }
}