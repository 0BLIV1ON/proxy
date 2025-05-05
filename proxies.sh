# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git and try again."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install Node.js and npm, then try again."
    exit 1
fi

# Clone the repository with submodules
if [ ! -d "Holy-Unblocker" ]; then
    git clone --recurse-submodules https://github.com/titaniumnetwork-dev/Holy-Unblocker.git || {
        echo "Error: Failed to clone the repository."
        exit 1
    }
else
    echo "Directory 'Holy-Unblocker' already exists. Skipping clone."
fi

# Navigate to the project directory
cd Holy-Unblocker || {
    echo "Error: Failed to enter the 'Holy-Unblocker' directory."
    exit 1
}

# Build the project if needed
echo "Building the project..."
npm run build || {
    echo "Error: Build failed. Please check the logs and try again."
    exit 1
}

# Validate the proxy if needed
echo "Validating the proxy..."
npm run proxy-validator || {
    echo "Error: Proxy validation failed. Please check the logs and try again."
    exit 1
}

# Start the application
echo "Starting the application..."
npm start || {
    echo "Error: Failed to start the application. Try running 'npm run build' or 'npm run proxy-validator'."
    exit 1
}