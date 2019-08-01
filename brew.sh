#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

brew install kube-ps1

brew tap dtan4/tools

# TODO add all brew packages to list, for loop over them to brew install
# ack
# adns
# aircrack-ng
# apr
# apr-util
# argo
# argon2
# aspell
# autoconf
# awscli
# bash
# bash-completion@2
# binutils
# binwalk
# brotli
# c-ares
# cifer
# circleci
# cmake
# coreutils
# curl-openssl
# dep
# dex2jar
# diff-so-fancy
# direnv
# dns2tcp
# docker-credential-ecr-login
# fcrackzip
# findutils
# foremost
# freetds
# freetype
# gcc
# gdbm
# geos
# gettext
# git
# git-hooks
# git-lfs
# glib
# gmp
# gnu-getopt
# gnupg
# gnutls
# go
# golangci-lint
# gperftools
# grep
# hashpump
# hdf5
# httpie
# hub
# hydra
# icu4c
# influxdb
# isl
# jansson
# jasper
# jemalloc
# john
# jpeg
# jq
# k8sec
# knock
# kube-ps1
# kubectx
# kubernetes-cli
# kubernetes-helm
# kustomize
# ldns
# leveldb
# libassuan
# libdnet
# libev
# libevent
# libffi
# libgcrypt
# libgpg-error
# libidn
# libksba
# libmetalink
# libmpc
# libomp
# libpng
# libpq
# libsodium
# libssh
# libssh2
# libtasn1
# libtiff
# libtool
# libunistring
# libusb
# libzip
# lua
# lynx
# modd
# moreutils
# mpfr
# mysql-client
# ncurses
# netpbm
# nettle
# nghttp2
# nmap
# node
# npth
# oniguruma
# openldap
# openssh
# openssl
# p11-kit
# p7zip
# pcre
# pcre2
# php
# pigz
# pinentry
# pipenv
# pngcheck
# postgresql
# protobuf
# pv
# python
# python@2
# qt
# readline
# rename
# rlwrap
# rtmpdump
# screen
# sfnt2woff
# sfnt2woff-zopfli
# skaffold
# snappy
# socat
# sops
# sqlite
# sqlmap
# ssdeep
# ssh-copy-id
# sshfs
# sshpass
# stern
# szip
# tcpflow
# tcpreplay
# tcptrace
# tidy-html5
# tmux
# tree
# ucspi-tcp
# unbound
# unixodbc
# vbindiff
# watch
# webp
# woff2
# xpdf
# xz
# zopfli

# Remove outdated versions from the cellar.
brew cleanup

