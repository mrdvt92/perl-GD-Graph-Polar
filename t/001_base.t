# -*- perl -*-

use strict;
use warnings;
use Test::More tests => 11;
use Path::Class qw{file dir};

use_ok('GD::Graph::Polar');

my $rgb = file(file($0)->dir->parent, 'rgb.txt');

my $obj = GD::Graph::Polar->new(radius=>30,
                                size=>40,
                                border=>5,
                                rgb=>$rgb,
                                );
isa_ok($obj, "GD::Graph::Polar");

is($obj->_width, 30, "_width");
is($obj->_scale(15), 7.5, "_scale");

{
  my($x,$y) = $obj->_imgxy_xy(5,7);
  is($x,25, "_imgxy_xy -> x");
  is($y,13, "_imgxy_xy -> y");
}

{
  my ($x,$y) = $obj->_xy_rt_rad(sqrt(5), atan2(1,2));
  is($x=>2, "_xy_rt_rad -> x");
  is($y=>1, "_xy_rt_rad -> y");
}

ok($obj->color([1,2,3]));

SKIP: {
  eval q{use Graphics::ColorNames};
  skip "Graphics::ColorNames not available", 1 if $@;
  ok($obj->color("blue"));
}

my $png = $obj->draw;
like($png, qr/\A.PNG/);
