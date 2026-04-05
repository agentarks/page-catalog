RUBY ?= ruby

.PHONY: validate test catalog

validate: test catalog

test:
	$(RUBY) test/validate_catalog_test.rb

catalog:
	$(RUBY) scripts/validate_catalog.rb .
