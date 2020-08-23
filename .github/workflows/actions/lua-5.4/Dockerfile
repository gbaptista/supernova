FROM nickblah/lua:5.4-luarocks-alpine AS builder

RUN apk add --update --no-cache wget gnupg

RUN wget https://fennel-lang.org/downloads/fennel-0.5.0
RUN wget https://fennel-lang.org/downloads/fennel-0.5.0.asc

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 808A33D379C806C3
RUN gpg --verify fennel-0.5.0.asc

RUN cp fennel-0.5.0 /usr/bin/fennel
RUN chmod +x /usr/bin/fennel

FROM nickblah/lua:5.4-luarocks-alpine

RUN apk add bash gcc libc-dev --update --no-cache

COPY --from=builder /usr/bin/fennel /usr/bin/fennel

# Validation
RUN lua -v && \
  luarocks --version && \
  luarocks install argparse && \
  lua -e "require 'argparse'" && \
  luarocks remove argparse && \
  fennel --version && \
  fennel -e '"Fennel successfully installed."'

ADD luaunit-3.3-1.all.rock luaunit-3.3-1.all.rock
RUN luarocks install luaunit-3.3-1.all.rock

RUN luarocks install luacheck

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
