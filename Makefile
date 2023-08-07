UK_ROOT ?= $(PWD)/.unikraft/unikraft
UK_LIBS ?= $(PWD)/.unikraft/libs

LIBS := $(UK_LIBS)/compiler-rt:$(UK_LIBS)/libunwind:$(UK_LIBS)/libgo:$(UK_LIBS)/musl:$(UK_LIBS)/lwip

all:
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS)

$(MAKECMDGOALS):
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS) $(MAKECMDGOALS)
