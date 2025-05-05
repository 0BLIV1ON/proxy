#!/bin/bash

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

# Prompt the user to choose a project
echo "Select a project to set up:"
echo "1) Holy-Unblocker"
echo "2) Interstellar"
echo "3) Ultraviolet"
read -p "Enter the number of your choice: " choice

if [ "$choice" -eq 1 ]; then
    # Setup Holy-Unblocker
    if [ ! -d "Holy-Unblocker" ]; then
        git clone --recurse-submodules https://github.com/titaniumnetwork-dev/Holy-Unblocker.git || {
            echo "Error: Failed to clone the Holy-Unblocker repository."
            exit 1
        }
    else
        echo "Directory 'Holy-Unblocker' already exists. Skipping clone."
    fi

    cd Holy-Unblocker || {
        echo "Error: Failed to enter the 'Holy-Unblocker' directory."
        exit 1
    }

    echo "Building the Holy-Unblocker project..."
    npm run build || {
        echo "Error: Build failed. Please check the logs and try again."
        exit 1
    }

    echo "Validating the proxy..."
    npm run proxy-validator || {
        echo "Error: Proxy validation failed. Please check the logs and try again."
        exit 1
    }

    echo "Starting Holy-Unblocker..."
    npm start || {
        echo "Error: Failed to start Holy-Unblocker. Try running 'npm run build' or 'npm run proxy-validator'."
        exit 1
    }

elif [ "$choice" -eq 2 ]; then
    # Setup Interstellar
    if [ ! -d "Interstellar" ]; then
        git clone --branch Ad-Free https://github.com/UseInterstellar/Interstellar.git || {
            echo "Error: Failed to clone the Interstellar repository."
            exit 1
        }
    else
        echo "Directory 'Interstellar' already exists. Skipping clone."
    fi

    cd Interstellar || {
        echo "Error: Failed to enter the 'Interstellar' directory."
        exit 1
    }

    echo "Installing dependencies for Interstellar..."
    npm i || {
        echo "Error: Failed to install dependencies. Please check the logs and try again."
        exit 1
    }

    echo "Starting Interstellar..."
    npm start || {
        echo "Error: Failed to start Interstellar. Please check the logs and try again."
        exit 1
    }

elif [ "$choice" -eq 3 ]; then
    # Setup Ultraviolet
    if [ ! -d "Ultraviolet-App" ]; then
        git clone https://github.com/titaniumnetwork-dev/Ultraviolet-App.git || {
            echo "Error: Failed to clone the Ultraviolet repository."
            exit 1
        }
    else
        echo "Directory 'Ultraviolet-App' already exists. Skipping clone."
    fi

    cd Ultraviolet-App || {
        echo "Error: Failed to enter the 'Ultraviolet-App' directory."
        exit 1
    }

    echo "Installing dependencies for Ultraviolet..."
    npm install || {
        echo "Error: Failed to install dependencies. Please check the logs and try again."
        exit 1
    }

    echo "Starting Ultraviolet..."
    npm start || {
        echo "Error: Failed to start Ultraviolet. Please check the logs and try again."
        exit 1
    }

else
    echo "Invalid choice. Please run the script again and select a valid option."
    exit 1
fi