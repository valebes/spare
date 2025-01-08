#!/bin/bash

# Define the output file for the final result
output_file="weighted_avg_hops_by_epoch.csv"
echo "epoch,weighted_avg_hops" > $output_file

# Create a temporary file to store accumulated data
temp_file=$(mktemp)

# Initialize the temporary file with headers
echo "epoch weighted_hops_sum total_requests" > $temp_file

# Loop through each node file that matches the pattern `node_x*_y*.stats.data`
for file in stats_data/node_x*_y*.stats.data; do
  # Skip the header row in each file and read the rows
  tail -n +2 "$file" | while IFS=' ' read -r epoch hops_avg vcpus_sum memory_sum requests; do
    # Calculate the weighted hops (hops_avg * requests)
    weighted_hops=$(echo "$hops_avg * $requests" | bc -l)

    # Check if the epoch already exists in the temp file
    if grep -q "^$epoch " $temp_file; then
      # If the epoch exists, update the weighted_hops_sum and total_requests
      awk -v epoch="$epoch" -v weighted_hops="$weighted_hops" -v requests="$requests" '
        $1 == epoch {
          $2 += weighted_hops
          $3 += requests
        }
        {print}
      ' $temp_file > temp && mv temp $temp_file
    else
      # If the epoch does not exist, add a new entry
      echo "$epoch $weighted_hops $requests" >> $temp_file
    fi
  done
done

# Calculate the weighted average for each epoch and write to the output file
awk 'NR>1 {print $1","($2/$3)}' $temp_file >> $output_file

# Cleanup
rm $temp_file

echo "Weighted average hops per epoch saved to '$output_file'"
