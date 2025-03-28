# build_and_deploy.ps1. Easily build and deploy a Flutter-windows application
# from the command line.

# Set variables
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildPath = Join-Path $projectRoot "build\windows\x64\runner\Release"

# Replace `your-network-drive` with actual UNC-path
$targetPath = "\\your-network-drive\path\to\app-deploy"

# Step 1: Build the app
Write-Host "Building Flutter Windows app..."
flutter build windows

# Step 2: Ensure target exists
if (!(Test-Path -Path $targetPath)) {
    Write-Host "Creating target directory at $targetPath"
    New-Item -ItemType Directory -Path $targetPath | Out-Null
}

# Step 3: Copy files
Write-Host "Copying release build to target..."
Copy-Item -Path "$buildPath\*" -Destination $targetPath -Recurse -Force

Write-Host "Done. App deployed to $targetPath"