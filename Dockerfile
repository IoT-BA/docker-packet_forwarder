FROM resin/rpi-raspbian:latest
RUN apt-get -y update
RUN apt-get -y install \
	gcc \
	build-essential \
	wget \
	make
ENV PACKET_FORWARDER_VERSION 3.1.0
#packet forwarder for imst iC880A
WORKDIR /opt

##  driver / hardware abstraction layer source
RUN wget https://github.com/Lora-net/lora_gateway/archive/v4.1.3.tar.gz
RUN tar zxf v4.1.3.tar.gz
## the packet_forwarder source
RUN wget https://github.com/Lora-net/packet_forwarder/archive/v3.1.0.tar.gz
RUN tar zxf v3.1.0.tar.gz

## repo with scripts
RUN wget https://github.com/dejwoo/packet_forwarder-scripts/archive/v0.3.tar.gz
RUN tar zxf v0.3.tar.gz
RUN ["mv","lora_gateway-4.1.3", "lora_gateway"]
RUN ["mv","packet_forwarder-3.1.0", "packet_forwarder"]

## build driver/HAL
WORKDIR /opt/lora_gateway
RUN make all

## build packet_forwarder
WORKDIR /opt/packet_forwarder

RUN make all

WORKDIR /opt/packet_forwarder/lora_pkt_fwd/
RUN cp /opt/packet_forwarder-scripts-0.3/set_config.sh /opt/packet_forwarder-scripts-0.3/reset.sh /opt/packet_forwarder/lora_pkt_fwd/
RUN ["rm","-fv", "local_conf.json"]
RUN chmod u+x reset.sh
RUN chmod u+x set_config.sh
CMD ./set_config.sh && ./lora_pkt_fwd

