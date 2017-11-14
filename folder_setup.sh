#!/bin/bash
echo "This will create a 'wyncode' folder in your Desktop"

mkdir ~/Desktop/wyncode

for unit in 'ruby-basic' 'ruby-advanced' 'web-basic' 'web-advanced-and-javascript' 'rails-basic' 'rails-2' 'javascript-advanced-and-web-security' 'rails-advanced'
do
  mkdir ~/Desktop/wyncode/$unit
  echo "Created a folder for: $unit!"
done
