#/bin/bash

set -euo pipefail

# Check if a filename argument is provided
if [ $# -eq 0 ]; then
    echo -e  "Please provide a file after the scriptname\nSample: $0 <filename>"
    exit 1
fi

FILE="$1"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

echo -e "File \"${FILE}\" is present to be formatted"


sed -i '/^[[:space:]]*$/d' "$FILE"

echo "Blank lines removed from '$FILE'."
