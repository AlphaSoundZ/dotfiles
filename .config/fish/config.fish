function ov
    cd ~/code
    ls -1 | nl
    echo -n "Enter number: "
    if test -n "$argv"
        set number $argv
        cd (ls -1 | sed -n "$number p")
    else
        read -P "Enter number: " number
        cd (ls -1 | sed -n "$number p")
    end
    $EDITOR .
end

function o
    cd ~/code
    ls -1 | nl
    echo -n "Enter number: "
    if test -n "$argv"
        set number $argv
        cd (ls -1 | sed -n "$number p")
    else
        read -P "Enter number: " number
        cd (ls -1 | sed -n "$number p")
    end
    clear
end

if status is-interactive

fish_vi_key_bindings

export EDITOR=nvim
alias grep='grep --color=auto'
alias charge-80='sudo bash -c "echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'
alias charge-100='sudo bash -c "echo 100 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'
alias vpn-connect='sudo protonvpn c -f'
alias vpn-disconnect='sudo protonvpn d'
alias vpn-reconnect='sudo protonvpn r'
alias lg='lazygit'
alias g='git'

alias size='sudo du -hs'
alias c='clear'
alias e='exit'
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

# Configurations:
alias confn='cd ~/.config/nvim/lua/ && $EDITOR'
alias confh='$EDITOR ~/.config/hypr/hyprland.conf'
alias confb='$EDITOR ~/.bashrc'
alias conff='$EDITOR ~/.config/fish/config.fish'
alias conft='$EDITOR ~/.config/kitty/kitty.conf'
alias conftm='$EDITOR ~/.tmux.conf'
alias confk='cd /boot/loader/entries/ && ls -1 | nl && echo -n "Enter number: " && read number && sudo $EDITOR $(ls -1 | sed -n "$number p")'
alias confw='cd ~/.config/waybar && $EDITOR'
alias reloadtm='tmux source-file ~/.tmux.conf'
alias reloadb='source ~/.bashrc'
alias reloadf='source ~/.config/fish/config.fish'
alias reloadw='killall waybar && waybar & disown'
alias reloadAll='reloadtm && reloadb && reloadf && reloadw'

# alias o='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "$number p") && clear'
alias open='o'
# alias ov='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "$number p") && $EDITOR .'
alias olg='cd ~/code && ls -1 | nl && echo -n "Enter number: " && read number && cd $(ls -1 | sed -n "$number p") && lazygit'
alias openv='ov'
alias notes='cat ~/notes.txt'

# Web development
alias rdev='npm run dev'
alias rbuild='npm run build:dev'
alias rbuildp='npm run build'
alias rlint='npx tsc --noEmit'
alias rstart='npm run start'
alias rtestit='~/scripts/nextjs_create_temp_endpoint.sh'
alias rchroma='sudo docker run -p 8000:8000 chromadb/chroma'
alias dbpush='npx prisma db push'
alias dbreset='dbpush --force-reset'
alias dbgenerate='npx prisma generate'
alias dbstudio='npx prisma studio'
alias dbsql='mariadb -u root -pmysql -h localhost -P 3306 -D admark_ai'
# fix import error from prod server: sed -i '/@@GLOBAL.GTID_PURGED=/d' 
alias dbimport='dbreset && mariadb -u root -p admark_ai -h localhost -P 3306 < '
alias rngrok='ngrok http --domain=optimal-platypus-perfectly.ngrok-free.app 3000'
alias dbexport='mariadb-dump --user=root --password=mysql --host=localhost --port=3306 admark_ai > '
alias dbmigrate='npm run migrate'
alias dbmigreset='npx prisma migrate reset'
alias dbmigcreate='npm run migration:create'
alias ngrok3000='ngrok http 127.0.0.1:3000 --host-header="127.0.0.1:3000" --domain=optimal-platypus-perfectly.ngrok-free.app'
alias ngrok8000='ngrok http 127.0.0.1:8000 --host-header="127.0.0.1:8000" --domain=optimal-platypus-perfectly.ngrok-free.app'

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
# eval "$(zoxide init bash)"
if command -sq zoxide
    zoxide init fish | source
else
    echo 'zoxide: command not found, please install it from https://github.com/ajeetdsouza/zoxide'
end

alias cd='z'

# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
# Dotfiles as git bare repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Safe rm and mv
alias rm='rm -i'
alias mv='mv -i'

end

# Update Keyboard Firmware (QMK): 
# https://www.keychron.com/blogs/archived/how-to-factory-reset-or-flash-your-qmk-via-enabled-keychron-q8-keyboard
alias update-keyboard='cd qmk_firmware && qmk flash -kb keychron/q8/ansi_encoder -km default'

alias myip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'

# ALlows to use sudo with aliases
alias sudo='sudo '

# change default audio volume
alias audiovolume='pactl set-sink-volume @DEFAULT_SINK@'

alias todo='dooit'

# tmux
alias admarkai='tmux new-session  "tmux source-file ~/.tmux.conf"'

alias secureCopy='rsync -avtP'
alias backupSystem='rsync -rlptgoDP'

alias bloatDetect="ncdu -x /"
alias runAfterUpdate="bleachbit --clean system.cache system.localizations system.trash system.tmp"

alias mysqlconsole='mysql -u root -pmysql -h localhost -P 3306'

# start rchroma before to be safe
alias removeUnusedDockerResources='sudo docker system prune -a'


alias prodServerConnect='ssh root@167.172.191.211'
