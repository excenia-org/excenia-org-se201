all: dist

clean: bootstrap-clean

distclean: clean bootstrap-clean
	rm -Rf ./css/bootstrap*
	rm -Rf ./fonts/glyphicons-halflings-regular.*
	rm -Rf ./js/bootstrap*

bootstrap-clean:
	rm -Rf ./bootstrap/dist/
	rm -Rf ./bootstrap/node_modules/

compile: bootstrap-compile

bootstrap-compile:
	cd bootstrap; npm install
	cd bootstrap; grunt dist

test: bootstrap-test

bootstrap-test:
	cd bootstrap; grunt test

dist: compile test
	cp ./bootstrap/dist/css/* ./css/
	mkdir ./fonts/
	cp ./bootstrap/dist/fonts/* ./fonts/
	cp ./bootstrap/dist/js/* ./js/

.PHONY: bootstrap-compile
