function CopyWithOverwrite {
    param (
        [string]$sourceDirectory,
        [string]$destinationDirectory,
        [bool]$deleteSource = $false 
    )

    if (-not (Test-Path -Path $sourceDirectory)) {
        Write-Host "Source directory does not exist."
        return
    }


    if (Test-Path -Path $destinationDirectory) {
        Remove-Item -Path $destinationDirectory -Recurse -Force
        Write-Host "Removed existing directory: $destinationDirectory"
    }

    # Ensure destination directory exists, then copy the CONTENTS of source into it
    New-Item -Path $destinationDirectory -ItemType Directory -Force | Out-Null
    Copy-Item -Path (Join-Path -Path $sourceDirectory -ChildPath '*') -Destination $destinationDirectory -Recurse -Force
    Write-Host "Copied contents of $sourceDirectory to $destinationDirectory"

    if ($deleteSource -eq $true) {
        Remove-Item -Path $sourceDirectory -Recurse -Force
        Write-Host "Deleted files from source directory: $sourceDirectory"
    }
}

$distributionPath = "distribution"

CopyWithOverwrite -sourceDirectory "./scripts" -destinationDirectory "$distributionPath/scripts"
CopyWithOverwrite -sourceDirectory ".\installer-scripts" -destinationDirectory "$distributionPath/installer-scripts"

try {
    if (Get-Command ps2exe -ErrorAction SilentlyContinue) {
        & ps2exe 'main-installer.ps1' "$distributionPath\main-installer.exe"
    }
    else {
        Write-Host "ps2exe not found; skipping EXE generation. Install the ps2exe module to enable this step."
    }
}
catch {
    Write-Host "ps2exe generation failed: $_"
}

$zipPath = "$distributionPath.zip"
if (Test-Path -Path $zipPath) {
    Remove-Item -Path $zipPath -Force
}
Compress-Archive -Path $distributionPath -CompressionLevel Optimal -DestinationPath $zipPath
Write-Host "Distribution ZIP file created: $zipPath"
