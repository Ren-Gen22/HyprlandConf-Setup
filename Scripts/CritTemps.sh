#!/bin/bash

# Script to monitor and record min/max CPU/package temperatures
LOG_FILE="cpu_temp_log.txt"
INTERVAL=60 # seconds between checks

# Function to get CPU temperatures
get_cpu_temps() {
    sensors_output=$(sensors)
    
    # Extract package temperature (usually the most representative CPU temp)
    package_temp=$(echo "$sensors_output" | awk '/Package id 0/{print $4}' | cut -c2- | cut -d. -f1)
    
    # Extract individual core temps
    core0_temp=$(echo "$sensors_output" | awk '/Core 0/{print $3}' | cut -c2- | cut -d. -f1)
    core1_temp=$(echo "$sensors_output" | awk '/Core 1/{print $3}' | cut -c2- | cut -d. -f1)
    core2_temp=$(echo "$sensors_output" | awk '/Core 2/{print $3}' | cut -c2- | cut -d. -f1)
    core3_temp=$(echo "$sensors_output" | awk '/Core 3/{print $3}' | cut -c2- | cut -d. -f1)
    
    # Extract other relevant temps
    pch_temp=$(echo "$sensors_output" | awk '/temp1.*pch_cometlake/{print $2}' | cut -c2- | cut -d. -f1)
    nvme_temp=$(echo "$sensors_output" | awk '/Composite.*nvme-pci/{print $2}' | cut -c2- | cut -d. -f1)
    
    echo "$package_temp,$core0_temp,$core1_temp,$core2_temp,$core3_temp,$pch_temp,$nvme_temp"
}

# Initialize variables
declare -A min_temp max_temp
components=("package" "core0" "core1" "core2" "core3" "pch" "nvme")

# Set initial very high min and very low max values
for component in "${components[@]}"; do
    min_temp[$component]=1000
    max_temp[$component]=0
done

# Create log file header
echo "System Temperature Monitor - Started at $(date)" > "$LOG_FILE"
echo "Interval: $INTERVAL seconds" >> "$LOG_FILE"
echo "---------------------------------" >> "$LOG_FILE"
echo "Time, Package, Core0, Core1, Core2, Core3, PCH, NVMe, Min(Package), Max(Package)" >> "$LOG_FILE"

# Main monitoring loop
while true; do
    IFS=',' read -r package_temp core0_temp core1_temp core2_temp core3_temp pch_temp nvme_temp <<< $(get_cpu_temps)
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Update min and max for each component
    for component in "${components[@]}"; do
        var_name="${component}_temp"
        current_temp=${!var_name}
        
        if [ "$current_temp" -lt "${min_temp[$component]}" ]; then
            min_temp[$component]=$current_temp
        fi
        if [ "$current_temp" -gt "${max_temp[$component]}" ]; then
            max_temp[$component]=$current_temp
        fi
    done
    
    # Log to file
    echo "$timestamp, $package_temp°C, $core0_temp°C, $core1_temp°C, $core2_temp°C, $core3_temp°C, $pch_temp°C, $nvme_temp°C, ${min_temp[package]}°C, ${max_temp[package]}°C" >> "$LOG_FILE"
    
    # Display current status
    clear
    echo "System Temperature Monitor - Running"
    echo "Last Check: $timestamp"
    echo ""
    echo "CPU Package:   $package_temp°C (Min: ${min_temp[package]}°C, Max: ${max_temp[package]}°C)"
    echo "Core 0:        $core0_temp°C"
    echo "Core 1:        $core1_temp°C"
    echo "Core 2:        $core2_temp°C"
    echo "Core 3:        $core3_temp°C"
    echo "PCH:           $pch_temp°C"
    echo "NVMe:          $nvme_temp°C"
    echo ""
    echo "Logging to $LOG_FILE"
    echo "Press Ctrl+C to stop"
    
    sleep $INTERVAL
done
