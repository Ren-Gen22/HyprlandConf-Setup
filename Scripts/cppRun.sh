#!/bin/bash

# Check if the source file argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <source_file.cpp>"
    exit 1
fi

# Variables
SOURCE_FILE="$1"
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"
EXEC_FILE="program"

# Compile the C++ program
g++ -o "$EXEC_FILE" "$SOURCE_FILE"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."

    # Run the program with input from the file and output to another file
    ./"$EXEC_FILE" < "$INPUT_FILE" > "$OUTPUT_FILE"
    
    echo "Program executed. Output written to $OUTPUT_FILE."

    # Open input and output files in new Kitty windows using nvim
    kitty nvim "$INPUT_FILE" &
    kitty nvim "$OUTPUT_FILE" &
else
    echo "Compilation failed."
fi
