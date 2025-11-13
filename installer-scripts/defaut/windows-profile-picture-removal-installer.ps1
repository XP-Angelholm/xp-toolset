$scriptDir = $PSScriptRoot

# Import the shared installer module from the parent 'installer-scripts' folder
Import-Module (Join-Path $scriptDir '..\base-installer.psm1')

# Source scripts are located under the repository root 'scripts' directory
$sourceDirectory = (Join-Path $scriptDir '..\..\scripts\windows-profile-picture-removal')
$destinationDirectory = 'C:\Users\Public\scripts\ExecuteOnOther'

Copy-Scripts -SourceDirectory $sourceDirectory -DestinationDirectory $destinationDirectory
