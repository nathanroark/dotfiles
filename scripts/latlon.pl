#!/usr/bin/perl

use strict;
use warnings;

# Function to convert DMS to Decimal Degrees
sub convert_dms_to_dd {
    my ($dms) = @_;

    # Match degrees, minutes, seconds, and direction using regex
    if ($dms =~ /([0-9]+)°([0-9]+)′([0-9]+(?:\.[0-9]+)?)″([NSEW])/) {
        my $degrees = $1;
        my $minutes = $2;
        my $seconds = $3;
        my $direction = $4;

        # Calculate Decimal Degrees
        my $decimal = $degrees + ($minutes / 60) + ($seconds / 3600);

        # Adjust for direction
        if ($direction eq 'S' || $direction eq 'W') {
            $decimal = -$decimal;
        }

        return sprintf("%.6f", $decimal);
    } else {
        die "Error: Invalid DMS format ($dms)\n";
    }
}

# Main script
if (@ARGV != 1) {
    die "Usage: $0 '<latitude> <longitude>'\nExample: $0 '1°56′38″S 30°3′34″E'\n";
}

my $coords = $ARGV[0];

# Split input into latitude and longitude
my ($latitude, $longitude) = split(/\s+/, $coords);

# Convert each DMS coordinate to Decimal Degrees
my $lat_dd = convert_dms_to_dd($latitude);
my $lon_dd = convert_dms_to_dd($longitude);

# Output results
print "Latitude: $lat_dd\n";
print "Longitude: $lon_dd\n";
