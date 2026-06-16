#!/bin/bash

# Directory creation
mkdir -p attendance_tracker_v1/Helpers
mkdir -p attendance_tracker_v1/reports
touch attendance_tracker_v1/Helpers/assets.csv
touch attendance_tracker_v1/Helpers/config.json
touch attendance_tracker_v1/reports/reports.log

# sed manipulation - update config values
sed -i 's/"warning": 100/"warning": 150/' attendance_tracker_v1/Helpers/config.json

# Trap function
trap "echo 'Interrupted! Archiving...'; tar -czf reports_archive.tar.gz attendance_tracker_v1/reports; rm -rf attendance_tracker_v1; exit" SIGINT

echo "Project structure created successfully!"
echo "Initialized on: $(date)"
