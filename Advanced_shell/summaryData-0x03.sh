#!/bin/bash

REPORT_FILE="pokemon_summary.csv"

# 1. Print the header row to the CSV file
echo "Name,Height,Weight" > "$REPORT_FILE"

# 2. Loop through all JSON files created in Task 2 and append data to the CSV
for FILE in *.json; do
    # Use jq -r to output raw, unquoted, comma-separated fields and append to report
    jq -r '[.name, .height, .weight] | @csv' "$FILE" >> "$REPORT_FILE"
done

echo "---"
echo "CSV Report (pokemon_summary.csv) Generated."
echo "---"

# 3. Use awk to calculate and print the average height and average weight
awk -F ',' '
# Skip the header line (NR is the built-in record number)
NR > 1 {
    # Accumulate totals for Height (Field $2) and Weight (Field $3)
    total_height += $2
    total_weight += $3
    # Count the number of data records processed
    count++
}

# Run this block only once after processing all lines
END {
    if (count > 0) {
        printf "Average Height: %.2f\n", total_height / count
        printf "Average Weight: %.2f\n", total_weight / count
    } else {
        print "No data records found to calculate averages."
    }
}
' "$REPORT_FILE"
