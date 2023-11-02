FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

ARG VERSION

RUN apt update && apt install -y curl build-essential git libcurl4-gnutls-dev libmediainfo-dev ffmpeg 
RUN apt install -y \
    qt5-qmake \
    qtbase5-dev \
    qtbase5-dev-tools \
    qtdeclarative5-dev \
    qtmultimedia5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    libqt5opengl5 \
    libqt5opengl5-dev \
    libqt5svg5 \
    libqt5svg5-dev \
    qml-module-qtquick-controls \
    qml-module-qtqml-models2

RUN git clone https://github.com/Komet/MediaElch.git && \
    cd MediaElch && \
    git checkout v${VERSION} && \
    git submodule update --init && \
    mkdir build && \
    cd build && \
    qmake .. && \
    make -j4 && \
    sudo make install

COPY /root /