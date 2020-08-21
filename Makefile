rock:
	luarocks make build/luarocks/supernova-0.0.1-1.rockspec --pack-binary-rock --local

pack:
	luarocks pack build/luarocks/supernova-0.0.1-1.rockspec

install:
# 	luarocks install supernova-0.0.1-1.all.rock --local
	luarocks install supernova-0.0.1-1.src.rock --local

uninstall:
	luarocks remove supernova --local

remove:
	luarocks remove supernova --local
