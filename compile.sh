#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
echo $SCRIPT_DIR
cd $SCRIPT_DIR/src/thesis
mkdir -p .aux/text
latexmk -auxdir=.aux -pdflatex=lualatex -pdf ctufit-thesis.tex
mv ./ctufit-thesis.pdf ../../text/thesis.pdf
# clean artifacts for full compilation
rm -rf .aux

# A&A article -> articles/aanda.pdf (matches the /articles/aanda.pdf route on the site)
cd $SCRIPT_DIR/articles/aanda
./compile.sh
mv ./aanda.pdf ../aanda.pdf