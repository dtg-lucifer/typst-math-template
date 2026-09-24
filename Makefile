# Makefile for Typst Document Template
# Automates compiling, watching, building dark/light themes, and generating previews

SRC = main.typ
PDF_LIGHT = output.pdf
PDF_DARK = output-dark.pdf
ASSETS_DIR = assets
FONTS_DIR = $(ASSETS_DIR)/fonts
TYPST_FLAGS = --font-path $(FONTS_DIR)

.PHONY: all build dark watch watch-dark previews clean help

# Default target: build standard light and dark PDFs
all: build dark

## build: Compile document in default light theme
build: $(PDF_LIGHT)

$(PDF_LIGHT): $(SRC) prelude.typ template.typ components/*.typ
	@echo "==> Compiling light document to $(PDF_LIGHT)..."
	typst compile $(TYPST_FLAGS) $(SRC) $(PDF_LIGHT)
	@echo "==> Done: $(PDF_LIGHT)"

## dark: Compile document in dark theme
dark: $(PDF_DARK)

$(PDF_DARK): $(SRC) prelude.typ template.typ components/*.typ
	@echo "==> Compiling dark document to $(PDF_DARK)..."
	typst compile $(TYPST_FLAGS) --input theme=dark $(SRC) $(PDF_DARK)
	@echo "==> Done: $(PDF_DARK)"

## watch: Continuously watch and recompile light document on change
watch:
	@echo "==> Watching $(SRC) (light theme)..."
	typst watch $(TYPST_FLAGS) $(SRC) $(PDF_LIGHT)

## watch-dark: Continuously watch and recompile dark document on change
watch-dark:
	@echo "==> Watching $(SRC) (dark theme)..."
	typst watch $(TYPST_FLAGS) --input theme=dark $(SRC) $(PDF_DARK)

## previews: Generate PNG preview images for all pages in both themes
previews:
	@mkdir -p $(ASSETS_DIR)
	@rm -f $(ASSETS_DIR)/preview-*.png
	@echo "==> Exporting light theme PNG previews..."
	typst compile $(TYPST_FLAGS) --format png $(SRC) "$(ASSETS_DIR)/preview-light-{p}.png"
	@echo "==> Exporting dark theme PNG previews..."
	typst compile $(TYPST_FLAGS) --input theme=dark --format png $(SRC) "$(ASSETS_DIR)/preview-dark-{p}.png"
	@echo "==> Previews generated in $(ASSETS_DIR)/"

## clean: Remove compiled PDFs, preview images, and temporary files
clean:
	@echo "==> Cleaning generated build files..."
	@rm -f $(PDF_LIGHT) $(PDF_DARK)
	@rm -f $(ASSETS_DIR)/preview-*.png
	@echo "==> Clean complete."

## help: Display this help message
help:
	@echo "Available make targets:"
	@echo "  make            - Build both light (output.pdf) and dark (output-dark.pdf)"
	@echo "  make build      - Build standard light theme document"
	@echo "  make dark       - Build dark theme document"
	@echo "  make watch      - Live watch & recompile light theme on save"
	@echo "  make watch-dark - Live watch & recompile dark theme on save"
	@echo "  make previews   - Export PNG preview images of all pages"
	@echo "  make clean      - Remove generated PDFs and PNG preview images"
	@echo "  make help       - Show this help message"
