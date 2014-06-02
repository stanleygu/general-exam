OUTPUT_DIR=output

all:
	rm -r $(OUTPUT_DIR)
	mkdir -p $(OUTPUT_DIR)
	cp *.bib $(OUTPUT_DIR)
	pdflatex --output-dir=$(OUTPUT_DIR) main
	cd $(OUTPUT_DIR) && bibtex main
	pdflatex --output-dir=$(OUTPUT_DIR) main

clean:
	rm -r $(OUTPUT_DIR)

figures:
	curl 'https://docs.google.com/presentation/d/1Ct2Ee4puoH6L19fBs1qHapG5JULUIiloepWNmn2g_Y8/export/pdf?id=1Ct2Ee4puoH6L19fBs1qHapG5JULUIiloepWNmn2g_Y8&pageid=p' --compressed -o images/Figures.pdf
