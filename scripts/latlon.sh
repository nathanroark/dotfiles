#!/bin/bash


# Function to convert DMS to Decimal Degrees
convert_dms_to_dd() {
    local dms=$1

    # Extract degrees, minutes, seconds, and direction using regex
    if [[ $dms =~ ([0-9]+)°([0-9]+)′([0-9]+(\.[0-9]+)?)″([NSEW]) ]]; then
        degrees=${BASH_REMATCH[1]}
        minutes=${BASH_REMATCH[2]}
        seconds=${BASH_REMATCH[3]}
        direction=${BASH_REMATCH[5]}

        # Calculate Decimal Degrees
        decimal=$(echo "scale=6; $degrees + ($minutes / 60) + ($seconds / 3600)" | bc)

        # Adjust for direction
        if [[ $direction == "S" || $direction == "W" ]]; then
            decimal=$(echo "scale=6; -$decimal" | bc)
        fi

        echo "$decimal"
    else
        echo "Error: Invalid DMS format ($dms)" >&2
        exit 1
    fi
}

# Main script
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 '<latitude> <longitude>'"
    echo "Example: $0 '1°56′38″S 30°3′34″E'"
    exit 1
fi

coords=$1

# Split input into latitude and longitude
latitude=$(echo "$coords" | awk '{print $1}')
longitude=$(echo "$coords" | awk '{print $2}')

# Convert each DMS coordinate to Decimal Degrees
lat_dd=$(convert_dms_to_dd "$latitude")
lon_dd=$(convert_dms_to_dd "$longitude")

# Output results
echo "Latitude: $lat_dd"
echo "Longitude: $lon_dd"
