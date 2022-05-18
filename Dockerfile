FROM --platform=linux/arm/v7 arm32v7/ubuntu:latest

RUN apt-get update && apt-get install -y make \
    gcc \
    g++ \
    curl \
    python3 \
    build-essential \
    autoconf \
    automake \
    gdb \
    git \
    libffi-dev \
    zlib1g-dev \
    libssl-dev

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt install nodejs -y

RUN npm install -g pkg

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]