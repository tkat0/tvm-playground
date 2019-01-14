FROM ubuntu:16.04

# from 3rdparty/tvm/docker/Dockerfile.demo_android

RUN apt-get update --fix-missing

# TODO docker-compose.ymlのbuild-argsでon/off指定可能に
COPY install/ubuntu_install_core.sh /install/ubuntu_install_core.sh
RUN bash /install/ubuntu_install_core.sh

COPY install/ubuntu_install_python.sh /install/ubuntu_install_python.sh
RUN bash /install/ubuntu_install_python.sh

COPY install/ubuntu_install_python_package.sh /install/ubuntu_install_python_package.sh
RUN bash /install/ubuntu_install_python_package.sh

COPY install/ubuntu_install_java.sh /install/ubuntu_install_java.sh
RUN bash /install/ubuntu_install_java.sh

COPY install/ubuntu_install_llvm.sh /install/ubuntu_install_llvm.sh
RUN bash /install/ubuntu_install_llvm.sh

COPY install/ubuntu_install_gradle.sh /install/ubuntu_install_gradle.sh
RUN bash /install/ubuntu_install_gradle.sh

COPY install/ubuntu_install_androidsdk.sh /install/ubuntu_install_androidsdk.sh
RUN bash /install/ubuntu_install_androidsdk.sh

COPY install/ubuntu_install_vulkan.sh /install/ubuntu_install_vulkan.sh
RUN bash /install/ubuntu_install_vulkan.sh

COPY install/ubuntu_install_redis.sh /install/ubuntu_install_redis.sh
RUN bash /install/ubuntu_install_redis.sh

##########################

RUN /opt/android-sdk-linux/ndk-bundle/build/tools/make-standalone-toolchain.sh \
    --platform=android-24 --use-llvm --arch=arm64 --install-dir=/opt/android-toolchain-arm64
ENV TVM_NDK_CC /opt/android-toolchain-arm64/bin/aarch64-linux-android-g++

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    # misc \
    tzdata \
    ca-certificates \
    curl \
    # computer vision \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

ARG TIMEZONE
RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

RUN pip3 install --no-cache-dir --upgrade setuptools pip

RUN pip3 install --no-cache-dir \
    cupy-cuda90==5.1.0 \
    chainer==5.1.0

WORKDIR /work

ENV PYTHONPATH ${PYTHONPATH}:/work/3rdparty/tvm/python:/work/3rdparty/tvm/topi/python:/work/3rdparty/nnvm/python
ENV JUPYTER_PATH ${PYTHONPATH}:${JUPYTER_PATH}
