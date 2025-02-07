# cSpell: words procps iputils dearmor keyrings awscliv

# Last version check on 07 Feb 2025.

FROM node:22.13.1
# This is an LTS version.
# Newer versions may be available at https://nodejs.org/en/
# [Manfred]


################################################################################
# Install prerequisites and utilities
RUN apt-get update
RUN apt-get install -y \
    lsb-release \
    procps \
    iputils-ping \
    net-tools
# lsb_release: use lsb_release -a to show the linux version used by the dev container
# procps: to support command 'ps'
# iputils-ping: to support command 'ping'
#    See: https://linuxconfig.org/ping-command-not-found-on-ubuntu-20-04-focal-fossa-linux
# net-tools: to support commands such as 'arp', 'ifconfig', 'netstat', etc.
#    See: https://helpmanual.io/packages/apt/net-tools/
# [Manfred]


################################################################################
# Replace npm with pnpm
RUN npm install -g pnpm@10.2.1
# Newer versions may be available at https://www.npmjs.com/search?q=pnpm
RUN npm uninstall npm -g
# In case the previous uninstall command doesn't work, other options are described at
# https://docs.npmjs.com/cli/v7/using-npm/removal
# [Manfred]
# Set env variables required for pnpm:
ENV PNPM_HOME=/usr/local/share/pnpm
ENV PATH=$PNPM_HOME:$PATH
# Create the directory for global packages
RUN mkdir -p $PNPM_HOME


################################################################################
# Install stryker
RUN pnpm add --global stryker-cli@1.0.2
# Newer versions may be available at https://www.npmjs.com/search?q=stryker-cli


################################################################################
# Optional tools
#
# Comment in as needed. Some may require additional config files.
################################################################################



################################################################################
# Install OPA
# WORKDIR /usr/local/bin
# RUN curl -L -o opa https://openpolicyagent.org/downloads/v1.0.0/opa_linux_amd64_static
# RUN chmod 755 ./opa
# # Newer versions may be available at https://www.openpolicyagent.org/docs/latest/#1-download-opa
# # or for other architectures such as ARM: https://github.com/open-policy-agent/opa/releases


################################################################################
# Install nginx
# Instructions for Debian from: https://nginx.org/en/linux_packages.html
# RUN apt-get install -y \
#     gnupg2 \
#     ca-certificates \
#     debian-archive-keyring
# RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
#     | tee /usr/share/keyrings/nginx-archive-keyring.gpg > /dev/null
# RUN gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
# RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
#     http://nginx.org/packages/debian `lsb_release -cs` nginx" \
#     | tee /etc/apt/sources.list.d/nginx.list
# RUN apt-get update
# RUN apt-get install -y nginx

# COPY nginx.conf /etc/nginx/conf.d/nginx-keycloak.conf


################################################################################
# Install AWS CLI
# RUN apt-get install -y \
#     unzip \
#     curl
# # Download and install AWS CLI v2
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
#     unzip awscliv2.zip && \
#     ./aws/install && \
#     rm -rf aws awscliv2.zip
