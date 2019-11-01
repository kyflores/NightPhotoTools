FROM rocm/dev-ubuntu-18.04

# Install everything for Hugin, Enblend-enfuse, and BM3D
RUN apt -y update && apt -y install \
    git apt-utils cmake libboost-all-dev  \
    libtiff-dev libpng-dev libfftw3-dev liblcms2-dev libgsl-dev \
    libvigraimpex-dev libwxgtk3.0-dev libopenexr-dev libexiv2-dev \
    libglew-dev libpano13-dev libsqlite3-dev gettext gdb kmod imagemagick

COPY bm3d/ /build/bm3d
COPY enblend-enfuse/ /build/enblend-enfuse
COPY hugin/ /build/hugin
COPY build_project.sh /build/build_project.sh

RUN cd /build && bash build_project.sh
