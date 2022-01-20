!#/bin/bash
chown debian-tor:debian-tor /var/lib/tor/hidden_service;
chmod 2700 /var/lib/tor/hidden_service;
service tor start;
service ssh start;
while [ ! -f /var/lib/tor/hidden_service/hostname ]; do sleep 1; done
cat /var/lib/tor/hidden_service/hostname;
sleep infinity;
