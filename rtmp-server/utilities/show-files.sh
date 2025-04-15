#!/bin/bash

# Directory to scan, default to current dir if none provided
SCAN_DIR="${1:-.}"

# Function to check if a file is text
is_text_file() {
    # Detect MIME type and check if it's 'text/*' or 'application/json' etc.
    local mimetype
    mimetype=$(file --mime-type -b "$1")
    
    case "$mimetype" in
        text/*|application/json|application/xml|application/x-shellscript)
            return 0  # It's a text file
            ;;
        *)
            return 1  # It's binary or unknown
            ;;
    esac
}

# Recursively find files, excluding hidden directories
find "$SCAN_DIR" \( -path '*/.*' -prune \) -o -type f -print | while read -r filepath; do
    echo "===== FILE: $filepath ====="
    if is_text_file "$filepath"; then
        cat "$filepath"
    else
        echo "[Binary file detected, contents not displayed]"
    fi
    echo ""  # Add a blank line between files
done