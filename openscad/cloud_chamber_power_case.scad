$fn=128;

part = "lower";
//part = "upper";

power_x = 230;
power_y = 116;
power_z = 30;
power_screw_dia = 4.6;
power_screw_x = 150;
power_screw_y = 50;
power_screw_off_x = 32;
power_screw_off_y = 33;
power_addon_y = 60;
power_addon_x = 5;

case_wall = 4.6;

dcdc_x = 60;
dcdc_y = 52;
dcdc_z = 31;
dcdc_screw_dia = 3;
dcdc_screw_x = 53;
dcdc_screw_y = 38.5;
dcdc_screw_off_x = 3;
dcdc_screw_off_y = 5.8;

dclow_x = 51;
dclow_y = 23;
dclow_z = 1;
dclow_screws = [[40.5,3.2,0],[7.25,20,0]];
dclow_screw_dia = 3.2;

wagobase_x = 17;
wagobase_y = 30;
wagobase_z = 10;

plug_outside_x = 45;
plug_x = 30;
plug_y = 31.4;
plug_z = 52;
plug_screw_dist = 35;
plug_screw_dia = 3;

power_switch_z = 30;
power_switch_y = 32;
power_switch_x = 22;

voltage_display_x = 10.4;
voltage_display_y = 22.8;
voltage_display_z = 7;
voltage_display_screw_dia = 2.6;
voltage_display_screws = [[5.5,-1.8],[5.5,24.7]];

switch_low_x = 12.6;
switch_low_y = 20;
switch_low_z = 20;
switch_low_gap = 2.5;

air_gap_width = 3;

screw_block_screw_dia = 3.2;
screw_block_x = screw_block_screw_dia+5;
screw_block_y = screw_block_x;
screw_block_z = screw_block_x;

cables_fan_dia = 6;

power_addon_z = case_wall + screw_block_z + 5;
case_y = power_y + power_addon_y;
case_z = power_z + power_addon_z;
case_x = power_x + power_addon_x;


power_loc = [case_wall+5,screw_block_y+1,0];
plug_loc = [case_x+3+2*case_wall,case_y-plug_outside_x-5,plug_y+case_wall+1];
plug_rot = [270,0,90];
wagobase_loc = [case_x-power_switch_x+case_wall-plug_z-wagobase_x-18,case_y-wagobase_y+case_wall-10,0];
dclow_loc1 = [case_x-power_switch_x+case_wall-plug_z-40,case_y-dclow_x+case_wall-1,0];
dclow_loc2 = [case_x-power_switch_x+case_wall-plug_z-42-dclow_y,case_y-dclow_x+case_wall-1,0];
dclow_loc3 = [case_x-power_switch_x+case_wall-plug_z-44-2*dclow_y,case_y-dclow_x+case_wall-1,0];
dclow_loc4 = [case_x-power_switch_x+case_wall-plug_z-46-3*dclow_y,case_y-dclow_x+case_wall-1,0];
power_switch_loc = [case_x-power_switch_x+case_wall-plug_z,case_y-power_switch_y+2*case_wall,2*case_wall];
dcdc_loc1 = [case_x+2*case_wall-dcdc_x-10,(case_y+2*case_wall-dcdc_y)/2-dcdc_y/2-10,case_z+case_wall];
dcdc_loc2 = [case_x+2*case_wall-dcdc_x-10,(case_y+2*case_wall-dcdc_y)/2+dcdc_y/2+10,case_z+case_wall];
voltage_display_loc1 = [case_wall+switch_low_gap+screw_block_x,
                        -1.8+case_y-voltage_display_y,
                        case_z+2*case_wall-voltage_display_z];
voltage_display_loc2 = [case_wall+switch_low_x+(2*switch_low_gap)+screw_block_x,
                        -1.8+case_y-voltage_display_y,
                        case_z+2*case_wall-voltage_display_z];
switch_low_loc1 = [case_wall+switch_low_gap+screw_block_x,
                   -1.8-voltage_display_y+case_y-switch_low_y-case_wall,
                   case_z+2*case_wall-switch_low_z];
switch_low_loc2 = [case_wall+switch_low_x+(2*switch_low_gap)+screw_block_x,
                   -1.8-voltage_display_y+case_y-switch_low_y-case_wall,
                   case_z+2*case_wall-switch_low_z];
switch_low_loc3 = [case_wall+2*switch_low_x+(3*switch_low_gap)+screw_block_x,
                   case_y-switch_low_y,
                   case_z+2*case_wall-switch_low_z];
switch_low_loc4 = [case_wall+3*switch_low_x+(4*switch_low_gap)+screw_block_x,
                   case_y-switch_low_y,
                   case_z+2*case_wall-switch_low_z];
switch_low_loc5 = [case_wall+4*switch_low_x+(5*switch_low_gap)+screw_block_x,
                   case_y-switch_low_y,
                   case_z+2*case_wall-switch_low_z];
                   
cables_fan_loc = [94,case_y+2*case_wall-20,case_z];
switch_underplate_x = 5*(switch_low_x+switch_low_gap);
switch_underplate_y = switch_low_y+voltage_display_y+3*case_wall+2;
switch_underplate_z = case_wall;
switch_underplate_loc = [case_wall+screw_block_x,case_y-switch_underplate_y+case_wall+0.1,case_z];


if(part=="lower")
{
    lower_case();
    %upper_case();
}
if(part=="upper")
{
    %lower_case();
    upper_case();
}
if(part=="parts")
{
    screw_block(negative=true);
    screw_block(negative=false);
}

module upper_case()
{
    difference()
    {
        union()
        {
            // front
            cube([case_wall,case_y+2*case_wall,case_z+case_wall]);
            // top
            translate([0,0,case_z+case_wall])
            {
                cube([case_x+2*case_wall,case_y+2*case_wall,case_wall]);
                // indents left and right
                for(i=[case_wall+screw_block_x+1,case_x/2+screw_block_x+1])
                {
                    translate([i,case_wall,-case_wall])
                    {
                        difference()
                        {
                            cube([case_x/2-screw_block_x-case_wall-2,case_y,case_wall]);
                            translate([0,case_wall,0])
                            {
                                cube([case_x/2-screw_block_x-case_wall-2,case_y-2*case_wall,case_wall]);
                            }
                        }
                    }
                }
                // reenforcments
                for(i=[screw_block_y+1:
                       (case_y+case_wall-2*screw_block_y-2)/6:
                       case_y+2*case_wall])
                {
                    translate([0,i,-case_wall])
                    {
                        #cube([case_x+2*case_wall-screw_block_x-1,case_wall,case_wall]);
                    }
                }
            }
        }
        place_parts(negative=true);
        air_gaps();
    }
}


module lower_case()
{
    difference()
    {
        union()
        {   
            translate([case_wall,0,0])
            {
                difference()
                {
                    cube([case_x,case_y,case_z]+[case_wall,2*case_wall,case_wall]);
                    translate([0,case_wall,case_wall])
                    {
                        cube([case_x,case_y,case_z]);
                    }
                }
            }
            reenforce_bars(offset=screw_block_x,length=case_x-case_wall-0.3);
            place_parts();
        }
        place_parts(negative=true);
    }
}

module place_parts(negative=false)
{
    translate(power_loc)
    {
        power(negative=negative);
    }
    translate(plug_loc)
    {
        rotate(plug_rot)
        {
            plug(negative=negative);
        }
    }
    translate(wagobase_loc)
    {
        wagobase(negative=negative);
    }
    for(i=[dclow_loc1,dclow_loc2,dclow_loc3,dclow_loc4])
    {
        translate(i)
        {
            dclow(negative=negative);
        }
    }
    translate(power_switch_loc)
    {
        power_switch(negative=negative);
    }
    for(i=[dcdc_loc1,dcdc_loc2])
    {    
        translate(i)
        {
            dcdc(negative=negative);
        }
    }
    for(i=[switch_low_loc1,switch_low_loc2,switch_low_loc3,switch_low_loc4,switch_low_loc5])
    {
        translate(i)
        {
            switch_low(negative=negative);
        }
    }
    for(i=[voltage_display_loc1,voltage_display_loc2])
    {
        translate(i)
        {
            voltage_display(negative=negative);
        }
    }
    translate(cables_fan_loc)
    {
        cables_fan(negative=negative);
    }
    translate(switch_underplate_loc)
    {
        switch_underplate(negative=negative);
    }
    place_text(negative=negative);
    place_screw_blocks(negative=negative);
}

module air_gaps()
{
    for(i=[2*case_wall:3*air_gap_width:power_y+power_loc[1]])
    {
        translate([0,i,2*case_wall])
        {
            #cube([case_wall,air_gap_width,case_z-2*case_wall]);
        }
    }
}

module place_screw_blocks(negative=false)
{
    //front row
    for(i=[0,power_y+power_loc[1]+1,case_y+2*case_wall-screw_block_y])
    {
        translate([case_wall,i,screw_block_x])
        {
            rotate([0,90,0])
            {
                screw_block(negative=negative);
            }
        }
    }
    //back row
    for(i=[0,power_y+power_loc[1]+1,case_y+2*case_wall-screw_block_y])
    {
        translate([case_x-screw_block_x+2*case_wall,i+screw_block_y,case_z+case_wall])
        {
            rotate([180,0,0])
            {
                screw_block(negative=negative);
            }
        }
    }
    //right side
    for(i=[screw_block_x+case_wall,screw_block_x+case_x/2])
    {
        translate([i,screw_block_y,case_z+case_wall])
        {
            rotate([0,180,90])
            {
                screw_block(negative=negative);
            }
        }
    }
    //right side
    for(i=[case_wall,case_x/2])
    {
        translate([i,-screw_block_y+case_y+2*case_wall,case_z+case_wall])
        {
            rotate([0,180,270])
            {
                screw_block(negative=negative);
            }
        }
    }
}

module place_text(negative=false)
{
    if(negative==true)
    {
        translate(switch_low_loc1+[2,-4,switch_low_z-case_wall/5])
        {
            linear_extrude(height=case_wall*5)
            {
                rotate([0,0,270])
                {
                    #text("upper Peltier", font = "Liberation Sans:style=Bold", size=6);
                }
            }
        }
        translate(switch_low_loc2+[2,-4,switch_low_z-case_wall/5])
        {
            linear_extrude(height=case_wall*5)
            {
                rotate([0,0,270])
                {
                    #text("lower Peltier", font = "Liberation Sans:style=Bold", size=6);
                }
            }
        }
        translate(switch_low_loc3+[2,-4,switch_low_z-case_wall/5])
        {
            linear_extrude(height=case_wall*5)
            {
                rotate([0,0,270])
                {
                    #text("Heating", font = "Liberation Sans:style=Bold", size=6);
                }
            }
        }
        translate(switch_low_loc4+[2,-4,switch_low_z-case_wall/5])
        {
            linear_extrude(height=case_wall*5)
            {
                rotate([0,0,270])
                {
                    #text("Light", font = "Liberation Sans:style=Bold", size=6);
                }
            }
        }
        translate(switch_low_loc5+[2,-4,switch_low_z-case_wall/5])
        {
            linear_extrude(height=case_wall*5)
            {
                rotate([0,0,270])
                {
                    #text("High Voltage", font = "Liberation Sans:style=Bold", size=6);
                }
            }
        }
        
    }
}

module reenforce_bars(gap=2*case_wall,width=case_y,length=case_x,offset=0)
{
    for(i=[offset:2*case_wall+gap:case_y-offset])
    {
        translate([case_wall,i,case_wall])
        {
            bar();
        }
    }

    module bar(len=length)
    {
        translate([case_x,2*case_wall,0])
        {
            rotate([90,0,270])
            {
                linear_extrude(len)
                {
                    polygon([[0,0],[2*case_wall,0],[1.5*case_wall,0.5*case_wall],[0.5*case_wall,0.5*case_wall]]);
                }
            }
        }
    }
}

module power_switch(negative=false)
{
    if(negative==false)
    {
        %cube([power_switch_x,power_switch_y,power_switch_z]);
    }
    if(negative==true)
    {
        #cube([power_switch_x,power_switch_y,power_switch_z]);
    }
}

module power(negative=false)
{
    if(negative==false)
    {
        translate([0,0,2*case_wall])
        {
            %cube([power_x,power_y,power_z]);
        }
        place_screws(power_screw_x,power_screw_y,power_screw_off_x,power_screw_off_y,case_wall)
        {
            cylinder(h=case_wall,d1=3*power_screw_dia,d2=2*power_screw_dia);
        }
    }
    
    if(negative==true)
    {
        place_screws(power_screw_x,power_screw_y,power_screw_off_x,power_screw_off_y,0)
        {
            #cylinder(h=2*case_wall,d=power_screw_dia);
            #cylinder(h=case_wall,d=2*power_screw_dia);
        }
    }
    
}

module cables_fan(negative=false)
{
    if(negative==false)
    {
        %cylinder(d=cables_fan_dia,h=2*case_wall);
    }
    if(negative==true)
    {
        #cylinder(d=cables_fan_dia,h=2*case_wall);
    }
}

module switch_low(negative=false)
{
    if(negative==false)
    {
        %cube([switch_low_x,switch_low_y,switch_low_z]);
    }
    if(negative==true)
    {
        #cube([switch_low_x,switch_low_y,switch_low_z]);
    }
}

module voltage_display(negative=false)
{
    if(negative==false)
    {
        %cube([voltage_display_x,voltage_display_y,voltage_display_z]);
    }
    if(negative==true)
    {
        #cube([voltage_display_x,voltage_display_y,voltage_display_z]);
        for(i=voltage_display_screws)
        {
            translate(i)
           {
               #cylinder(d=voltage_display_screw_dia,h=voltage_display_z);
           }
        }
    }
}

module dcdc(negative=false)
{
    if(negative==false)
    {
        translate([0,0,case_wall])
        {
            %cube([dcdc_x,dcdc_y,dcdc_z]);
        }
    }
    
    if(negative==true)
    {
        place_screws(dcdc_screw_x,dcdc_screw_y,dcdc_screw_off_x,dcdc_screw_off_y,-case_wall)
        {
            cylinder(d=dcdc_screw_dia,h=2*case_wall);
        }
        for(i=[10,dcdc_y-10])
        {
            translate([dcdc_x+2,i,-case_wall])
            {
                cylinder(d=4,h=2*case_wall);
            }
        }
        for(i=[10,dcdc_y-10])
        {
            translate([-2,i,-case_wall])
            {
                cylinder(d=4,h=2*case_wall);
            }
        }
    }
    
}

module switch_underplate(negative=false)
{
    if(negative==false)
    {
        %cube([switch_underplate_x,switch_underplate_y,switch_underplate_z]);
    }
    if(negative==true)
    {
        #cube([switch_underplate_x,switch_underplate_y,switch_underplate_z]);
    }
}

module dclow(negative=false)
{
    rotate([0,0,90])
    {
        if(negative==true)
        {
            for(i=dclow_screws)
            {
                translate(i)
                {
                    #cylinder(d=dclow_screw_dia,h=2*case_wall);
                    #cylinder(d=2.4*dclow_screw_dia,h=case_wall);
                }
            }
        }
        if(negative==false)
        {
            translate([0,0,2*case_wall])
            {
                %cube([dclow_x,dclow_y,dclow_z]);
            }
            for(i=dclow_screws)
            {
                translate(i+[0,0,case_wall])
                {
                    cylinder(d1=3.4*dclow_screw_dia,d2=2*dclow_screw_dia,h=case_wall);
                }
            }
        }
    }
}

module wagobase(negative=false)
{
    if(negative==false)
    {
        cube([wagobase_x,wagobase_y,wagobase_z]);
    }
    if(negative==true)
    {
    }
}

module plug(negative=false)
{
    rotate([0,0,0])
    {
        if(negative==false)
        {
            translate([(plug_outside_x-plug_x)/2,0,0])
            {
                %cube([plug_x,plug_y,plug_z]);
            }
            %cube([plug_outside_x,plug_y,3]);
        }
        
        if(negative==true)
        {
            translate([(plug_outside_x-plug_x)/2,0,0])
            {
                #cube([plug_x,plug_y,plug_z]);
            }
            
            translate([(plug_outside_x-plug_screw_dist)/2,plug_y/2,3])
            {
                #cylinder(d=plug_screw_dia,h=case_wall);
                translate([plug_screw_dist,0,0])
                {
                    #cylinder(d=plug_screw_dia,h=case_wall);
                }
            }
        }
    }
}

module screw_block(negative=false)
{
    translate([0,screw_block_y,0])
    {
        if(negative==false)
        {
            rotate([90,0,0])
            {
                linear_extrude(screw_block_y)
                {
                    polygon([[0,0],[screw_block_x,0],[screw_block_x,screw_block_z+screw_block_z],[0,screw_block_z]]);
                }
            }
        }
        
        if(negative==true)
        {
            translate([screw_block_x/2,-screw_block_y/2,0])
            {
                #cylinder(h=screw_block_z,d=screw_block_screw_dia+1.2);
                translate([0,0,-case_wall-1])
                {
                    #cylinder(h=case_wall+1.5,d=screw_block_screw_dia);
                    #cylinder(h=case_wall/2+1,d=2*screw_block_screw_dia);
                }
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

