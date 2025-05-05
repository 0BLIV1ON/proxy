# PowerShell script to set up the environment for running main.sh

# Check if Scoop is installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Scoop is not installed. Installing Scoop..."
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') || {
        Write-Error "Failed to install Scoop. Please check your internet connection and try again."
        exit 1
    }

    # Verify Scoop installation
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Write-Error "Scoop installation failed. Please try installing Scoop manually from https://scoop.sh."
        exit 1
    }
} else {
    Write-Host "Scoop is already installed. Updating Scoop..."
    scoop update
}

# Install Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Git..."
    scoop install git || {
        Write-Error "Failed to install Git. Please check the logs and try again."
        exit 1
    }
} else {
    Write-Host "Git is already installed."
}

# Install Node.js (includes npm)
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Node.js..."
    scoop install nodejs || {
        Write-Error "Failed to install Node.js. Please check the logs and try again."
        exit 1
    }
} else {
    Write-Host "Node.js is already installed."
}

# Verify npm installation
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Error "npm is not installed. Please ensure Node.js was installed correctly."
    exit 1
} else {
    Write-Host "npm is already installed."
}

# Install Bash (optional, if not already available)
if (-not (Get-Command bash -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Bash (via git-with-openssh)..."
    scoop install git-with-openssh || {
        Write-Error "Failed to install Bash. Please check the logs and try again."
        exit 1
    }
} else {
    Write-Host "Bash is already installed."
}

# Final instructions
Write-Host "All required tools are installed. You can now run the main.sh script using Bash."
Write-Host "To run the script, use the following command in Git Bash:"
Write-Host "bash /workspaces/proxy/main.sh"