#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting deployment script..."

# Navigate to the backend (root folder where `app.py` is located)
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Test the Python backend (optional)
echo "Testing Python backend..."
python app.py &  # Run in the background for quick local testing
BACKEND_PID=$!   # Capture the PID to stop it later
sleep 5          # Wait for the backend to start

# Navigate to the frontend
echo "Installing Node.js dependencies..."
cd pdf-upload
npm install

# Build the frontend
echo "Building the frontend..."
npm run build

# Stop the Python backend if it was started
echo "Stopping backend..."
kill $BACKEND_PID

# Clean up (if necessary)
echo "Cleaning up..."
cd ..

echo "Deployment script completed successfully."
