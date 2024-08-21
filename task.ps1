<<<<<<< HEAD
# Write your code here
=======

# Create an empty list to store the regions
$regionsWithVMSize = @()

# Get all JSON files in the data directory
$jsonFiles = Get-ChildItem -Path "'\.data'"

# Loop through each JSON file
foreach ($file in $jsonFiles) {
    # Read the file content and convert JSON to PowerShell objects
    $jsonData = Get-Content -Path $file.FullName | ConvertFrom-Json

    # Search for the VM size 'Standard_B2pts_v2' in the JSON data
    $foundVMSize = $jsonData | Where-Object { $_.name -eq "Standard_B2pts_v2" }

    if ($foundVMSize) {
        # Get the region name from the file name (removing the .json suffix)
        $regionName = $file.Name.Replace('.json', '')
        $regionsWithVMSize += $regionName
    }
}

# Export the result list as JSON to the output file
$regionsWithVMSize | ConvertTo-Json -Depth 10 | Set-Content -Path ".\result.json"






$regionsWithVMSize = @()

$regions = Get-ChildItem -Path ".\data"
foreach ($region in $regions) {
    $jsonData = Get-Content -Path $region.FullName | ConvertFrom-Json
    $foundVMSize = $jsonData | Where-Object { $_.name -eq "Standard_B2pts_v2" }
    if ($foundVMSize) {
        $regionName = $region.Name.Replace('.json', '')
        $regionsWithVMSize += $regionName
    }
}

$regionsWithVMSize | ConvertTo-Json -Depth 10 | Set-Content -Path ".\result.json"
>>>>>>> 6fffbb2 (Solution)
