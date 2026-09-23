MAIN = aanda

.PHONY: all referee clean distclean

all:
	latexmk -pdf -interaction=nonstopmode $(MAIN).tex

# Double-spaced version with line numbers, as requested for refereeing
referee:
	latexmk -pdf -interaction=nonstopmode -jobname=$(MAIN)-referee \
		-pretex='\PassOptionsToClass{referee}{aa}' -usepretex $(MAIN).tex

clean:
	latexmk -c
	rm -f $(MAIN).bbl $(MAIN)-referee.*

distclean:
	latexmk -C
	rm -f $(MAIN).bbl build.log $(MAIN)-referee.*
