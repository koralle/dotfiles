#!/usr/bin/zsh

# Zshの設定をファイル分割して取り扱う
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# コマンドの履歴周り
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=100000

# 履歴の全件表示
function history-all { history -E 1 }

autoload -Uz colors && colors

# 補完機能を有効化する
autoload -Uz compinit && compinit

# Vimライクなキーバインド
bindkey -v

# helpの代わりにrun-helpを使用する
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# ターミナルの色数を256色に
export TERM=xterm-256color

# 黙って日本語にする
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

# 同時に起動しているzshシェル間でhistoryを共有する
setopt share_history

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

