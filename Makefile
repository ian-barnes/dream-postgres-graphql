.PHONY: help
help:  # from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean:  ## Clean up
	dune clean

.PHONY: check
check:  ## Build and check
	dune build @check

.PHONY: format
format:  ## Reformat with Ocamlformat
	dune build @fmt --auto-promote

.PHONY: server
server:  ## Run the server
	dune exec main
