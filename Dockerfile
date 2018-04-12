FROM debian
MAINTAINER Renato Orgito

COPY run.sh /run.sh
RUN chmod 0755 /run.sh
RUN apt-get update && \
    apt-get install -y openconnect iptables && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* 

ENTRYPOINT ["/run.sh"]