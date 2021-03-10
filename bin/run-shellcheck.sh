#!/bin/bash

docker run --rm -v "$PWD:/mnt" koalaman/shellcheck:latest -P ./bin/ -x ./*.sh
docker run --rm -v "$PWD:/mnt" koalaman/shellcheck:latest -P ./bin/ -x ./**/*.sh
