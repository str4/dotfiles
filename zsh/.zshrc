# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jpeuramaki/.oh-my-zsh"

# nnn settings
export NNN_BMS="d:~/Documents;D:~/Downloads;n:~/node;"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
alias zzz='vim ~/dotfiles/zsh/.zshrc'
alias ttt='vim ~/dotfiles/tmux/.tmux.conf'
alias aaa='vim ~/dotfiles/alacritty/alacritty.yml'
alias po='exa --long --grid'
alias vi='nvim'
alias vim='nvim'
alias dot='cd ~/dotfiles'
alias tmux='tmux -u'
alias python='python3'
alias pip='pip3'
alias cpu='top -F -R -o cpu'
alias mem='top -F -R -o MEM'
alias ff="nnn"
alias zs="source ~/dotfiles/zsh/.zshrc"

# Inlude hidden files in tab-complete
_comp_options+=(globdots)

HIST_STAMPS="dd.mm.yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.nvm/nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
