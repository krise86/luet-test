ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DESTINATION?=$(ROOT_DIR)/build
SUDO?=sudo
TREE?=$(ROOT_DIR)/packages
COMPRESSION?=gzip
TARGET_ONLY?=y
BUILD_ARGS?=
LUET?=/usr/bin/luet

ifneq ($(strip $(TARGET_ONLY)),)
	BUILD_ARGS+=--only-target-package
endif

.PHONY: a
a:
	mkdir -p $(DESTINATION)
	$(SUDO) $(LUET) build a --tree=$(TREE) --destination $(DESTINATION) --backend docker --compression $(COMPRESSION) $(BUILD_ARGS)

.PHONY: b
b:
	mkdir -p $(DESTINATION)
	$(SUDO) $(LUET) build b --tree=$(TREE) --destination $(DESTINATION) --backend docker --compression $(COMPRESSION) $(BUILD_ARGS)

.PHONY: c
c:
	mkdir -p $(DESTINATION)
	$(SUDO) $(LUET) build c --tree=$(TREE) --destination $(DESTINATION) --backend docker --compression $(COMPRESSION) $(BUILD_ARGS)

.PHONY: d
d:
	mkdir -p $(DESTINATION)
	$(SUDO) $(LUET) build d --tree=$(TREE) --destination $(DESTINATION) --only-target-package --backend docker --compression $(COMPRESSION) $(BUILD_ARGS)