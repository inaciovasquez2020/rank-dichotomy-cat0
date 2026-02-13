#!/usr/bin/env bash
set -euo pipefail

test -f THEOREM.md
test -f STATUS.md
test -f rank-dichotomy-cat0.tex
test -f rank-dichotomy-cat0.pdf
test -f rank-dichotomy-cat0.pdf.sha256

ACTUAL="$(shasum -a 256 rank-dichotomy-cat0.pdf | awk '{print $1}')"
EXPECTED="$(cat rank-dichotomy-cat0.pdf.sha256 | tr -d '[:space:]')"

if [ "$ACTUAL" != "$EXPECTED" ]; then
  echo "sha256 mismatch"
  echo "expected $EXPECTED"
  echo "actual   $ACTUAL"
  exit 1
fi

echo "OK: canonical artifact verified"
