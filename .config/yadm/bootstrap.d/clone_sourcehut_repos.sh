#!/usr/bin/env bash
# Clones all repos from sourcehut
repos=(go-cli-intro go-logging-intro go-grpc-intro advent-of-code Awesome-CV algos-datastructures astronvim_config dotfiles biehlerj.xyz java-development-bootcamp java-bootcamp-resources vimwiki introducing-go private-scripts pdf_compiler)

mkdir -p "$HOME/dev/git.sr.ht/biehlerj/"
# List all subdirectories in the current directory
for repo in "${repos[@]}"; do
    # Clone
    git clone "git@git.sr.ht:~biehlerj/$repo" "$HOME/dev/git.sr.ht/biehlerj/$repo"
done
