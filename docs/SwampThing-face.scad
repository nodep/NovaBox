t = 3;
w = 300;
h = 70;

pw = 100;
ph = 60;

ts = 1.4;

module hole(thick)
{
    cylinder(t+1, thick/2, thick/2);
}

module pcb()
{
    px = 20;
    py = 5;
    
    translate([px + 3, py + 3])
        hole(3);
    translate([px + pw - 3, py + ph - 3])
        hole(3);
    translate([px + 3, py + ph - 3])
        hole(3);
    translate([px + pw - 3, py + 3])
        hole(3);

	sx = 100.965 - 55;
	sy = 90 - 40.64;

	translate([px + sx, py + sy])
		hole(6);
}

module board()
{
    cube(size = [w, h, t]);
}

module name()
{
	translate([w/2, h/2, 0])
		scale([ts,ts,ts])
			linear_extrude(t+1)
				text("swamp thing", font = "Courier New:style=Bold Italic");
}

translate([-w/2, -h/2, -t/2])
		difference()
		{
			board();
			pcb();
			//name();
		};

//projection(cut = true)    board();
    
