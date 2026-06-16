# Attendance Tracker v1

## Overview
A Python script that automates directory creation and configuration for an attendance tracking system.

## Project Structure

attendance_tracker_v1/

├── attendance_checker.py

├── Helpers/

│   ├── assets.csv

│   └── config.json

└── reports/

└── reports.log

## How to Run
1. Clone the repository
2. Navigate to the project folder
3. Run the script: python3 attendance_checker.py

## Configuration
Edit `Helpers/config.json` to set thresholds:
- `warning` — default 100
- `failure` — default 120

## Signal Trap
Press `Ctrl+C` while the script is running to trigger the signal handler.
It will archive the reports folder and clean up automatically.

## Author
Gwiza Tysha Kansiime
