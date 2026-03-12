#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "Installing TeX Live..."

PACKAGES="${PACKAGES:-basic}"
apt-get update

case "$PACKAGES" in
basic)
  echo "Installing basic TeX Live packages..."
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    latexmk \
    inkscape \
    biber
  ;;
extra)
  echo "Installing extra TeX Live packages..."
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    latexmk \
    inkscape \
    biber
  ;;
full)
  echo "Installing full TeX Live..."
  apt-get install -y texlive-full \
    inkscape
  ;;
*)
  echo "Unknown option '$PACKAGES', installing basic..."
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    latexmk \
    inkscape \
    biber
  ;;
esac

# Clean up
rm -rf /var/lib/apt/lists/*

echo "...TeX Live installed successfully."
