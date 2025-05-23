FROM golang:latest AS builder

WORKDIR /app

ADD tailscale /app/tailscale

# build modified derper
RUN cd /app/tailscale/cmd/derper && \
    CGO_ENABLED=0 /usr/local/go/bin/go build -buildvcs=false -ldflags "-s -w" -o /app/derper && \
    cd /app && \
    rm -rf /app/tailscale

FROM debian:bookworm
WORKDIR /app

# ========= CONFIG =========
# - derper args
ENV DERP_ADDR :443
ENV DERP_HTTP_PORT 80
ENV DERP_HOST=127.0.0.1
ENV DERP_CERTS=/app/certs/
ENV DERP_STUN true
ENV DERP_VERIFY_CLIENTS false
ENV DERP_HOME blank
# ==========================

# RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
#     sed -i 's|deb.debian.org|mirrors.aliyun.com/|g' /etc/apt/sources.list
# apt
RUN apt-get update
RUN apt-get install -y openssl curl

COPY build_cert.sh /app/
COPY entrypoint.sh /app/
COPY --from=builder /app/derper /app/derper

# build self-signed certs && start derper
ENTRYPOINT /app/entrypoint.sh
