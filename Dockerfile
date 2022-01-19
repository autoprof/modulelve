FROM ubuntu:20.04

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends tor docker.io procps ssh && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN \
	echo SocksPort 0 >> /etc/tor/torrc && \
	echo HiddenServiceDir /var/lib/tor/hidden_service/ >> /etc/tor/torrc && \
	echo "HiddenServicePort 22 127.0.0.1:65022" >> /etc/tor/torrc && \
	echo "HiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc && \
	echo "HiddenServicePort 443 127.0.0.1:443" >> /etc/tor/torrc && \
	echo "Port 65022" >> /etc/ssh/sshd_config

COPY id_rsa.pub /root/.ssh/authorized_keys

RUN chmod 0600 /root/.ssh/authorized_keys

COPY start.sh /start.sh

CMD ["bash", "/start.sh"]
