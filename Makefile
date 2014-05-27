OUTPUT_DIR=output

all:
	rm -r $(OUTPUT_DIR)
	mkdir -p $(OUTPUT_DIR)
	cp *.bib $(OUTPUT_DIR)
	latex --output-dir=$(OUTPUT_DIR) main
	cd $(OUTPUT_DIR) && bibtex main
	latex --output-dir=$(OUTPUT_DIR) main
	pdflatex --output-dir=$(OUTPUT_DIR) main

clean:
	rm -r $(OUTPUT_DIR)
