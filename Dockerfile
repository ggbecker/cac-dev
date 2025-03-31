FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN sudo apt-get update -q && \
        sudo apt-get install -yq \
        cmake \
        ninja-build \
        libxml2-utils \
        xsltproc \
        python3-jinja2 \
        python3-yaml \
        python3-setuptools \
        ansible-lint \
        python3-github \
        python3-pip \
        bats \
        python3-pytest \
        python3-pytest-cov \
        libdbus-1-dev libdbus-glib-1-dev libcurl4-openssl-dev \
        libgcrypt20-dev libselinux1-dev libxslt1-dev libgconf2-dev libacl1-dev libblkid-dev \
        libcap-dev libxml2-dev libldap2-dev libpcre3-dev python3-dev swig libxml-parser-perl \
        libxml-xpath-perl libperl-dev libbz2-dev librpm-dev g++ libapt-pkg-dev libyaml-dev \
        libxmlsec1-dev libxmlsec1-openssl \
        shellcheck \
        bats \
        yamllint

RUN wget https://github.com/OpenSCAP/openscap/releases/download/1.3.11/openscap-1.3.11.tar.gz

RUN tar -zxvf openscap-1.3.11.tar.gz

RUN cd openscap-1.3.11 && \
        mkdir -p build && cd build && \
        cmake -DCMAKE_INSTALL_PREFIX=/ .. && \
        sudo make install && \
        cd ../..

RUN pip install docker ansible json2html docutils==0.17.1 \
        myst-parser \
        sphinx \
        sphinx-rtd-theme \
        git+https://github.com/ggbecker/sphinxcontrib.jinjadomain.git#egg=sphinxcontrib-jinjadomain
