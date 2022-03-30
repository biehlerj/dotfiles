FROM alpine

RUN apk add github-cli yadm neovim
RUN yadm clone --bootstrap https://github.com/biehlerj/dotfiles.git