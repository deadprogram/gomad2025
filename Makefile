.ONESHELL:

showvideo:
	wasmvision run -p hello -logging=error --source 2 --width 1280 --height 720

clean:
	rm -rf build

builddir:
	mkdir -p build

build/videodrone:
	go build -o ./build/videodrone ./demo/videodrone/

videodrone: builddir build/videodrone
	./build/videodrone

blur:
	wasmvision run -p blur -logging=error

blurrs:
	wasmvision run -p blurrs -logging=error

blurc:
	wasmvision run -p blurc -logging=error

asciify:
	wasmvision run -p asciify -logging=error

mosaic:
	wasmvision run -p mosaic -logging=error

captions:
	wasmvision run -f ./demo/creativecaptions/config.yaml

dronestream:
	export WASMVISION_STORAGE_BOLTDB_FILENAME="facedata.db"
	wasmvision run -f ./demo/videodrone/config.toml

showfacedata:
	bbolt keys facedata.db face-counter
