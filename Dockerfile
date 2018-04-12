FROM debian
MAINTAINER Haoling

RUN apt-get update && \
    apt-get install -y openconnect iptables && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* 
COPY run.sh /run.sh
RUN chmod 0755 /run.sh

ENTRYPOINT ["/run.sh"]
