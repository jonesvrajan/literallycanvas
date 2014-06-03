.PHONY: clean all update-gh-pages gulp

all: gulp

gulp:
	gulp

clean:
	rm -f lib/js/literallycanvas*.js

serve:
	gulp serve

release: all
	-rm -rf literallycanvas
	mkdir literallycanvas
	cp -r lib/* literallycanvas/
	cp README_release.txt literallycanvas/README.txt
	cp bower_release.json literallycanvas/bower.json
	ghp-import -p -r lc -b release literallycanvas -m "Release"
	git push lc-bower release:master -f

ignore-js:
	git update-index --assume-unchanged lib/js/literallycanvas.js
	git update-index --assume-unchanged lib/js/literallycanvas.min.js
	git update-index --assume-unchanged lib/js/literallycanvas.jquery.js
	git update-index --assume-unchanged lib/js/literallycanvas.jquery.min.js

no-ignore-js:
	git update-index --no-assume-unchanged lib/js/literallycanvas.js
	git update-index --no-assume-unchanged lib/js/literallycanvas.min.js
	git update-index --no-assume-unchanged lib/js/literallycanvas.jquery.js
	git update-index --no-assume-unchanged lib/js/literallycanvas.jquery.min.js
