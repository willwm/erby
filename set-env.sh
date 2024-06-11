#!/bin/bash

# Path to the .env file
env_file="$(dirname "${BASH_SOURCE[0]}")/.env"

printf "Setting environment variables from '$env_file'\n"

# Check if the .env file exists
if [ -f "$env_file" ]; then
    # Read each line in the .env file
    while IFS= read -r line; do
        # Skip empty lines and comments
        if [[ "$line" =~ ^[[:space:]]*# || "$line" =~ ^[[:space:]]*$ ]]; then
            continue
        fi

        # Print the line
        printf " $line\n"

        # Export the variable to the script's environment
        export "$line"
    done < "$env_file"
else
    echo "Error: .env file not found."
fi

