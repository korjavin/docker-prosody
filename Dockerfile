################################################################################
# Build a dockerfile for Prosody XMPP server
# Based on ubuntu
################################################################################

FROM korjavin/korjavin-base


RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        prosody

COPY ./etc/prosody/prosody.cfg.lua /etc/prosody/prosody.cfg.lua
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443 5222 5269 5347 5280 5281
CMD ["prosodyctl", "start"]
