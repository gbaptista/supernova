# docker build . --tag supernova
# docker run -it supernova lua -e "print(require('supernova').red('hello'))"

FROM nickblah/lua:5.4.0-luarocks-alpine

ADD supernova-0.0.1-1.src.rock supernova-0.0.1-1.src.rock
RUN luarocks install supernova-0.0.1-1.src.rock
