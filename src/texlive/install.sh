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
    texlive-latex-extra
  ;;
extra)
  echo "Installing extra TeX Live packages..."
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra
  ;;
full)
  echo "Installing full TeX Live..."
  apt-get install -y texlive-full
  ;;
*)
  echo "Unknown option '$PACKAGES', installing basic..."
  apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra
  ;;
esac

# Clean up
rm -rf /var/lib/apt/lists/*

echo "...TeX Live installed successfully."
