#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BUN_INSTALL="$HOME/.bun"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export GOBIN=$GOPATH/bin
export GOPATH="$HOME/.go"

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="`pwd`/flutter/bin:$PATH"
export PATH="$GOBIN:$PATH"

export XML_CATALOG_FILES=/opt/homebrew/etc/xml/catalog
