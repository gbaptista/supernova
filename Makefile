VERSION=$(shell cat .version | tr -t '\n' '')

rock:
	luarocks make build/luarocks/supernova-$(VERSION).rockspec --pack-binary-rock --local

pack:
	luarocks pack build/luarocks/supernova-$(VERSION).rockspec

install:
# 	luarocks install supernova-$(VERSION).all.rock --local
	luarocks install supernova-$(VERSION).src.rock --local

uninstall:
	luarocks remove supernova --local

remove:
	luarocks remove supernova --local
