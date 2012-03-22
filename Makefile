REPORTER = spec

test:
	@NODE_ENV=test ./node_modules/bin/mocha \
		-R $(REPORTER)