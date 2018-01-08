FROM alpine:3.7
RUN apk add --no-cache iptables
COPY iptables.sh /
CMD ["/iptables.sh"]
LABEL org.mobyproject.config='{"net": "host", "capabilities": ["CAP_NET_ADMIN", "CAP_NET_RAW"]}'
