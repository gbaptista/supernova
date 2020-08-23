# docker build . --tag supernova
# docker run -it supernova lua -e "print(require('supernova').red('hello'))"

FROM nickblah/lua:5.1-luarocks-alpine

ADD supernova-0.0.2-1.all.rock supernova-0.0.2-1.all.rock
RUN luarocks install supernova-0.0.2-1.all.rock
