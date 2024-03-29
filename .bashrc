#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=nvim

# aliases
alias charge-80='sudo bash -c "echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'
alias charge-100='sudo bash -c "echo 100 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'

alias ..='cd ..'

alias vpn-connect='sudo protonvpn c -f'
alias vpn-disconnect='sudo protonvpn d'
alias vpn-reconnect='sudo protonvpn r'
alias lg='lazygit'
alias g='git'
alias editv='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read -n 1 input && if [ "$input" == "j" ]; then number=$((number+1)); elif [ "$input" == "k" ]; then number=$((number-1)); fi && cd $(ls -1 | sed -n "${number}p") && $EDITOR .'

alias size='sudo du -hs'
alias c='clear'
alias nf='neofetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias lft='eza -a --tree --icons'
alias v='$EDITOR'
alias wifi='nmtui'
alias wifilist='nmcli connection show'
alias wifiup='nmcli connection up'
alias audio='wpctl status'
alias audioset='wpctl set-default'
alias confn='cd ~/.config/nvim/lua/ && $EDITOR'
alias confh='$EDITOR ~/.config/hypr/hyprland.conf'
alias confb='$EDITOR ~/.bashrc'
alias conft='$EDITOR ~/.config/kitty/kitty.conf'
alias conftm='$EDITOR ~/.tmux.conf'
alias reloadtm='tmux source-file ~/.tmux.conf'
alias reloadb='source ~/.bashrc'

# edit kernel entries by listing the available entries (numbered) and then choosing the number to edit
alias confk='cd /boot/loader/entries/ && ls -1 | nl && echo -n "Enter number: " && read number && sudo $EDITOR $(ls -1 | sed -n "${number}p")'
# Waybar
alias confw='cd ~/.config/waybar && $EDITOR'
alias reloadw='killall waybar && waybar & disown'
alias o='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "${number}p") && clear'
alias open='o'
alias ov='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "${number}p") && $EDITOR .'
alias olg='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "${number}p") && lazygit'
alias openv='ov'
alias notes='cat ~/notes.txt'

# Web development
alias rdev='npm run dev'
alias rbuild='npm run build'
alias rlint='npx tsc --noEmit'
alias rstart='npm run start'
alias rtestit='~/scripts/nextjs_create_temp_endpoint.sh'

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"

# View image
alias img="feh -Z --auto-reload "

# Connect Headphones
alias hp-connect="bluetoothctl connect EC:66:D1:B5:E1:7A"

# Go
alias goprisma="go run github.com/steebchen/prisma-client-go"
alias goserve="go build -o /tmp/go-server && /tmp/go-server"
alias air='~/go/bin/air'

# Rust add bin to path
export PATH="$HOME/.cargo/bin:$PATH"

# Useless stuff
alias matrix='cmatrix'
alias monkeytype='smassh'

# Zoxide
eval "$(zoxide init bash)"
alias cd='z'

# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
# Dotfiles as git bare repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# auto cd
shopt -s autocd

# Safe rm and mv
alias rm='rm -i'
alias mv='mv -i'
