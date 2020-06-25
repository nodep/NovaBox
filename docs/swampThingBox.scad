$fn = 100;

pcb_thick = 1.6;
thick = 3;
tooth_extra = 0.3;
pcb_space = 0.2;
outer_space = 2;
slot_len = 10;
slot_off = 20;
hborder = thick + pcb_space + outer_space;
lower_space = 5;
upper_space = 25;
inner_height = lower_space + pcb_thick + upper_space;
screw_distance = 92;
full_height = inner_height + thick * 2;

power_offset = 32.4;
power_width = 16;
power_height = 9;

usb_offset = 14;
usb_width = 13;
usb_height = 12;

ant_offset = -15;
ant_width = 14;
ant_height = 2;

spkl_offset = 33;
spkr_offset = 3.2;
spk_screw_offset = 4.6;
spk_screw_width = 9;
spk_screw_height = 10;
spk_width = 11;
spk_height = 11;

module wholes()
{
	translate([screw_distance/2, screw_distance/2, 0])
		cylinder(h = 200, r = 1.5, center = true);

	translate([-screw_distance/2, screw_distance/2, 0])
		cylinder(h = 200, r = 1.5, center = true);

	translate([screw_distance/2, -screw_distance/2, 0])
		cylinder(h = 200, r = 1.5, center = true);

	translate([-screw_distance/2, -screw_distance/2, 0])
		cylinder(h = 200, r = 1.5, center = true);
}

module pcb()
{
	difference()
	{
		translate([0, 0, -(pcb_thick / 2)])
			cube([100, 100, pcb_thick], center = true);

		wholes();
	}
}

module bottom()
{
	difference()
	{
		difference()
		{
			cube([100 + hborder * 2, 100 + hborder * 2, thick], center = true);
			
			wholes();
		}

		rotate([90, 0, 0])
			translate([0, -thick/2 + tooth_extra / 2, 50 + pcb_space + thick / 2])
				empty_side();

		rotate([90, 0, 0])
			translate([0, -thick/2 + tooth_extra / 2, -50 - pcb_space - thick / 2])
				empty_side();
				
		rotate([90, 0, 90])
			translate([0, -thick/2 + tooth_extra / 2, 50 + pcb_space + thick / 2])
				power_side();

		rotate([90, 0, 90])
			translate([0, -thick/2 + tooth_extra / 2, -(50 + pcb_space + thick / 2)])
				speaker_side();
	}
}

module top()
{
	difference()
	{
		bottom();
		
		translate([-50 + 1, -spk_screw_height/2 - spkl_offset, -thick])
			cube([spk_screw_width, spk_screw_height, thick*2]);

		translate([-50 + 1, -spk_screw_height/2 - spkr_offset, -thick])
			cube([spk_screw_width, spk_screw_height, thick*2]);
	}
}

module teeth_cutouts(offy)
{
	translate([-100, offy, -thick])
		cube([100 - slot_len - slot_off, thick + tooth_extra, thick*2]);

	translate([-slot_off, offy, -thick])
		cube([slot_off * 2, thick + tooth_extra, thick*2]);

	translate([slot_off + slot_len, offy, -thick])
		cube([100 - slot_len - slot_off, thick + tooth_extra, thick*2]);
}

module empty_side()
{
	difference()
	{
		translate([-50, -tooth_extra, -thick/2])
			cube([100, inner_height + (thick + tooth_extra) * 2, thick + tooth_extra]);

		teeth_cutouts(-tooth_extra);
		teeth_cutouts(inner_height + thick);
	}
}

module power_cutouts()
{
	// XT60
	translate([-power_width/2 + power_offset, thick + tooth_extra + lower_space + pcb_thick, -thick/2])
		cube([power_width, power_height, thick *2]);

	// USB
	translate([-usb_width/2 + usb_offset, thick + tooth_extra + lower_space + pcb_thick, -thick/2])
		cube([usb_width, usb_height, thick*2]);

	// antenna
	translate([-ant_width/2 + ant_offset, thick + tooth_extra + lower_space + pcb_thick - ant_height/2, -thick/2])
		cube([ant_width, ant_height, thick*2]);
		
	// teeth
	teeth_cutouts(-tooth_extra);
	teeth_cutouts(inner_height + thick);
}

module power_side()
{
	difference()
	{
		translate([-50 - hborder, -tooth_extra, -thick/2])
			cube([100 + hborder * 2, inner_height + (thick + tooth_extra) * 2, thick + tooth_extra]);

		power_cutouts();
	}
}

module speaker_side_cutouts()
{
	// left
	translate([-spk_width/2 - spkl_offset, thick + tooth_extra + lower_space + pcb_thick, -thick/2])
		cube([spk_width, spk_height, thick *2]);

	// right
	translate([-spk_width/2 - spkr_offset, thick + tooth_extra + lower_space + pcb_thick, -thick/2])
		cube([spk_width, spk_height, thick *2]);

	// teeth
	teeth_cutouts(-tooth_extra);
	teeth_cutouts(inner_height + thick);
}

module speaker_side()
{
	difference()
	{
		translate([-50 - hborder, -tooth_extra, -thick/2])
			cube([100 + hborder * 2, inner_height + (thick + tooth_extra) * 2, thick + tooth_extra]);

		speaker_side_cutouts();
	}
}

//# translate([0, 0, 10]) pcb();

//projection(cut = true)
{
	bottom();

	translate([0, -115, 0])
//	translate([0, 0, inner_height + thick + tooth_extra])
		top();

	translate([0, 50 + hborder + 5, 0])
		empty_side();

	translate([0, 50 + hborder + full_height + 10, 0])
		empty_side();

	translate([0, 50 + hborder + full_height*2 + 15, 0])
		power_side();

	translate([0, 50 + hborder + full_height*3 + 20, 0])
		speaker_side();

/*		
		rotate([90, 0, 0])
			translate([0, -thick/2 + tooth_extra / 2, 50 + pcb_space + thick / 2])
				empty_side();

		rotate([90, 0, 0])
			translate([0, -thick/2 + tooth_extra / 2, -50 - pcb_space - thick / 2])
				empty_side();

		rotate([90, 0, 90])
			translate([0, -thick/2 + tooth_extra / 2, 50 + pcb_space + thick / 2])
				power_side();

		rotate([90, 0, 90])
			translate([0, -thick/2 + tooth_extra / 2, -50 - pcb_space - thick / 2])
				speaker_side();
*/		
}
