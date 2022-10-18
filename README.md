# NAME

GD::Graph::Polar - Perl package to create polar graphs using GD package

# SYNOPSIS

    use GD::Graph::Polar;
    my $obj = GD::Graph::Polar->new(size=>480, radius=>100);
    $obj->addPoint(50=>25);                                  #radius => angle (e.g. polar form of complex number notation)
    $obj->addPoint_rad(50=>3.1415);
    $obj->addGeoPoint(75=>25);
    $obj->addGeoPoint_rad(75=>3.1415);
    $obj->addLine($radius0=>$theta0, $radius1=>$theta1);
    $obj->addLine_rad($radius0=>$theta0, $radius1=>$theta1);
    $obj->addGeoLine($radius0=>$theta0, $radius1=>$theta1);
    $obj->addGeoLine_rad($radius0=>$theta0, $radius1=>$theta1);
    $obj->addArc($radius0=>$theta0, $radius1=>$theta1);
    $obj->addArc_rad($radius0=>$theta0, $radius1=>$theta1);
    $obj->addGeoArc($radius0=>$theta0, $radius1=>$theta1);
    $obj->addGeoArc_rad($radius0=>$theta0, $radius1=>$theta1);
    $obj->addString($radius=>$theta, "Hello World!");
    $obj->addString_rad($radius=>$theta, "Hello World!");
    $obj->addGeoString($radius=>$theta, "Hello World!");
    $obj->addGeoString_rad($radius=>$theta, "Hello World!");
    $obj->font(gdSmallFont);  #sets the current font from GD exports
    $obj->color("blue");      #sets the current color from Graphics::ColorNames
    $obj->color([0,0,0]);     #sets the current color [red,green,blue]
    print $obj->draw; #PNG image

# DESCRIPTION

This package is a wrapper around GD to produce polar graphs with an easy interface.  I use this package to plot antenna patterns on a graph with data from the [RF::Antenna::Planet::MSI::Format](https://metacpan.org/pod/RF::Antenna::Planet::MSI::Format) package.

# CONSTRUCTOR

## new

The new constructor. 

    my $obj = GD::Graph::Polar->new(           #default values
                                    size          => 480,    #width and height in pixels
                                    radius        => 1,      #max value of the radius
                                    radius_origin => 0,      #value at the origin
                                    ticks         => 10,     #number of major ticks
                                    border        => 2,      #pixel border around graph
                                    rgbfile       => "/usr/X11R6/lib/X11/rgb.txt"
                                   );

# METHODS

## addPoint

Method to add a point to the graph.

    $obj->addPoint(50=>25);

## addPoint\_rad

Method to add a point to the graph.

    $obj->addPoint_rad(50=>3.1415);

## addGeoPoint

Method to add a point to the graph.

    $obj->addGeoPoint(75=>25);

## addGeoPoint\_rad

Method to add a point to the graph.

    $obj->addGeoPoint_rad(75=>3.1415);

## addLine

Method to add a line to the graph.

    $obj->addLine(50=>25, 75=>35);

## addLine\_rad

Method to add a line to the graph.

    $obj->addLine_rad(50=>3.14, 75=>3.45);

## addGeoLine

Method to add a line to the graph.

    $obj->addGeoLine(50=>25, 75=>35);

## addGeoLine\_rad

Method to add a line to the graph.

    $obj->addGeoLine_rad(50=>3.14, 75=>3.45);

## addArc

Method to add an arc to the graph.

    $obj->addArc(50=>25, 75=>35);

## addArc\_rad

Method to add an arc to the graph.

    $obj->addArc_rad(50=>3.14, 75=>3.45);

## addGeoArc

Method to add an arc to the graph.

    $obj->addGeoArc(50=>25, 75=>35);

## addGeoArc\_rad

Method to add an arc to the graph.

    $obj->addGeoArc_rad(50=>25, 75=>35);

## addString

Method to add a string to the graph.

## addString\_rad

Method to add a string to the graph.

## addGeoString

Method to add a string to the graph.

## addGeoString\_rad

Method to add a string to the graph.

# Objects

## gdimage

Returns a [GD](https://metacpan.org/pod/GD) object

## gcnames

Returns a [Graphics::ColorNames](https://metacpan.org/pod/Graphics::ColorNames) object.

# Properties

## color

Method to set or return the current drawing color

    my $colorobj = $obj->color("blue");     #if Graphics::ColorNames available
    my $colorobj = $obj->color([77,82,68]); #rgb=>[decimal,decimal,decimal]
    my $colorobj = $obj->color;

Default: \[0,0,0\] (i.e., black)

## font

Method to set or return the current drawing font (only needed by the very few)

    use GD qw(gdGiantFont gdLargeFont gdMediumBoldFont gdSmallFont gdTinyFont);
    $obj->font(gdSmallFont); #the default
    $obj->font;

Default: gdSmallFont

## size

Sets or returns the width and height of the image in pixels.

Default: 480

## radius

Sets or returns the radius of the graph which sets the scale of the maximum value of the graph.

Default: 1

## radius\_origin

Sets or returns the radius origin of the graph which sets the value scale at the origin of the graph.

Default: 0

## border

Sets and returns the number of pixels that border the graph on the image.

Default: 2

## ticks

Sets and returns the number of ticks on the graph.

Default: 10

## axes

Sets and returns the number of axes (plural of axis) on the graph.

Default: 4

## rgbfile

Sets or returns an RGB file.

Note: This method will search in a few locations for a file.

## draw

Method returns a PNG binary blob.

    my $png_binary = $obj->draw;

# LICENSE

MIT License

Copyright (c) 2022 Michael R. Davis

# SEE ALSO

[GD](https://metacpan.org/pod/GD), [Geo::Constants](https://metacpan.org/pod/Geo::Constants), [Geo::Functions](https://metacpan.org/pod/Geo::Functions), [Graphics::ColorNames](https://metacpan.org/pod/Graphics::ColorNames)
