#!/bin/bash

input_directory="./templates"
output_directory="./transformed"

if [ -f ../set-env.sh ]; then
    source ../set-env.sh
fi

echo "❌ Removing $(realpath "$output_directory")"
rm -rf $output_directory

echo "🏃 Running transform_templates.rb ('$input_directory' → '$output_directory')"
ruby ./transform_templates.rb -i $input_directory -o $output_directory

echo "Transformed files:"
tree $output_directory