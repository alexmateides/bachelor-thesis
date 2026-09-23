#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
echo $SCRIPT_DIR
cd $SCRIPT_DIR

mkdir -p .aux

# -emulate-aux-dir keeps bibtex able to find the .aux file, which it cannot do
# with the pdflatex -auxdir option alone
if [ "$1" = "referee" ]; then
    # double-spaced version A&A asks for at submission
    latexmk -auxdir=.aux -emulate-aux-dir -pdf -jobname=aanda-referee \
        -pretex='\PassOptionsToClass{referee}{aa}' -usepretex aanda.tex
else
    latexmk -auxdir=.aux -emulate-aux-dir -pdf aanda.tex
fi

# clean artifacts for full compilation
rm -rf .aux
