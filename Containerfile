# Use the Fedora base image
FROM quay.io/fedora/fedora:latest

# Install network tools
RUN dnf install -y \
    iputils \
    curl \
    traceroute \
    net-tools \
    tcpdump \
    bind-utils \
    openssl \
    && dnf clean all

# Set a default command to keep the container running
CMD ["sleep", "infinity"]
