#!/bin/bash

read -r -p "<> Docker hub username: " username
read -r -p "<> Docker hub password: " password
read -r -p "<> Image tag: " tag
read -r -p "<> Github repository: " repo

dir=${repo##*/}
image="$username/$tag"

# Clone repository
echo "<> Cloning repo $repo" > /dev/null
if ! git clone "$repo" > /dev/null
then
  echo "<> An error occurred while cloning repo $repo"
  exit 1
fi

# Build image
echo "<> Building image $image"
if ! docker build -t "$image" "$dir" > /dev/null
then
  echo "<> An error occurred while building image $image"
  exit 2
fi

# Login to Docker Hub
echo "<> Login to Docker Hub with provided credentials"
if ! echo "$password" | docker login -u "$username" --password-stdin > /dev/null
then
  echo "<> An error occurred while login to Docker Hub"
  exit 3
fi

# Publish image
echo "<> Publishing image $image to Docker Hub"
if ! docker push "$image" > /dev/null
then
  echo "<> An error occurred while pushing image $image"
  exit 4
fi

# Login to Docker Hub
echo "<> Logout from Docker Hub"
if ! docker logout > /dev/null
then
  echo "<> An error occurred while logout from Docker Hub"
  exit 5
fi

# Delete local repo directory
echo "<> Deleting directory $dir"
if ! rm -rf "$dir" > /dev/null
then
  echo "<> An error occurred while deleting directory $dir"
  exit 6
fi

# Delete new created image
echo "<> Deleting image $image"
if ! docker rmi "$image" > /dev/null
then
  echo "<> An error occurred while deleting image $image"
  exit 7
fi

echo "<> Build service created by chanioxaris exited successfully"