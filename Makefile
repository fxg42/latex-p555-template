SPECS = document

BUILD_DIR = build
ASSETS_DIR = assets
SUPPORT_DIR = support
DIST_DIR = dist

LATEX = xelatex
LATEX_OPTIONS =

PANDOC = pandoc
PANDOC_OPTIONS = --standalone --smart --number-sections --toc --highlight-style=pygments

DOCX_SPECS = $(addprefix $(DIST_DIR)/, $(addsuffix .docx, $(SPECS)))
PDF_SPECS  = $(addprefix $(DIST_DIR)/, $(addsuffix .pdf, $(SPECS)))

all: $(BUILD_DIR) $(DIST_DIR) $(DOCX_SPECS) $(PDF_SPECS)

$(DIST_DIR)/%.docx: %.markdown
	cp $< $(BUILD_DIR)/
	cd $(BUILD_DIR); $(PANDOC) $(PANDOC_OPTIONS) $< -o $*.docx
	cp $(BUILD_DIR)/$*.docx $(DIST_DIR)/

$(DIST_DIR)/%.pdf: %.markdown
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
