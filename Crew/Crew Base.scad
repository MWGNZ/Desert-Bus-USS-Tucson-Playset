$fn=100;

module leg() {
	resize([4.5,6,11]) cylinder(h=10, r1=2, r2=3);
}

module legs() {
	translate([-2,0,0])
		leg();
	translate([2,0,0])
		leg();
}

module foot() {
	intersection() {
		union() {
			rotate([90,0,0])
				cylinder(h=3, r=2);
			translate([0,-3,0])
				sphere(r=2);
			sphere(r=2);
		}
		translate([0,0,5])
			cube(10, true);
	}
}

module foots() {
	translate([-2,.5,0])
		foot();
	translate([2,.5,0])
		foot();
}

module arm() {
translate([0,0,10])
		sphere(r=2.5);
	translate([0,0,3])
		cylinder(h=7, r1=2, r2=2.5);
	translate([-0.2,0,2.5])
		rotate([0,-20,0])
			resize([2,4,6])
				sphere(r=2.5);
}

module arms() {
	translate([-5,1,10])
		arm();
	mirror([1,0,0])
		translate([-5,1,10])
			arm();
}

module bodyarm() {
	translate([0,0,10]) {
		rotate([0,90,0])
			cylinder(h=5, r1=2.5, r2=3);
	}
}

module body() {
	hull() {
		translate([-5,1,10]) {
			bodyarm();
		}
		mirror([1,0,0]) {
			translate([-5,1,10])
				bodyarm();
		}
		translate([0,0,14]) {
			intersection() {
				translate([0,0,4]) {
					cube(20, true);
				}
				resize(newsize=[10,8,18]) {
					sphere(r=10);
					translate([0,0,-2.5]) {
						cylinder(h=1, r1=11, r2=11);
					}
				}
			}
		}
	}
	translate ([2,-2,19])
		rotate([0,0,20])
			resize([1,1,1])
				badge();
}

module head() {
	translate([0,0,26]) {
		resize(newsize=[6,7,8]) sphere(r=10);
	}
}

module glasses_ian() {
	translate([0,-4,26]) {
	glass_ian();
	mirror([1,0,0]) glass_ian();
	}
}

module glass_ian() {
	translate([-3,.5,0]) {
		cube([3,5,.5]);
		cube([3,.5,.5]);
		translate([.5,0,-1]) {
			translate([1,1,1]) rotate([90,0,0]) cylinder(1,1,1); //round
		}
	}
}

module glasses_square() {
	translate([0,-4,26]) {
	glass_square();
	mirror([1,0,0]) glass_square();
	}
}

module glass_square() {
	translate([-3,.5,0]) {
		cube([3,5,.5]);
		cube([3,.5,.5]);
		translate([.5,0,-1]) {
			cube([2,.5,2]); //square
		}
	}
}

module glasses_rectangle() {
	translate([0,-4,26]) {
		glass_rectangle();
		mirror([1,0,0]) glass_rectangle();
	}
}

module glass_rectangle() {
	translate([-3,.5,0]) {
		cube([3,5,.5]);
		cube([3,.5,.5]);
		translate([.5,0,-1]) {
			cube([2,.5,1.5]); //rectangle
		}
	}
}

module collar() {
	translate([0,0,21]) {
		difference() {
			cylinder(2,2,2);
			resize([3,6,11]) rotate(225,[0,0,1]) cube(5);
		}
	}
}

module badge() {
	rotate([90,0,0]) {
	hull() {
		cylinder(1,.1,.1); //bottom left
		translate([2.5,10,0]) cylinder(1,.1,.1); //top
		translate([3,4,0]) cylinder(1,.1,.1); //middle
	}
		hull() {
		translate([6,0,0])cylinder(1,.1,.1); //bottom left
		translate([2.5,10,0]) cylinder(1,.1,.1); //top
		translate([2.5,4,0]) cylinder(1,.1,.1); //middle
	}
	translate([2.5,4,0]) resize([9,5,.9]) cylinder(h=10, r1=3, r2=3);
}
}

module all_the_shared_stuff() {
	collar();
	body();
	arms();
	legs();
	foots();
}

module q_hat() {
	translate([0,.5,23]) {
		hull() {
			translate([0,0,5.5]) {
				rotate([-10,0,0]) rotate([0,0,45]) {
					hull() {
						translate([0,0,3]) cube([8,8,0.001],true);
						cube([6,6,0.001],true);
					}
				}
			}
			translate([0,0,4.5]) {
				cylinder(2,3,0);
			}
		}

		translate([0,0,2]) cylinder(4,3,3);
		translate([0,0,-8]) cylinder(10,2,3);
	}
}

module q_body() {
	hull() {
		translate([-5,1,10]) {
			bodyarm();
		}
		mirror([1,0,0]) {
			translate([-5,1,10])
				bodyarm();
		}
		translate([0,0,14]) {
			intersection() {
				translate([0,0,4]) {
					cube(20, true);
				}
				resize(newsize=[10,8,18]) {
					sphere(r=10);
					translate([0,0,-2.5]) {
						cylinder(h=1, r1=11, r2=11);
					}
				}
			}
		}
	}
}

module q_torso() {
	difference() {
		q_body();
		translate([-5,1,10]) {
			bodyarm();
		}
	}
}

module q_cloak() {
	hull() {
		q_torso();
		translate([0,0,0])resize([10,8,0.001]) cylinder(h=0.001, r=11);
	}
	hull() {
		q_torso();
		translate([-.5,-4,0])resize([3,3,0.001]) cylinder(h=0.001, r=11);
	}
	hull() {
		q_torso();
		translate([3,-3,0])resize([3,3,0.001]) cylinder(h=0.001, r=11);
	}
	
}

module q_bling() {
	translate([0,0,17])
		rotate([80,0,0])
			resize([2,2,3.5])
				cylinder(h=10, r1=3, r2=3);
}


module q() {
	q_hat();
	q_body();
	arms();
	legs();
	foots();
//	head();
	q_cloak();
	q_bling();
}

q();
//all_the_shared_stuff();
//head();
//glasses_ian();
//glasses_square();
//glasses_rectangle();
