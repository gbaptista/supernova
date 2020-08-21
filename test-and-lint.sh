clear

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
