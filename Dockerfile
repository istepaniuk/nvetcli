FROM debian:13.3-slim

RUN apt-get update -qq && apt-get install -qq \
	debhelper \
    dh-python \
	pip \
    git \
    python3-setuptools

COPY . /build
WORKDIR /build

RUN make release
RUN make deb

RUN cd /build/dist/ && apt install ./*.deb -y
RUN nvmetcli
