# from https://github.com/dmlc/tvm/blob/master/docker/Dockerfile.ci_cpu

FROM ubuntu:16.04

RUN apt-get update --fix-missing

COPY install/ubuntu_install_core.sh /install/ubuntu_install_core.sh
RUN bash /install/ubuntu_install_core.sh

COPY install/ubuntu_install_python.sh /install/ubuntu_install_python.sh
RUN bash /install/ubuntu_install_python.sh

COPY install/ubuntu_install_python_package.sh /install/ubuntu_install_python_package.sh
RUN bash /install/ubuntu_install_python_package.sh

COPY install/ubuntu_install_llvm.sh /install/ubuntu_install_llvm.sh
RUN bash /install/ubuntu_install_llvm.sh

# Rust env (build early; takes a while)
COPY install/ubuntu_install_rust.sh /install/ubuntu_install_rust.sh
RUN bash /install/ubuntu_install_rust.sh
ENV RUSTUP_HOME /opt/rust
ENV CARGO_HOME /opt/rust

# AutoTVM deps
COPY install/ubuntu_install_redis.sh /install/ubuntu_install_redis.sh
RUN bash /install/ubuntu_install_redis.sh

# NNPACK deps
COPY install/ubuntu_install_nnpack.sh /install/ubuntu_install_nnpack.sh
RUN bash /install/ubuntu_install_nnpack.sh

ENV PATH $PATH:$CARGO_HOME/bin:/usr/lib/go-1.10/bin

# ANTLR deps
COPY install/ubuntu_install_java.sh /install/ubuntu_install_java.sh
RUN bash /install/ubuntu_install_java.sh

COPY install/ubuntu_install_antlr.sh /install/ubuntu_install_antlr.sh
RUN bash /install/ubuntu_install_antlr.sh

##########################
ARG TIMEZONE
RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    # computer vision \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN pip3 install --no-cache-dir --upgrade setuptools pip

RUN pip3 install --no-cache-dir \
    jupyterlab \
    matplotlib

WORKDIR /work

ENV PYTHONPATH ${PYTHONPATH}:/work/tvm/python:/work/tvm/topi/python:/work/tvm/nnvm/python
ENV JUPYTER_PATH ${JUPYTER_PATH}:${PYTHONPATH}
