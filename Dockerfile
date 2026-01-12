# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install curl (example package)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy app folder into container
COPY app/ /app

# Set working directory
WORKDIR /app

# Default command
CMD ["bash"]
