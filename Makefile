.SUFFIXES: .latex .pdf
%.pdf: %.latex _%.latex _styles.latex
	pdflatex -shell-escape $<
 
all: main.pdf
main.pdf: erd.pdf main.latex _*.latex 
	pdflatex -shell-escape main.latex || (rm -f main.pdf && false)
	pdflatex -shell-escape main.latex || (rm -f main.pdf && false)
erd.pdf: erd.latex
	pdflatex -shell-escape erd.latex
airlines.pdf: airlines.latex airports.dat routes.dat
	lualatex airlines.latex # pdflatex runs out of memory
clean: 
	rm -f *.pdf *.dvi *.log *.aux *.toc

