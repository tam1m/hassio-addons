ARG BUILD_FROM=hassioaddons/base:7.0.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64

RUN ARCH="${BUILD_ARCH}" \
 && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
 && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="armhf"; fi 

RUN apk add --update unzip nano perl perl-utils perl-dev perl-libwww perl-io-socket-ssl net-tools alpine-sdk


# Install Perl Stuff
RUN  cpan install JSON \
 && cpan install Data::Dumper \
 && cpan install Time::Piece \
 && cpan install LWP \
 && cpan install LWP::Simple \
 && cpan install LWP::UserAgent \
 && cpan install LWP::Protocol::https \
 && cpan install HTTP::Daemon \
 && cpan install HTTP::Status \
 && cpan install HTTP::Request::Params \
 && cpan install HTTP::Request::Common \
 && cpan install HTTP::Cookies \
 && cpan install HTML::TreeBuilder \
 && cpan install URI::Escape \
 && cpan install IO::Interface::Simple \
 && cpan install IO::Socket::SSL \
 && cpan install IO:Tee \
 && cpan install Log::Log4perl \
 && cpan install Mozilla::CA \
 && cpan install Encode \
 && cpan install POSIX \
 && cpan install utf8
  
ARG version="0.3.1"

RUN cd ~ \
 && curl "https://github.com/sunsettrack4/telerising/archive/v${version}.zip" -L -o v${version}.zip \
 && unzip v${version}.zip \
 && mv telerising-${version}/ ~/telerising/ \
 && chmod 0777 ~/telerising \
 && chmod 0777 ~/telerising/* 


# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
    

# Labels
LABEL \
    io.hass.name="1&1 TV" \
    io.hass.description="1&1 TV" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="t.baschour <example@example.com>" \
    org.label-schema.description="1&1 TV" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="1&1 TV" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="" \
    org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="" \
    org.label-schema.vendor="Community Hass.io Add-ons"

