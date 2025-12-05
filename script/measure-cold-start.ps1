# Capture curl output as a single string
$output = & curl.exe -o NUL -s -w "Total Time: %{time_total}s`nTTFB: %{time_starttransfer}s`n" "https://cold-bun-test.vercel.app/api/test-cold-start"
$output = $output -join "`n"  # Ensure it's a single string

Write-Output "---------------------------------------------"

# Extract numbers using regex
if ($output -match "Total Time: ([\d.]+)s`nTTFB: ([\d.]+)s") {
    $totalTime = [double]$matches[1]
    $ttfb = [double]$matches[2]
    $difference = $totalTime - $ttfb
    Write-Output $output
    Write-Output ("Total Time - TTFB ~ {0}s" -f $difference)
} else {
    Write-Output "Failed to parse curl output:"
    Write-Output $output
}

Write-Output "---------------------------------------------"