# # noobs' customize bashrc
#
# # Self-Satisfaction(Productivity) Tips for Working from Home
# The new(2020) normal-way of working.
#
# ## Reading at the Start of the Day
# A short reading is perfect for everyday morning.
#
# ## Postpone Joy
# Basement action to keep satisfy prioritzation.
#
# ## Use Games or Entertainment as Rewards
# Have a rest in everyday life, as rewards.
#
# ## Eat in Silence
# Do not eat in front of the TV or your mobile-phone.
#
# ## Create a Rigid Workday Routine
# Simple Plan. Two or Three small targets everyday.
#
# ## Set an End Time for most things
# Complete things with Self-satisfaction.


# ## Disable All Proxy
export HTTP_PROXY=
export HTTPS_PROXY=
# ## Favor things installer:
#  - rustup `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
export INSTALL_RUSTUP="curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
#  - golang `curl -O -L https://golang.org/dl/go1.14.6.linux-amd64.tar.gz`
export INSTALL_GOLANG="curl -O -L https://golang.org/dl/go1.15.3.linux-amd64.tar.gz"

#  - node.js version manager
#  ```
#  export NVS_HOME="$HOME/.nvs"
#  git clone https://github.com/jasongin/nvs "$NVS_HOME"
#  . "$NVS_HOME/nvs.sh" installer
#  ```
export INSTALL_NODEJS="git clone https://github.com/jasongin/nvs $HOME/.nvs"

#  - yarn package manager `curl -o- -L https://yarnpkg.com/install.sh | bash`
#  - sdkman sdk manager `curl -s "https://get.sdkman.io" | bash`
export INSTALL_SDKMAN="curl -s 'https://get.sdkman.io' | bash"
#  - amazon/aws-cli (v2) `curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"`
#  - Powerline support from `powerline-go`
export INSTALL_POWERLINE_GO="go get -u github.com/justjanne/powerline-go"

#  - Tmux plugin manager
export INSTALL_TMUX_TPM="git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"

#  - Tmux shell functions
if [ -f ${HOME}/bin/tmux-session ] && [ -z "${TMUX}" ]; then
    echo '.. INFO .. "$ tmux-session save" - to write basic info of sessions to "~/.tmux-session"'
    echo '.. INFO .. "$ tmux-session restore" - to restore the sessions from "~/.tmux-session"'
    echo
fi

# tmux source-file ~/.tmux.conf

# shell widget by `navi`
# eval "$(navi widget bash)"

# Ignore `keychain` store for Corp remote host
# #@# Keychain
# #@# The file names of private key should be update depend on your configuration of the SSH keys.
# if [ -f /usr/bin/keychain ]; then
#     /usr/bin/keychain -q --nogui ${HOME}/.ssh/id_rsa ${HOME}/.ssh/id_rsa_github
#     source ${HOME}/.keychain/${HOSTNAME}-sh
# fi


#
alias rm='rm -i'
alias l='ls'
alias la='ls -a'
alias ll='ls -la'
alias lst='ls -lstr'

alias icat='kitty +kitten icat'
alias d='kitty +kitten diff'

alias ggd='git diff'
alias ggs='git status'
alias ggl='git log'
alias gga='git add'
alias ggm='git commit -m'

alias upup='sudo apt update; sudo apt upgrade -y'

# alias gr='rg'
alias fd='fdfind'

export JULIA_PKG_SERVER="https://mirrors.tuna.tsinghua.edu.cn/julia/static"
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node

if [ -d $HOME/.cargo ]; then
    export CARGO_HOME=$HOME/.cargo
    export PATH=$CARGO_HOME/bin:$PATH
    source "$HOME/.cargo/env"
fi

## CLI prompt, for astronauts. ☄🌌️
eval "$(starship init bash)"

if [ -d $HOME/app/go ]; then
    export GOROOT=$HOME/app/go
    export GOPATH=$HOME/app/gopath
    export GO111MODULE=on
    export GOPROXY=
    # export GOPROXY=https://mirrors.cloud.tencent.com/go/,direct
    export GOPROXY=https://mirrors.aliyun.com/goproxy,direct
    # export GOPROXY=https://goproxy.io,direct
    export GOSUMDB=
    export GOSUMDB="sum.golang.google.cn"
    # export GOSUMDB=gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
fi
if [ -f $HOME/app/dotnet/dotnet ]; then
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_PATH=$HOME/app/dotnet
    export PATH=$DOTNET_PATH:$PATH
    export PATH=$PATH:$HOME/.dotnet/tools
fi
if [ -d $HOME/.rustup ]; then
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
fi
my_toolchain() {
    # eval "${INSTALL_NODEJS}"
    # eval "${INSTALL_RUSTUP}"
    # eval "${INSTALL_SDKMAN}"
    echo "From here, I can install and check the toolchains. Node.js, Golang, Rust and JVM."
    # toolchain check
    declare -a toolchain_check_result
    if [ -d $HOME/app/go ]; then
        toolchain_check_result+="$(go version)"
    fi
    if [ -f $HOME/app/dotnet/dotnet ]; then
        toolchain_check_result+=(".net core $(dotnet --version)")
    fi
    if [ -d $HOME/.rustup ]; then
        # export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        # export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        toolchain_check_result+=("$(rustc -V)")
    fi
    if [ -n "$(LC_ALL=C type -t nvm)" ] && [ "$(LC_ALL=C type -t nvm)" = function ]; then
        toolchain_check_result+=("node.js $(nvm alias default)")
    fi
    toolchain_check_result_join=$(printf "%s,  " "${toolchain_check_result[@]}")
    echo "${toolchain_check_result_join}"
    echo "${toolchain_check_result_join}" > ${HOME}/.last_toolchain_check_result
}
# if [ -f $HOME/.last_toolchain_check_result ]; then
#     echo "Latest checking on the toolchains:"
#     cat ${HOME}/.last_toolchain_check_result
# fi
# yarn for node.js dev
if [ -d $HOME/.yarn ]; then
    export YARN_HOME=$HOME/.yarn
    export PATH=$YARN_HOME/bin:$PATH
fi

if [ -f /usr/local/bin/nvim ]; then
    alias nv='/usr/local/bin/nvim'
    alias vv='/usr/local/bin/nvim'
fi
if [ -f ${HOME}/bin/nvim ]; then
    alias nv=${HOME}/bin/nvim
    alias vv=${HOME}/bin/nvim
fi
if [[ -f /usr/bin/nvim-qt ]] || [[ -f /usr/local/bin/nvim-qt ]]; then
    alias nvq='nvim-qt'
fi

set_rust_crates_mirror() {
    tee ~/.cargo/config << EOF_CARGO_CONFIG
[source.crates-io]
replace-with = 'tuna'
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
EOF_CARGO_CONFIG
}

set -o ignoreeof


echo -ne "\x1b]0;WSL2\x1b\\"

export PS1=" ~~ ~~ ~~    ~~ ~~ ~~\n\[\033[00;34m\]==>\[\033[00m\]$ "
#@# # emoji used
#@# # 🐛
#@# # 🇨🇳
#@# # 🖖
#@# # git prompt mod, with Powerline font glyphs
#@# function _update_ps1() {
#@#     if [ -f $GOPATH/bin/powerline-go ]; then
#@#         POWERLINE_GO="$(${GOPATH}/bin/powerline-go -modules-right 'dotenv,time' -condensed -error $?)"
#@#         PS1_STAGE1=$(echo "${POWERLINE_GO}" | sed -e 's/ \(.*\\\$\)/ 🖖  \1 🖖 /' | sed -e 's/\\\$//')
#@#     else
#@#         PS1_STAGE1=""
#@#     fi
#@# }
#@# function _prompt_nextline() {
#@#     PS1="${PS1_STAGE1} ~~ ~~ ~~    ~~ ~~ ~~\n\[\033[00;34m\]==>\[\033[00m\]$ "
#@# }
#@# if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
#@#     PROMPT_COMMAND="_update_ps1; _prompt_nextline; $PROMPT_COMMAND"
#@# fi
#@# # xdotool windowmove `xdotool getactivewindow` 1000 75
#@#
#@# export PATH=${PATH}:${HOME}/.deno/bin

### vim: set filetype=bash :
