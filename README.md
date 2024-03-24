## Migrate/Install to/on a New System
There could be weird behaviour if .cfg tries to track itself. Avoid recursive issues by adding .cfg to your global Git ignore:
```sh
echo ".cfg" >> .gitignore
```

Clone bare repository:
```
git clone --bare https://github.com/AlphaSoundZ/dotfiles.git $HOME/.cfg
```
 
Set up an alias to send Git commands to .cfg, and also set $HOME as the work tree, while storing the Git state at .cfg or source the `./bashrc` file.
```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
or
```sh
source ~/.bashrc
```
 
Set a local configuration in .cfg to ignore untracked files:
```sh
dotfiles config --local status.showUntrackedFiles no
```

Checkout to get the actual content;
```sh
dotfiles checkout
```

## How to Push Files
use the alias "dotfiles" for git actions:
```sh
dotfiles add /config/path/to/push/
dotfiles commit -m "commit msg"
dotfiles push
```
