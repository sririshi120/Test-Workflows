#!/bin/bash

# Read commit messages from a file (replace with your actual file path)
COMMIT_MESSAGES_FILE="commit_messages.txt"

# Pattern to match project and module names
project_pattern="Project : '([^\']+)'"
module_pattern="Module : '([^\']+)'"

# Function to extract names using a pattern
extract_names() {
    local pattern="$1"
    local message="$2"
    
    if [[ $message =~ $pattern ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo "Not found"
    fi
}

# Loop through each commit message in the file
while IFS= read -r commit_message; do
    project_name=$(extract_names "$project_pattern" "$commit_message")
    module_name=$(extract_names "$module_pattern" "$commit_message")

    echo "Commit message: $commit_message"
    echo "Project name: $project_name"
    echo "Module name: $module_name"
    echo
done < "$COMMIT_MESSAGES_FILE"
