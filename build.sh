#!/usr/bin/env bash

docker build --tag sss-build .
docker run --rm --name sss-build \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v $PWD/artifacts:/repo/artifacts \
 -v $PWD/.git:/repo/.git \
 --network host \
 -e ARTIFACTORY_ACCESS_TOKEN=$ARTIFACTORY_ACCESS_TOKEN \
 sss-build \
 dotnet run -p /repo/build/build.csproj -- "$@"