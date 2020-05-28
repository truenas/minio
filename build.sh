#!/bin/sh -ex
VERSION=2020-05-16T01-33-21Z
wget http://dl.min.io/server/minio/release/linux-amd64/archive/minio.RELEASE.$VERSION -O minio
wget http://dl.min.io/server/minio/release/linux-amd64/archive/minio.RELEASE.$VERSION.sha256sum -O sha256sum
if [ "$(sha256sum minio | cut -f 1 -d ' ')" != "$(cat sha256sum | cut -f 1 -d ' ')" ];
then
    echo "Checksum verification failed"
    exit 1
fi
chmod +x minio
