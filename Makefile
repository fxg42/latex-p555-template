SRC_DIR = src
BUILD_DIR = build
ASSETS_DIR = assets
SUPPORT_DIR = support
DIST_DIR = dist

LATEX = xelatex
LATEX_OPTIONS =

PANDOC = pandoc
PANDOC_OPTIONS = --standalone --smart --number-sections --toc --highlight-style=pygments

MARKDOWN_FILES = $(wildcard $(SRC_DIR)/*.markdown)
PDF_FILES = $(addprefix $(DIST_DIR)/, $(notdir $(MARKDOWN_FILES:.markdown=.pdf)))
DOCX_FILES = $(addprefix $(DIST_DIR)/, $(notdir $(MARKDOWN_FILES:.markdown=.docx)))

all: $(BUILD_DIR) $(DIST_DIR) $(PDF_FILES) $(DOCX_FILES)

$(DIST_DIR)/%.docx: $(SRC_DIR)/%.markdown
	cd $(BUILD_DIR); $(PANDOC) $(PANDOC_OPTIONS) ../$< -o $*.docx
	cp $(BUILD_DIR)/$*.docx $(DIST_DIR)/

$(DIST_DIR)/%.pdf: $(SRC_DIR)/%.markdown
	$(PANDOC) $< -t $(SUPPORT_DIR)/p555.lua -o $(BUILD_DIR)/$*.tex
	cd $(BUILD_DIR); $(LATEX) $(LATEX_OPTIONS) $*
	cd $(BUILD_DIR); $(LATEX) $(LATEX_OPTIONS) $*
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
