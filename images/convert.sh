#!/bin/bash

# Define the sizes for resizing
sizes=("8" "16" "32" "64")

# Create folders for each size if they don't exist
for size in "${sizes[@]}"; do
  mkdir -p "$size"
done

# Loop through all .png files in the current directory
for file in *.png; do
  # Remove the .png extension for output file names
  base_name="${file%.png}"

  # Resize the images for each size
  for size in "${sizes[@]}"; do
    resized_file="${size}/${base_name}_${size}.png"
    
    # Resize the image and save it in the corresponding folder
    ffmpeg -i "$file" -vf "scale=${size}:${size}" "$resized_file"
    
    # Check if resizing succeeded
    if [ $? -eq 0 ]; then
      echo "Successfully resized $file to ${size} and saved as $resized_file"

      # Convert the resized image to .raw
      output_raw="${resized_file%.png}.raw"
      ffmpeg -vcodec png -i "$resized_file" -vcodec rawvideo -f rawvideo -pix_fmt rgb565 "$output_raw"

      if [ $? -eq 0 ]; then
        echo "Successfully converted $resized_file to $output_raw"
      else
        echo "Failed to convert $resized_file to .raw"
      fi
    else
      echo "Failed to resize $file to $size"
    fi
  done
done

# Combine .raw files into header files for each size and create an array of pointers
for size in "${sizes[@]}"; do
  header_file="${size}.h" # Name of the header file for this size
  echo "/* Auto-generated header file for $size images */" > "$header_file"
  
  # Initialize an array of pointers to hold references to image data arrays
  pointer_array="const unsigned char* images_${size}[] = {"
  
  # Loop through all the raw files in the size folder
  for raw_file in "$size"/*.raw; do
    base_name="${raw_file##*/}"           # Extract the filename without the path
    array_name="${base_name%.raw}_raw"    # Create array name from filename
    
    # Use xxd -i to convert raw file to a C array and append it to the header file
    xxd -i "$raw_file" >> "$header_file"
    echo "" >> "$header_file"  # Add a newline for readability

    # Add this array name to the array of pointers
    pointer_array+="\n  __${size}_${array_name},"
  done

  # Finish the array of pointers and append it to the header file
  pointer_array+="\n};"
  echo -e "$pointer_array" >> "$header_file"

  echo "Header file $header_file has been created with all $size raw files and an array of pointers."
done

# Clean up by removing the folders and their contents
for size in "${sizes[@]}"; do
  rm -r "$size"
  echo "Removed folder $size"
done
