/* 
 * Base for SAO Dev Board
 *
 * Design: hxr.social/@thomasflummer
 *
 * License: CC-BY-SA
 *
 */

module pcb_base(width, length, pcb_thickness, corner_radius, height)
{
    difference()
    {
        union()
        {
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height/2])
                            cylinder(r = corner_radius + 2, h = height, center = true, $fn = 150);
                    }
                }

                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height/2])
                            cylinder(r = corner_radius + 2 + 0.5, h = height-1, center = true, $fn = 150);
                    }
                }
            }        
        }
        union()
        {
            // PCB cutout
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height - pcb_thickness/2])
                            cylinder(r = corner_radius + 0.4, h = pcb_thickness + 0.01, center = true, $fn = 150);
                    }
                }
            }

            // insert cutouts
            for(x = [-1, 1])
            {
                for(y = [-1, 1])
                {
                    translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height - (height-2)/2])
                        cylinder(d = 3.3, h =  height-2, center = true, $fn = 50);
                }
            }
            
            // space for PTH
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - 3 - 2), y*(width/2 - 3 - corner_radius*2), height - (height-2)/2])
                            cylinder(r = 3, h = height-2, center = true, $fn = 150);
                    }
                }
            }

            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - 3 - corner_radius*2), y*(width/2 - 3 - 2), height - (height-2)/2])
                            cylinder(r = 3, h = height-2, center = true, $fn = 150);
                    }
                }
            }
    
            difference()
            {
                translate([0, 0, height - (height-2)/2])
                    cube([length - corner_radius*2, width - corner_radius*2, height-2], center = true);

                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height - (height-2)/2])
                            cylinder(r = corner_radius, h =  height, center = true, $fn = 150);
                    }
                }
            }
            
            translate([length/2+0.2-3/2, -36.2, height - (height-2)/2])
                cube([3, 3, height-2], center = true);

            translate([length/2+0.2-3/2, -54, height - (height-2)/2])
                cube([3, 3, height-2], center = true);
            
        }
    }
    difference()
    {
        union()
        {
            translate([0, 0, (height - pcb_thickness)/2])
                cylinder(r = 15, h = height - pcb_thickness, center = true, $fn = 200);
        }
        union()
        {
            translate([0, 0, (height - pcb_thickness)/2])
                cylinder(r = 10, h = height, center = true, $fn = 200);
        }
    }
}

pcb_base(140, 140, 1.6, 5, 10);