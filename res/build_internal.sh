#! /bin/sh

PYVER="python3.7"
set -ex

DISTRO="xenial"
SOURCES="main restricted universe multiverse"
MAIN_REPO="http://us.archive.ubuntu.com/ubuntu/"
PORT_REPO="http://us.ports.ubuntu.com/ubuntu-ports/"

cat << EOF > /etc/apt/sources.list
deb [arch=amd64] ${MAIN_REPO} ${DISTRO} ${SOURCES}
deb [arch=amd64] ${MAIN_REPO} ${DISTRO}-security ${SOURCES}
deb [arch=amd64] ${MAIN_REPO} ${DISTRO}-updates ${SOURCES}

deb [arch=arm64,armhf] ${PORT_REPO} ${DISTRO} ${SOURCES}
deb [arch=arm64,armhf] ${PORT_REPO} ${DISTRO}-security ${SOURCES}
deb [arch=arm64,armhf] ${PORT_REPO} ${DISTRO}-updates ${SOURCES}
EOF

ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
echo "$TZ" >/etc/timezone

# Add Python backport ppa
dpkg --add-architecture arm64
dpkg --add-architecture armhf
apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa

# Install tools
apt-get update
apt-get install -y \
    bison \
    build-essential \
    cmake \
    crossbuild-essential-armhf \
    crossbuild-essential-arm64 \
    file \
    flex \
    gawk \
    git \
    mingw-w64 \
    m4 \
    ninja-build \
    "$PYVER" \
    rsync \
    sudo \
    texinfo \
    wget \
    zip \
    zlib1g-dev:amd64 \
    zlib1g-dev:armhf \
    zlib1g-dev:arm64
rm -rf /var/lib/apt/lists/*

update-alternatives --install /usr/bin/python3 python3 /usr/bin/"$PYVER" 0

wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
rm get-pip.py

