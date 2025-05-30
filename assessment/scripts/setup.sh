#!/bin/bash
set -euo pipefail

# Logging
exec > >(tee /var/log/wazuh_setup.log|logger -t user-data -s 2>/dev/console) 2>&1

# Install Docker
yum update -y
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Deploy Wazuh
mkdir -p /opt/wazuh
cd /opt/wazuh
curl -sO https://packages.wazuh.com/4.6/docker-compose/docker-compose.yml

# Adjust file if needed
docker-compose up -d

# Enable basic audit logging
yum install -y audit
systemctl enable auditd
systemctl start auditd
