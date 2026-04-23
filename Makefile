# Use bash instead of the default /bin/sh
SHELL := /bin/bash

# -e: exit on error
# -u: exit on undefined variable
# -o pipefail: pipeline fails if any command in it fails
.SHELLFLAGS := -eu -o pipefail -c

DIST := dist
INCLUDE := include
STATIC := static
SRC := src

STATIC_FILES := $(shell find $(STATIC) -type f -name \*)
STATIC_OUT := $(patsubst $(STATIC)/%, $(DIST)/%, $(STATIC_FILES))

DEFAULT_INCLUDES := $(INCLUDE)/sugar.m4 $(INCLUDE)/html.m4
INCLUDES := $(shell find $(INCLUDE) -name "*.m4")

SRCS_HTML_M4 := $(shell find $(SRC) -name "*.html.m4")
SRCS := $(shell find $(SRC) -name "*.m4")

PAGES := $(patsubst $(SRC)/%.html.m4, $(DIST)/%.html, $(SRCS_HTML_M4)) $(patsubst $(SRC)/%.html.m4, $(DIST)/en/%.html, $(SRCS_HTML_M4))

# # Not using tidy because it adds an unwanted line break between <li> and <a>,
# # breaking the display of navigation menus.
# FORMAT = tidy -mqi --doctype omit --show-warnings no --vertical-space no --wrap 0 -config .tidyrc
FORMAT = sed -e "/^[[:space:]]*$$/d" -e "s/^[[:space:]]*//"
M4 = m4 -P -I$(INCLUDE) -I$(SRC) $(DEFAULT_INCLUDES) -D__STATIC__=$(DIST) -D__SRC__=$(SRC)
WATCH = entr -r

.PHONY: all
all: $(STATIC_OUT) $(PAGES)

.PHONY: clean
clean:
	rm -rf $(DIST)

.PHONY: publish
publish: all
	./publish.sh $(DIST)

.PHONY: publish-force
publish-force: all
	FORCE_COMMIT=1 ./publish.sh $(DIST)

.PHONY: watch
watch: all
	@echo Watching...
	@echo $(STATIC_FILES) $(INCLUDES) $(SRCS) | tr " " "\n" | $(WATCH) make

$(DIST):
	@mkdir -p $@

$(DIST)/%: $(STATIC)/% | $(DIST)
	@mkdir -p $(@D)
	@echo Copying $< to $@
	@cp -r $< $@

$(DIST)/en/cv.html: $(SRC)/cv.html.m4 $(SRC)/cv/education.m4 $(SRC)/cv/additional.m4 $(SRC)/cv/professional.m4 $(INCLUDES) | $(DIST)
$(DIST)/en/etc.html: $(SRC)/etc.html.m4 $(SRC)/etc/other.m4 $(SRC)/etc/programming.m4 $(SRC)/etc/talks.m4 $(INCLUDES) | $(DIST)
$(DIST)/en/%.html: $(SRC)/%.html.m4 $(INCLUDES) | $(DIST)
	@echo Building $@ from $<
	@set -o pipefail; $(M4) -D__FILE__=$*.html -D__DIR__=$(@D) -D__SRC_DIR__=$(<D) -DENGLISH $< | $(FORMAT) > $@

$(DIST)/cv.html: $(SRC)/cv.html.m4 $(SRC)/cv/education.m4 $(SRC)/cv/additional.m4 $(SRC)/cv/professional.m4 $(INCLUDES) | $(DIST)
$(DIST)/etc.html: $(SRC)/etc.html.m4 $(SRC)/etc/other.m4 $(SRC)/etc/programming.m4 $(SRC)/etc/talks.m4 $(INCLUDES) | $(DIST)
$(DIST)/%.html: $(SRC)/%.html.m4 $(INCLUDES) | $(DIST)
	@echo Building $@ from $<
	@set -o pipefail; $(M4) -D__FILE__=$*.html -D__DIR__=$(@D) -D__SRC_DIR__=$(<D) $< | $(FORMAT) > $@
