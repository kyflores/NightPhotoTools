#!/bin/bash

PROJECT_ROOT=$(pwd)

mkdir -p build/
mkdir -p build/bm3d/
mkdir -p build/enblend-enfuse/
mkdir -p build/hugin/

cd ${PROJECT_ROOT}/build/bm3d/
cmake ${PROJECT_ROOT}/bm3d/             \
    -DCMAKE_BUILD_TYPE=Release          \
    -DCMAKE_INSTALL_PREFIX=/opt/bm3d/
make -j$(nproc --ignore 1)
make install

cd ${PROJECT_ROOT}/build/enblend-enfuse/
cmake ${PROJECT_ROOT}/enblend-enfuse/   \
    -DCMAKE_BUILD_TYPE=Release          \
    -DENABLE_OPENMP=ON                  \
    -DCMAKE_INSTALL_PREFIX=/opt/enblend/
make -j$(nproc --ignore 1)
make install

cd ${PROJECT_ROOT}/build/hugin/
cmake ${PROJECT_ROOT}/hugin/            \
    -DCMAKE_BUILD_TYPE=Release          \
    -DCMAKE_INSTALL_PREFIX=/opt/hugin/
make -j$(nproc --ignore 1)
make install

echo "export PATH=$PATH:/opt/bm3d/bin:/opt/enblend/bin:/opt/hugin/bin" > \
    /etc/profile.d/night_photo_tools.sh
echo "Done! Please reload your path with: source /etc/profile.d/night_photo_tools.sh"