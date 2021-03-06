NPM = ./node_modules
all: $(NPM)
	./node_modules/.bin/tsc -d -p ./ --outDir dist/
	cp dist/*.d.ts .

$(NPM):
	npm install

protractor-build: $(NPM)
	./node_modules/.bin/tsconfig tests/e2e/
	./node_modules/.bin/tsc -p tests/e2e/ --outDir tests/e2e/dest 

protractor-run: protractor-build $(NPM)
	./node_modules/.bin/protractor tests/e2e/dest/protractor.conf.js
