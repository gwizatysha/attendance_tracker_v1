#!/bin/bash

# Trap must come FIRST
trap 'echo "Interrupted! Archiving..."; tar -czf reports_archive.tar.gz "${PROJECT_DIR:-temp}/reports" 2>/dev/null; rm -rf "${PROJECT_DIR:-temp}"; exit' SIGINT

# Check Python version
python3 --version

# Get directory name from user
read -p "Enter project name: " PROJECT_DIR

# Get thresholds from user
read -p "Enter warning threshold (default 75): " WARNING
read -p "Enter failure threshold (default 50): " FAILURE

WARNING=${WARNING:-75}
FAILURE=${FAILURE:-50}

# Create structure
mkdir -p "$PROJECT_DIR/Helpers"
mkdir -p "$PROJECT_DIR/reports"

# Generate files with actual content
echo '{"warning": '"$WARNING"', "failure": '"$FAILURE"'}' > "$PROJECT_DIR/Helpers/config.json"
touch "$PROJECT_DIR/Helpers/assets.csv"
touch "$PROJECT_DIR/reports/reports.log"

# Update config with sed
sed -i "s/\"warning\": 75/\"warning\": $WARNING/" "$PROJECT_DIR/Helpers/config.json"

echo "Project $PROJECT_DIR created!"
echo "Initialized on: $(date)"
