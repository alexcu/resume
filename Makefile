all:
	$(MAKE) build clean
build:
	# Create using PDFLaTeX
	pdflatex \
		-interaction=nonstopmode \
		-file-line-error \
		-synctex=1 \
		-shell-escape \
		-recorder \
		resume.tex
clean:
	# Remove "resume.!(tex|pdf|cls)"
	find . \
		-type f \
		-name 'resume.*' \
		! -iname "*.pdf" \
		! -iname "*.tex" \
		! -iname "*.cls" \
		-delete
