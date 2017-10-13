FROM alpine:3.6
MAINTAINER Roman v. Gemmeren <strowi@hasnoname.de>

EXPOSE 3128
VOLUME ["/data"]

# Upgrade Alpine and install squid
# then point cache directory to /data
RUN apk --update-cache upgrade \
  && apk --update --no-cache add squid \
  && rm -fr /var/cache/squid \
  && ln -sf /data /var/cache/squid \
  && rm -fr /var/cache/apk/* \
    /tmp/* \
    /root/.cache \
    /root/.cached

ADD src/ /

CMD ["/docker-entrypoint.sh"]
