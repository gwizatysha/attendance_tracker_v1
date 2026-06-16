#!/usr/bin/env python3
import os
import json
import signal
import shutil
import subprocess

# Load config
with open("Helpers/config.json") as f:
    config = json.load(f)

WARNING = config.get("warning", 100)
FAILURE = config.get("failure", 120)

# Signal trap
def handle_signal(sig, frame):
    print("\nInterrupt! Archiving and cleaning up...")
    shutil.make_archive("reports_archive", "zip", "reports")
    shutil.rmtree("attendance_tracker_v1", ignore_errors=True)
    exit(0)

signal.signal(signal.SIGINT, handle_signal)

# Check Python version
result = subprocess.run(["python3", "--version"], capture_output=True, text=True)
print("Python version:", result.stdout.strip())

# Get user input
try:
    user_warning = int(input(f"Enter warning threshold (default {WARNING}): ") or WARNING)
    user_failure = int(input(f"Enter failure threshold (default {FAILURE}): ") or FAILURE)
except ValueError:
    print("Invalid! Must be a number. Using defaults.")
    user_warning, user_failure = WARNING, FAILURE

print(f"Warning: {user_warning}, Failure: {user_failure}")
print("Directory structure is ready!")
