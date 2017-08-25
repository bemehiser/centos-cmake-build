FROM centos:centos7

RUN yum update -y
RUN yum install -y \
    gperf \
    golang \
    ruby \
    gcc-g++ \
    libuuid-devel \
    libxml2-devel \
    wget \
    which

# Python 3
RUN yum -y install yum-utils
RUN yum -y groupinstall development
RUN yum -y install 'https://centos7.iuscommunity.org/ius-release.rpm'
RUN yum -y install \
    python36u \
    python36u-pip \
    python36u-devel
RUN ln -s /usr/bin/pydoc3.6 /usr/bin/pydoc3 && \
    ln -s /usr/bin/python3.6 /usr/bin/python3

# CMake
RUN mkdir -p /tmp/cmake && \
    pushd /tmp/cmake && \
    wget 'https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.sh' && \
    bash cmake-3.9.1-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir && \
    popd && \
    rm -rf /tmp/cmake

RUN yum clean all

# Build directory
RUN mkdir -p /src
WORKDIR /src
