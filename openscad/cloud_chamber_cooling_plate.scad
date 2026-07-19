$fn=32;

part="main_body";
//part="insulation_top";
//part="insulation_stencil_copper";
//part="insulation_stencil_peltier";


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

if(part=="main_body")
{
    main_body();
    %insulation_top();
}

if(part=="insulation_top")
{
    %main_body();
    insulation_top();
}

if(part=="insulation_stencil_peltier")
{
    %main_body();
    %insulation_top();
    insulation_stencil_peltier();
}
    
if(part=="insulation_stencil_copper")
{
    %main_body();
    %insulation_top();
    insulation_stencil_copper();    
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