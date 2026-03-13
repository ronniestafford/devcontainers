#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

install_latexindent() {
  apt-get install -y --no-install-recommends \
    texlive-extra-utils \
    build-essential \
    perl \
    cpanminus \
    libyaml-tiny-perl

  cpanm File::HomeDir File::Which Log::Dispatch YAML::Tiny
}

install_latex_basic() {
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    latexmk \
    inkscape \
    biber
}

echo "Installing TeX Live..."

PACKAGES="${PACKAGES:-basic}"
apt-get update

case "$PACKAGES" in
basic)
  echo "Installing basic TeX Live packages..."
  install_latex_basic
  install_latexindent
  ;;
extra)
  echo "Installing extra TeX Live packages..."
  install_latex_basic
  install_latexindent
  apt-get install -y --no-install-recommends \
    texlive-fonts-recommended \
    texlive-fonts-extra
  ;;
full)
  echo "Installing full TeX Live..."
  apt-get install -y texlive-full \
    inkscape
  ;;
*)
  echo "Unknown option '$PACKAGES', installing basic..."
  install_latex_basic
  install_latexindent
  ;;
esac

# Clean up
rm -rf /var/lib/apt/lists/*

echo "...TeX Live installed successfully."
