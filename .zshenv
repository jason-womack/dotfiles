# Configuretion for zsh
# This kludge can be used to override some installations that put aliases for
# rm, mv, etc. into the system profiles. Just be sure to put "unalias alias"
# in your own rc file(s) if you use this.
#alias alias=:

# Some people insist on setting their PATH here to affect things like ssh.
# Those that do should probably use $SHLVL to ensure that this only happens
# the first time the shell is started (to avoid overriding a customized
# environment). Also, the various profile/rc/login files all get sourced
# *after* this file, so they will override this value. One solution is to
# put your path-setting code into a file named .zpath, and source it from
# both here (if we're not a login shell) and from the .zprofile file (which
# is only sourced if we are a login shell).
#if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
# source ~/.zpath
#fi
export LC_ALL=ja_JP.UTF-8
limit coredumpsize 0

autoload colors && colors

autoload zmv zargs
zmodload zsh/files

typeset -U path
path=(/usr/local/bin /usr/bin /bin(N-/) /sbin(N-/) /usr/*/sbin(N-/) /usr/local/sbin $HOME/bin)

fpath=(/usr/share/zsh/functions/*(N-/) /usr/share/zsh/*/functions(N-/) /usr/share/zsh/site-functions(N-/) /usr/local/share/zsh/*/functions(N-/) /usr/local/share/zsh/site-functions(N-/))

manpath=(/usr/*/man(N-/) /usr/local/*/man(N-/))
