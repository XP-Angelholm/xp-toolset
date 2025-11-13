function Invoke-InstallerScripts {
    param (
        [string]$Directory
    )
    # Find all PowerShell installer scripts recursively
    $scripts = Get-ChildItem -Path $Directory -Filter "*.ps1" -Recurse -File

    $totalNumberOfScripts = $scripts.Count
    if ($totalNumberOfScripts -eq 0) {
        Write-Host "No installer scripts found in: $Directory"
        return
    }

    $currentScriptIndex = 0

    foreach ($script in $scripts) {
        try {
            $currentScriptIndex++
            $percent = [int](($currentScriptIndex / $totalNumberOfScripts) * 100)
            Write-Progress -Status "Running installer scripts..." -Activity "Executing: $($script.Name)" -PercentComplete $percent

            if ($script.Extension -eq ".ps1") {
                # Run each installer script with a clean profile and bypass execution policy, wait for completion
                $arg = "-NoProfile -ExecutionPolicy Bypass -File `"$($script.FullName)`""
                Start-Process -FilePath "powershell" -ArgumentList $arg -WorkingDirectory $script.DirectoryName -NoNewWindow -Wait
            }

            Write-Host "Completed script: $($script.FullName)"
        }
        catch {
            Write-Host "Error running script: $($script.FullName) Error details: $_"
        }
    }
}

# Call the function to start running installer scripts
$installerScriptsDirectory = ".\installer-scripts"
Invoke-InstallerScripts -Directory $installerScriptsDirectory