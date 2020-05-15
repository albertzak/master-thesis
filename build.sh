#!/bin/sh

document=thesis

export TEX_IMAGE=texlive-gitdags-fonts

docker build -t $TEX_IMAGE .

./latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf $document
./makeglossaries $document
./latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf $document
./makeglossaries $document
./latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf $document
./latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf $document
