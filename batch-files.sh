#!/bin/bash

# Define the output file
output_file="for-claude.txt"

# Clear or create the output file
> "$output_file"

# Function to process a file
process_file() {
    local file="$1"

    # Skip specified files and directories
    if [[ "$file" == *"__init__.py" ]] || \
       [[ "$file" == *"__pycache__"* ]] || \
       [[ "$file" == *"for-claude.txt" ]] || \
       [[ "$file" == *"poetry.lock" ]]; then
        return
    fi

    # Add file header with full relative path
    echo "# ${file#./}" >> "$output_file"
    echo "" >> "$output_file"

    # Add file content
    cat "$file" >> "$output_file"

    # Add five blank lines after content
    printf "\n\n\n\n\n" >> "$output_file"
}

# Find files excluding .venv directory and process them
find . -type f \
    -not -path "./.venv/*" \
    -not -path "./.git/*" \
    -not -path "./.*" \
    -not -path "*/__pycache__/*" \
    | sort \
    | while read -r file; do
        process_file "$file"
    done

echo "Processing complete: $output_file"

