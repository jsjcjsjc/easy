#!/bin/bash
apt-get update && apt-get install -y curl wget unzip screen nginx && \
cd ~ && \
curl -sSL https://get.docker.com | sh && \
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \
rm -rf domain-scan-docker && \
rm -rf domain-scan-docker.zip && \
wget https://cloud.g60.net/d/cloud/domain/domain-scan-docker.zip && \
unzip domain-scan-docker.zip && \
rm domain-scan-docker.zip && \
cd domain-scan-docker && \
cp *.conf /etc/nginx/conf.d/ && \
sed -i '1c user root;' /etc/nginx/nginx.conf && \
service docker start && \
docker-compose build && \
docker-compose up -d && \
service nginx restart && \
touch ~/domain-scan-docker.ok
