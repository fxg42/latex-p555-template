SRC_DIR = src
BUILD_DIR = build
ASSETS_DIR = assets
SUPPORT_DIR = support
DIST_DIR = dist

LATEX = xelatex
BIBTEX = bibtex
LATEX_FLAGS =

PANDOC = pandoc
PANDOC_FLAGS = --standalone --smart --number-sections --toc --highlight-style=pygments

MARKDOWN_FILES = $(wildcard $(SRC_DIR)/*.md)
PDF_FILES = $(addprefix $(DIST_DIR)/, $(notdir $(MARKDOWN_FILES:.md=.pdf)))

all: $(BUILD_DIR) $(DIST_DIR) $(PDF_FILES)

$(DIST_DIR)/%.pdf: $(SRC_DIR)/%.md
	$(PANDOC) $< -t $(SUPPORT_DIR)/p555.lua -o $(BUILD_DIR)/$*.tex
	cd $(BUILD_DIR); $(LATEX) $(LATEX_FLAGS) $*
	-cd $(BUILD_DIR); $(BIBTEX) $*
	cd $(BUILD_DIR); $(LATEX) $(LATEX_FLAGS) $*
	cd $(BUILD_DIR); $(LATEX) $(LATEX_FLAGS) $*
	cp $(BUILD_DIR)/$*.pdf $(DIST_DIR)/

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	cp $(SUPPORT_DIR)/* $(BUILD_DIR)/
	cp $(ASSETS_DIR)/* $(BUILD_DIR)/

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

clean:
	rm -rf $(BUILD_DIR)

destroy:
	rm -rf $(BUILD_DIR)
	rm -rf $(DIST_DIR)
