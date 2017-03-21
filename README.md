# Packet Forwarder
Dockerfile for [packet_forwarder](https://github.com/Lora-net/packet_forwarder) which will run packet_forwarder with default settings specified as environment variables.

### Settings which can be specified
| gateway_conf property | ENV VARIABLE |
| ---------------------- | ------------ |
| gateway_ID | $PACKET_FORWARDER_GATEWAY_ID |
| server_address | $PACKET_FORWARDER_SERVER_ADDRESS |
| serv_port_up | $PACKET_FORWARDER_SERV_PORT_UP |
| serv_port_down | $PACKET_FORWARDER_SERV_PORT_DOWN |
| keepalive_interval | $PACKET_FORWARDER_KEEPALIVE_INTERVAL |
| stat_interval | $PACKET_FORWARDER_STAT_INTERVAL |
| push_timeout_ms | $PACKET_FORWARDER_PUSH_TIMEOUT_MS |
| forward_crc_valid | $PACKET_FORWARDER_FORWARD_CRC_VALID |
| forward_crc_error | $PACKET_FORWARDER_FORWARD_CRC_ERROR |
| forward_crc_disabled | $PACKET_FORWARDER_FORWARD_CRC_DISABLED |



### Build image

`sudo docker build -t packet_forwarder_image:beta .`
### Test-Run container

`sudo docker run --name forwarder --device /dev/spidev0.0:/dev/spidev0.0 --device /dev/spidev0.1:/dev/spidev0.1 -v /sys/:/sys/ -it packet_forwarder_image:beta`
### Daemon-Run container

`sudo docker run --name forwarder --device /dev/spidev0.0:/dev/spidev0.0 --device /dev/spidev0.1:/dev/spidev0.1 --restart=on-failure -v /sys/:/sys/ packet_forwarder_image:beta`

