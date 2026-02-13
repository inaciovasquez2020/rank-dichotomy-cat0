#!/usr/bin/env bash
set -euo pipefail
latexmk -C
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error rank-dichotomy-cat0.tex
test -f rank-dichotomy-cat0.pdf
echo OK
