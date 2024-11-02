/* 
 * Navigation knob for SAO Dev Board
 *
 * Design: hxr.social/@thomasflummer
 *
 * License: CC-BY-SA
 *
 */

module knob()
{
    difference()
    {
        union()
        {
            start = 6;
            end = 17;
            res = 100;

            for(i = [0:30])
            {
                prev = start - (cos(6*(i+1))*-1 +1)/2 * (start-end);
                current = start - (cos(6*(i))*-1 +1)/2 * (start-end);
                hull()
                {
                    translate([0, 0, 0])
                    translate([0, 0, i*1/4])
                        cylinder(r=current/2, h=0.001,  center = true, $fn = res);

                    translate([0, 0, 0])
                    translate([0, 0, (i+1)*1/4])
                        cylinder(r=(prev)/2, h=0.001,  center = true, $fn = res);
                }
            }
            
            hull()
            {
                translate([0, 0, 7.6])
                rotate_extrude($fn = 100)
                translate([17/2 - 1, 0, 0])
                    circle(r = 1, $fn = 30);
            }            
        }
        union()
        {
            cube([3.2, 3.2, 6], center = true);
            
            translate([0, 0, 7.6 + 20 - 0.6])
                sphere(r = 20, $fn = 300);
        }
    }
}

knob();