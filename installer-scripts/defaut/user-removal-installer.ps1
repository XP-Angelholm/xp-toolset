
$scriptDir = $PSScriptRoot

# Import the shared installer module from the parent 'installer-scripts' folder
Import-Module (Join-Path $scriptDir '..\base-installer.psm1')

# Source scripts are located under the repository root 'scripts' directory
$sourceDirectory = (Join-Path $scriptDir '..\..\scripts\user-removal')
$destinationDirectory = 'C:\Users\Public\scripts\ExecuteOnStartup'

Copy-Scripts -SourceDirectory $sourceDirectory -DestinationDirectory $destinationDirectory