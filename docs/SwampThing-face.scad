$fn = 80;

$vpr = [0, 0, 0];
$vpt = [0, 0, 0];
$vpd = 300;

t = 3;
w = 272;
h = 80;

ts = 1.6;

ho = 4;

module hole(thick)
{
    cylinder(t+1, thick/2, thick/2);
}

module usb_pcb()
{
    uw = 30;
    uh = 28;

    ux = 15;
    uy = 10;
	
    translate([ux + ho, uy + ho])
        hole(3);
    translate([ux + uw - ho, uy + uh - ho])
        hole(3);
    translate([ux + ho, uy + uh - ho])
        hole(3);
    translate([ux + uw - ho, uy + ho])
        hole(3);

	usbw = 12;
	usbh = 11.5;

	usbx = 9;
	usby = 12.5 - 8;

	open_off = 0.3;
	
    translate([ux + usbx - open_off, uy + usby - open_off])
        cube(usbw + open_off*2, usbh + open_off*2, 10);
}

module main_pcb()
{
	pw = 100;
	ph = 60;

    px = 55;
    py = (h - ph) / 2;

    translate([px + ho, py + ho])
        hole(3);
    translate([px + pw - ho, py + ph - ho])
        hole(3);
    translate([px + ho, py + ph - ho])
        hole(3);
    translate([px + pw - ho, py + ho])
        hole(3);

	// board ref point
	bx = 55;
	by = 90;
	
	// gain selector
	gainx = 100.965 - bx;
	gainy = by - 40.64;

	translate([px + gainx, py + gainy])
		hole(6);

	// reset button
	resetx = 97.79 - bx;
	resety = by - 57.785 - 3;

	translate([px + resetx, py + resety])
		hole(6.5);
		
	// power led
	powledx = 91.44 - bx;
	powledy = by - 83.185;
	
	translate([px + powledx, py + powledy])
		hole(5.5);

	// power led
	csrledx = 64.135 - bx;
	csrledy = by - 66.04;
	
	translate([px + csrledx, py + csrledy])
		hole(5.5);
		
	// otw/clip led
	otwledx = 116.84 - bx;
	otwledy = by - 34.29;
	
	translate([px + otwledx, py + otwledy])
		hole(5.5);

	// fault led
	fltledx = 116.84 - bx;
	fltledy = by - 46.99;
	
	translate([px + fltledx, py + fltledy])
		hole(5.5);
}

module board()
{
    cube(size = [w, h, t]);
}

module screws()
{
	translate([w - ho, h - ho])
		hole(3);
	translate([ho, h - ho])
		hole(3);
	translate([w - ho, ho])
		hole(3);
	translate([ho, ho])
		hole(3);
		
	translate([w/4, ho])
		hole(3);
	translate([w/2, ho])
		hole(3);
	translate([w*.75, ho])
		hole(3);

	translate([w/4, h - ho])
		hole(3);
	translate([w/2, h - ho])
		hole(3);
	translate([w*.75, h - ho])
		hole(3);

	translate([ho, h/2])
		hole(3);
	translate([w - ho, h/2])
		hole(3);
}

module name()
{
	translate([w/2 + 40, h/2 + 10, 0])
		scale([ts,ts,ts])
			linear_extrude(t+1)
				union()
				{
					text("swamp", font = "Courier New:style=Bold Italic");
					translate([0, -12, 0])
						text("thing", font = "Courier New:style=Bold Italic");
				}
}

projection(cut = true)
	translate([-w/2, -h/2, -t/2])
		difference()
		{
			board();
			main_pcb();
			usb_pcb();
			screws();
			name();
		};
