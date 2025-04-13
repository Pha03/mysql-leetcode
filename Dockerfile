# Use the same base image as your original compose file
FROM ubuntu:latest

# Install dependencies with cleanup
RUN apt-get update && \
    apt-get install -y \
    git curl wget \
    build-essential \
    python3 python3-pip python3-venv \
    openssh-client
