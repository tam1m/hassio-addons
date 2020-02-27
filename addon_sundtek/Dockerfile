ARG BUILD_FROM=hassioaddons/ubuntu-base:5.0.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64

RUN ARCH="${BUILD_ARCH}" \
 && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
 && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="armhf"; fi 

#RUN apt-get update \
# && apt-get install -y --no-install-recommends wget 
 
#RUN rm -fr \
#    /tmp/* \
#    /var/{cache,log}/* \
#    /var/lib/apt/lists/*
        
RUN curl http://www.sundtek.de/media/sundtek_netinst.sh -o sundtek_netinst.sh \
 && chmod 777 sundtek_netinst.sh \
 && ./sundtek_netinst.sh -netinst -easyvdr \
 && /opt/bin/mediaclient --installstreamer 
 
 
# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
    

# Labels
LABEL \
    io.hass.name="Sundtek TV" \
    io.hass.description="Stuntek TV Streaming Server" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="t.baschour <example@example.com>" \
    org.label-schema.description="Stuntek TV Streaming Server" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Sundtek TV" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="" \
    org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="" \
    org.label-schema.vendor="Community Hass.io Add-ons"
