#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

APT_OPTS=(
  -o Acquire::Retries=5
  -o Acquire::http::Pipeline-Depth=0
)

install_latexindent() {
  apt-get "${APT_OPTS[@]}" install -y --no-install-recommends \
    texlive-extra-utils \
    build-essential \
    perl \
    cpanminus \
    libyaml-tiny-perl

  cpanm --notest \
    File::HomeDir \
    File::Which \
    Log::Dispatch \
    YAML::Tiny
}

install_latex_basic() {
  apt-get "${APT_OPTS[@]}" install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    latexmk \
    inkscape \
    biber
}

echo "Installing TeX Live..."

PACKAGES="${PACKAGES:-basic}"

# Clean APT state before proceeding.
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/apt/archives/*
apt-get clean

# Update package indexes.
apt-get "${APT_OPTS[@]}" update

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

  apt-get "${APT_OPTS[@]}" install -y --no-install-recommends \
    texlive-fonts-recommended \
    texlive-fonts-extra
  ;;

full)
  echo "Installing full TeX Live..."
  apt-get "${APT_OPTS[@]}" install -y \
    texlive-full \
    inkscape
  ;;

*)
  echo "Unknown option '$PACKAGES', installing basic..."
  install_latex_basic
  install_latexindent
  ;;
esac

# Clean up APT metadata/cache.
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/apt/archives/*
apt-get clean

echo "...TeX Live installed successfully."
