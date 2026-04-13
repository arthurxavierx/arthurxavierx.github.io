INCLUDE := include
PUBLIC := public
SRC := src

HTML_M4 := $(INCLUDE)/html.m4
SUGAR_M4 := $(INCLUDE)/sugar.m4
INCLUDES := $(shell find $(INCLUDE) -name "*.m4")

PAGES := \
	$(PUBLIC)/bio.html \
	$(PUBLIC)/cv.html \
	$(PUBLIC)/etc.html \
	$(PUBLIC)/index.html \
	$(PUBLIC)/music.html \
	$(PUBLIC)/portfolio.html \
	$(PUBLIC)/text.html
PAGES_EN := $(patsubst $(PUBLIC)/%.html,$(PUBLIC)/en/%.html,$(PAGES)) $(PUBLIC)/en/cv.tech.html
SRCS := $(shell find $(SRC) -name "*.m4")

# # Not using tidy because it adds an unwanted line break between <li> and <a>,
# # breaking the display of navigation menus.
# FORMAT = tidy -mqi --doctype omit --show-warnings no --vertical-space no --wrap 0 -config .tidyrc
FORMAT = sed -e "/^[[:space:]]*$$/d" -e "s/^[[:space:]]*//"
M4 = m4 -P -I$(INCLUDE) -I$(SRC) $(SUGAR_M4) $(HTML_M4)
WATCH = entr -r

.PHONY: all
all: $(PAGES) $(PAGES_EN)

.PHONY: clean
clean:
	rm $(PAGES) $(PAGES_EN)

.PHONY: watch
watch: $(PAGES) $(PAGES_EN)
	@echo Watching...
	@echo $(INCLUDES) $(SRCS) | tr " " "\n" | $(WATCH) make

$(PUBLIC)/en/cv.tech.html: $(SRC)/cv.tech.html
	@echo Building $@ from $<
	@cp $< $@

$(PUBLIC)/en/cv.html: $(SRC)/cv.html.m4 $(SRC)/cv/education.html.m4 $(SRC)/cv/additional.html.m4 $(SRC)/cv/professional.html.m4 $(INCLUDES)
$(PUBLIC)/en/etc.html: $(SRC)/etc.html.m4 $(SRC)/etc/other.html.m4 $(SRC)/etc/programming.html.m4 $(SRC)/etc/talks.html.m4 $(INCLUDES)
$(PUBLIC)/en/%.html: $(SRC)/%.html.m4 $(INCLUDES)
	@echo Building $@ from $<
	@$(M4) -D__FILE__=$*.html -DENGLISH $< | ($(FORMAT) || true) > $@

$(PUBLIC)/cv.html: $(SRC)/cv.html.m4 $(SRC)/cv/education.html.m4 $(SRC)/cv/additional.html.m4 $(SRC)/cv/professional.html.m4 $(INCLUDES)
$(PUBLIC)/etc.html: $(SRC)/etc.html.m4 $(SRC)/etc/other.html.m4 $(SRC)/etc/programming.html.m4 $(SRC)/etc/talks.html.m4 $(INCLUDES)
$(PUBLIC)/%.html: $(SRC)/%.html.m4 $(INCLUDES)
	@echo Building $@ from $<
	@$(M4) -D__FILE__=$*.html $< | ($(FORMAT) || true) > $@
