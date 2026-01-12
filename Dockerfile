# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl git

# Copy application files
COPY app/ /app

WORKDIR /app

# Default command when container starts
CMD ["bash"]
