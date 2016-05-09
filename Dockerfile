FROM ubuntu:14.04.4

MAINTAINER gennady.trafimenkov@gmail.com

RUN apt-get update \
 && apt-get install -y libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev libboost-dev \
 && apt-get install -y wget \
 && apt-get install -y build-essential \
 && apt-get install -y libav-tools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/acaudwell/Logstalgia/releases/download/logstalgia-1.0.7/logstalgia-1.0.7.tar.gz \
  && tar -xzf logstalgia-1.0.7.tar.gz \
  && cd logstalgia-1.0.7 \
  && ./configure \
  && make \
  && make install \
  && cd .. && rm -rf logstalgia-1.0.7 logstalgia-1.0.7.tar.gz

# We don't specify entry point because it will be harder to run video encoding (need to call bash with parameters)
# ENTRYPOINT ["/usr/local/bin/logstalgia"]
