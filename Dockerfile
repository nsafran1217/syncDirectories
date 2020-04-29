FROM ubuntu
RUN apt update && \
apt install -y openvpn \
cron \
rsync

RUN rm -rf /var/lib/apt/lists/*
COPY run.sh /run.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /run.sh /entrypoint.sh
RUN chmod 600 /config/key
CMD openvpn /config/client.conf
ENTRYPOINT /entrypoint.sh
