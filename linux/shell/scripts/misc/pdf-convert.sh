#!/bin/bash
# Convert all markdown files in directory into pdf with pandoc

find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "${0%.md}.pdf"' {} \;
