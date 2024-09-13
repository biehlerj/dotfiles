# Jacob Biehler's Dotfiles

## Table of Contents

- [Jacob Biehler's Dotfiles](#jacob-biehlers-dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [How to install my dotfiles](#how-to-install-my-dotfiles)
  - [`gh` Extensions I use](#gh-extensions-i-use)

## Introduction

This repository contains my dotfiles managed with [yadm](https://yadm.io/). My dotfiles have been tested the most on my laptop running Pop!_OS 22.04, but do work on Arch and Artix as well.

## How to install my dotfiles

Make sure yadm is installed and run

```sh
# SSH
yadm clone --bootstrap git@github.com:biehlerj/dotfiles.git
# HTTPS
yadm clone --bootstrap https://github.com/biehlerj/dotfiles.git
```

## `gh` Extensions I use

- [gh-branch](https://github.com/mislav/gh-branch)
- [gh-bump](https://github.com/johnmanjiro13/gh-bump)
- [gh-clone-org](https://github.com/matt-bartel/gh-clone-org)
- [gh-cp](https://github.com/mislav/gh-cp)
- [gh-graph](https://github.com/kawarimidoll/gh-graph)
- [gh-install](https://github.com/redraw/gh-install)
- [gh-label](https://github.com/heaths/gh-label)
- [gh-markdown-preview](https://github.com/yusukebe/gh-markdown-preview)
- [gh-prs](https://github.com/dlvhdr/gh-prs)
- [gh-repo-explore](https://github.com/samcoe/gh-repo-explore)
- [resto](https://github.com/abdfnx/resto)
- [gh-s](https://github.com/gennaro-tedesco/gh-s)
- [gh-token](https://github.com/Link-/gh-token)
- [gh-user-stars](https://github.com/korosuke613/gh-user-stars)
- [gh-userfetch](https://github.com/sheepla/gh-userfetch)

## Using 1Password to manage secrets

With new versions of the 1Password CLI you can use `export SOME_ENVIRONMENT_VARIABLE=op://vault/item/[section/]field op run -- some command`

See the [1Password Developer Documentation](https://developer.1password.com/docs/cli/secrets-environment-variables/) for more information

## TODOs

- [X] Move external zsh plugins into git submodules
- [X] Clean up config directory to remove configs for programs I no longer use
- [ ] Update Pop!_OS bootstrap script to use Flatpaks over `deb-get` where possible
- [ ] Clean up .local/bin to remove scripts I no longer use
