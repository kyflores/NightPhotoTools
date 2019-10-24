FROM ubuntu:bionic

# Install everything for Hugin, Enblend-enfuse, and BM3D
RUN apt -y update && apt -y install \
    git wget gnupg apt-utils cmake libboost-all-dev build-essential \
    libtiff-dev libpng-dev libfftw3-dev liblcms2-dev libgsl-dev \
    libvigraimpex-dev libwxgtk3.0-dev libopenexr-dev libexiv2-dev \
    libglew-dev libpano13-dev libsqlite3-dev gettext