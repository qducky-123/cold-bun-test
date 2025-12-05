#!/bin/bash

# Capture curl output as a single string, discard body with -o /dev/null
output=$(curl -s -o /dev/null -w "Total Time: %{time_total}s\nTTFB: %{time_starttransfer}s\n" "https://cold-bun-test.vercel.app/api/test-cold-start")

echo "---------------------------------------------"

# Extract numbers using regex
if [[ $output =~ Total\ Time:\ ([0-9.]+)s$'\n'TTFB:\ ([0-9.]+)s ]]; then
    totalTime=${BASH_REMATCH[1]}
    ttfb=${BASH_REMATCH[2]}
    difference=$(echo "$totalTime - $ttfb" | bc -l)
    echo "$output"
    printf "Total Time - TTFB ~ %.3fs\n" "$difference"
else
    echo "Failed to parse curl output:"
    echo "$output"
fi

echo "---------------------------------------------"