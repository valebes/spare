#!/bin/bash

# Emergency node position: (90, 100)
# Specify the emergency area coordinates (x, y)
emergency_x=90  # Set the X coordinate for the emergency area
emergency_y=100  # Set the Y coordinate for the emergency area
emergency_radius=50  # Radius for the emergency area circle

# Step 1: Aggregate data for each unique timestamp and filter only necessary columns
# Extract all unique timestamps from the data files
timestamps=$(awk '{print $1}' stats_data/node_x*_y*.stats.data | sort -nu)

# Process each timestamp and unify data
for timestamp in $timestamps; do
    echo "Processing timestamp $timestamp"
    
    # Create a temporary file to store combined data for this timestamp
    unified_file="heatmaps/unified_${timestamp}.dat"
    > "$unified_file"
    
    # Loop through each file to extract X, Y from the filename and corresponding Request value
    for datafile in stats_data/node_x*_y*.stats.data; do
        # Extract X and Y coordinates from filename using regex
        if [[ "$datafile" =~ node_x([0-9]+)_y([0-9]+)\.stats\.data ]]; then
            x="${BASH_REMATCH[1]}"
            y="${BASH_REMATCH[2]}"
            
            # Extract the Request value for the current timestamp
            request=$(awk -v ts="$timestamp" '$1 == ts {print $5}' "$datafile" | paste -sd+ - | bc)
            
            # Append the data regardless of the request value
            echo "$x $y ${request:-0}" >> "$unified_file"
        fi
    done
done

# Step 2: Generate heatmaps for each timestamp
for timestamp in $timestamps; do
    echo "Generating heatmap for timestamp $timestamp"

    gnuplot <<- EOF
        set terminal pdf enhanced font 'Verdana,14'
        set output sprintf("heatmaps/heatmap_%d.pdf", ${timestamp})
        
        set title sprintf("Number of Requests at Epoch %d", ${timestamp})
        set xlabel "X Position"
        set ylabel "Y Position"
        set cblabel "Requests"
        
        set xrange [-0.5:105]
        set yrange [-0.5:155]
        set cbrange [0:30]
        
        emergency_x = ${emergency_x}
        emergency_y = ${emergency_y}
        emergency_radius = ${emergency_radius}

        set parametric
        set trange [0:2*pi]
        set urange [0:360]  # Optional: define angle range for complete circle
        
         set palette rgbformulae 7,5,15
        plot sprintf("heatmaps/unified_%d.dat", ${timestamp}) using 1:2:3 with points pointtype 5 pointsize 1 palette notitle, \
        emergency_radius * cos(t) + emergency_x, emergency_radius * sin(t) + emergency_y with lines lc rgb 'black' title 'Emergency Area'

EOF

    echo "Generated heatmap for timestamp $timestamp"
done

echo "All heatmaps generated in the heatmaps directory."
