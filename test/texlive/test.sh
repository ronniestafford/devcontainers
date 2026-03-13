#!/usr/bin/env bash

set -euo pipefail
source dev-container-features-test-lib

check_latex_installed() {
  check "tex command is available" command -v tex
  check "pdflatex command is available" command -v pdflatex
  check "latexmk command is available" command -v latexmk
  check "inkscape command is available" command -v inkscape
  check "biber command is available" command -v biber
}

check_latexindent_installed() {
  check "latexindent installed" \
    command -v latexindent
  check "YAML::Tiny installed and usable" \
    perl -MYAML::Tiny -e 'print "YAML::Tiny loaded\n"'
  check "File::HomeDir installed and usable" \
    perl -MFile::HomeDir -e 'print "File::HomeDir loaded\n"'
  check "File::Which installed and usable" \
    perl -MFile::Which -e 'print "File::Which loaded\n"'
  check "Log::Dispatch installed and usable" \
    perl -MLog::Dispatch -e 'print "Log::Dispatch loaded\n"'
}

check_latex_compilation() {
  echo '\documentclass{article}
    \begin{document}
    Hello, World!
    \end{document}' >/tmp/test.tex
  check "basic LaTeX compilation works" pdflatex -halt-on-error -output-directory=/tmp /tmp/test.tex
}

echo "=========================== BEGIN STANDARD TEST ==========================="

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check_latex_installed
check_latexindent_installed
check_latex_compilation

# Clean up
rm -f /tmp/test.*

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

echo "=========================== END STANDARD TEST ==========================="
