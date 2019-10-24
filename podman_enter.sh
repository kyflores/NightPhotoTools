if [ $# -eq 0 ]
  then
    echo "Please supply a directory to mount at /host!"
	echo "podman_enter.sh ~/my/photos/folder"
	exit 1
fi

podman run -it --rm \
	-v $1:/host \
	--security-opt label=disable \
	--security-opt seccomp=unconfined \
	--device=/dev/kfd \
	--device=/dev/dri \
	--group-add video night_photo_tools:latest
