
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl git

COPY app/ /app

WORKDIR /app

CMD ["bash"]
