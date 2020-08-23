luarocks install luaunit

bash _examples/lua/run.sh
bash _examples/shell/run.sh
bash _examples/fennel/run.sh

for file in **/**/*_test.lua; do
  lua "$file"
done

for file in *_test.lua; do
  lua "$file"
done
