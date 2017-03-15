#!/bin/bash -e

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -d|--directory)
    DIRECTORY="$2"
    shift # past argument
    ;;
    -i|--image)
    IMAGE="$2"
    shift
    ;;
    *)
    ;;
esac
shift # past argument or value
done

if [ -z "$IMAGE" ]; then
    echo "image file needs to be specified using --image"
    exit 1
fi

if [ -z "$DIRECTORY" ]; then
    echo "JUPYTER_WHALE_SRC=./" > .env
    echo "notebook directory is $(pwd)"
else
    echo "JUPYTER_WHALE_SRC=$DIRECTORY" > .env
    echo "notebook directory is $DIRECTORY"
fi

echo "Starting docker"
docker-compose up $IMAGE

rm .env
