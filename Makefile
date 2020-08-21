rock:
	luarocks make build/luarocks/supernova-0.0.1-1.rockspec --pack-binary-rock --local

install:
	luarocks install supernova-0.0.1-1.all.rock --local

uninstall:
	luarocks remove supernova --local

remove:
	luarocks remove supernova --local
