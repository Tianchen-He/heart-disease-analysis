# Makefile for Heart Disease Analysis Project

# Define variables
RMD = src/analysis.Rmd
OUTPUT_DIR = output
OUTPUT_FILE = $(OUTPUT_DIR)/heart_disease_analysis.html
DATA = data/heart.csv
TABLES_SCRIPT = src/tables.R
FIGURES_SCRIPT = src/figures.R
IMAGE = the53/heart-disease-analysis
REPORT_DIR = $(shell pwd)/report

# Default rule
all: $(OUTPUT_FILE)

# Rule to render the R Markdown file into HTML
$(OUTPUT_FILE): $(RMD) $(DATA) $(TABLES_SCRIPT) $(FIGURES_SCRIPT)
	Rscript -e "rmarkdown::render('$(RMD)', output_dir = '$(OUTPUT_DIR)')"

# Rule to clean the output directory
clean:
	rm -f $(OUTPUT_DIR)/* report/*

# Rule to restore the package environment
install:
	Rscript -e "renv::restore()"

# Rule to build the Docker image
build:
	docker build -t $(IMAGE) .

# Rule to run the Docker container and generate the report
run:
	mkdir -p report
	docker run --rm -v $(REPORT_DIR):/project/output $(IMAGE)

# Phony targets
.PHONY: all clean install build run