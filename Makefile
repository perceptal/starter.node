REPORTER = spec

test:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		-R $(REPORTER)