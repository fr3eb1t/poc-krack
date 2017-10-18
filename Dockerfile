FROM kalilinux/kali-linux-docker
LABEL maintainer "Peter Benjamin"
WORKDIR /src/poc-krack/
COPY krack.py .
RUN apt-get update \
	&& apt-get install -y \
	--no-install-recommends \
	git \
	libnl-3-dev \
	libnl-genl-3-dev \
	libssl-dev \
	net-tools \
	pkg-config \
	python-pycryptodome \
	python-scapy \
	sysfsutils \
	&& rm -rf /var/lib/apt/lists/*
RUN chmod +x krack.py
ENTRYPOINT ["/src/poc-krack/krack.py"]
