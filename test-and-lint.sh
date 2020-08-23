clear

if [ "$1" == "docker" ]; then
  VERSION=$(cat .version | tr -t '\n' '')
  make rock
  cp "supernova-$VERSION.all.rock" "build/docker/lua-$2/supernova-$VERSION.all.rock"
  docker build "build/docker/lua-$2" --tag "supernova:lua-$2"
  docker run -it "supernova:lua-$2" lua -e "print(require('supernova').red('hello'))"
  exit
fi

if [ "$1" == "examples" ]; then
  bash _examples/lua/run.sh
  bash _examples/shell/run.sh
  bash _examples/fennel/run.sh
  exit
fi

if [ "$1" != "test" ]; then
  luacheck **/**/**/*.lua
  luacheck **/**/*.lua
  luacheck **/*.lua
  luacheck *.lua
fi

for file in **/**/*_test.lua; do
  lua "$file"
done

for file in *_test.lua; do
  lua "$file"
done
