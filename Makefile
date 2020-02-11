SHELL := bash -eu -o pipefail -c
.DELETE_ON_ERROR:

# ---

image-name := gtramontina/diagrams
tag = $(shell cat pyproject.toml | grep -e "^diagrams =" | awk -F '"' '{print $$2}')

# ---

build.log: pyproject.toml Dockerfile Makefile
	@docker build -t $(image-name):$(tag) . | tee $@
to-clobber += $(image-name):$(tag)
to-clean += build.log

test.log: build.log
	@(cat sample.py | docker run -v $(PWD)/out:/out -i --rm $(image-name):$(tag)) &&\
	(file out/sample.png | grep "PNG image data") | tee $@
to-clean += test.log
to-clean += ./out

# ---

.PHONY: build
build: build.log

.PHONY: test
test: test.log

.PHONY: push
push: test
	@docker push $(image-name):$(tag)

.PHONY: clean
clean:; @rm -rf $(to-clean)

.PHONY: clobber
clobber: clean
	@docker rmi $(to-clobber) --force
