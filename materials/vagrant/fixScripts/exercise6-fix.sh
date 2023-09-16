# Extract the destination path from the last argument
destination=${!#}
# Get the hostname
hostname=$(hostname)
# Set the destination server based on the hostname
if [ "$hostname" = "server1" ]; then
  dest_server="server2"
elif [ "$hostname" = "server2" ]; then
  dest_server="server1"
else
  echo "unknown host"
  exit 1
fi
# Get the list of files to copy
files=${@:1:$#-1}
# Initialize the total bytes copied
total_bytes=0
# Loop through each file
for file in $files; do
  # Check if the file exists
  if [ -f "$file" ]; then
    # Copy the file to the destination path
    scp -r "$file" "vagrant@$dest_server:$destination"
    # Get the file size and add it to the total bytes copied
    file_size=$(stat -c%s "$file")
    total_bytes=$((total_bytes + file_size))
  else
    echo "$file file does not exist"
  fi
done
# Print the total number of bytes copied
echo $total_bytes