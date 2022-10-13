# -*- perl -*-
use strict;
use warnings;
use Test::More tests => 3;
use_ok('GD::Graph::Polar');

my $obj = GD::Graph::Polar->new(radius        => 10,
                                radius_origin => -60, #added to support dB scaling
                                size          => 800,
                                border        => 20,
                                ticks         => 7,
                                );

isa_ok($obj, "GD::Graph::Polar");

my @last = ();
foreach my $line (<DATA>) {
  my ($angle, $value) = split /\s+/, $line, 2;
  #diag("$angle => $value");
  $obj->addPoint($value=>$angle);
  $obj->addLine(@last, $value=>$angle) if @last;
  @last = ($value => $angle);
}

foreach my $r (-60, -50, -40, -30, -20, -10, 0, 10) {
  $obj->addString($r=>0, $r);
}

my $png = $obj->draw;
like($png, qr/\A.PNG/, 'draw');

open my $fh, '>', "$0.png";
print $fh $png;

__DATA__
-170 -90
-160 -80
-150 -70
-140 -60
-130 -50
-120 -50
-110 -40
-100 -30
-90  -20
-80  -20
-70  -10
-60  -10
-50  -5
-40  -5 
-30  -5
-20   0
-10   1
0     2.14
10    1
20    0
30   -5
40   -5
50   -5
60   -10
70   -10
80   -20
90   -20
100  -30
110  -40
120  -50
130  -50
140  -60
150  -70
160  -80
170  -90
180  -90
