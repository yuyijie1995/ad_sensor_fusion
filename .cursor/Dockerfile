FROM osrf/ros:melodic-desktop-full

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        curl \
        build-essential \
        cmake \
        software-properties-common \
        libceres-dev \
        libgoogle-glog-dev \
        libgflags-dev \
        xvfb \
        imagemagick \
        x11-utils \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libgtsam-dev \
        libgtsam-unstable-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL -o /usr/local/bin/curl \
        https://github.com/moparisthebest/static-curl/releases/download/v8.7.1/curl-amd64 \
    && chmod +x /usr/local/bin/curl \
    && hash -r \
    && curl --version | head -1

RUN git clone --depth 1 -b v0.4.0 https://github.com/google/glog.git /tmp/glog \
    && cd /tmp/glog \
    && cmake -H. -Bbuild -DBUILD_SHARED_LIBS=ON -DWITH_GFLAGS=ON -DBUILD_TESTING=OFF \
    && cd build && make -j"$(nproc)" install \
    && ldconfig \
    && rm -rf /tmp/glog

RUN echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc \
    && echo '[ -f "$HOME/catkin_ws/devel/setup.bash" ] && source "$HOME/catkin_ws/devel/setup.bash"' >> /root/.bashrc
