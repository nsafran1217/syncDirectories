FROM ubuntu
RUN apt update && \
apt install -y openvpn \
cron \
rsync

RUN rm -rf /var/lib/apt/lists/*
COPY run.sh /run.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /run.sh /entrypoint.sh
CMD openvpn /etc/openvpn/client.conf
ENTRYPOINT /entrypoint.sh
