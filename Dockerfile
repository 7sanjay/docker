# Dockerfile
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl git
WORKDIR /app
COPY app/ /app
CMD ["bash"]
