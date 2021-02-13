#!/bin/sh

#files=$(cat << __FILES__
#.config/nvim/init.vim
#.config/fish/config.fish
#__FILES__
#)
#
#IFS=$'\n'
#echo "Backup files..."
#for f in $files; do
#    echo "cp -pi ~/$f ./$f"
#done

# --archive
# --verbose
# --human-readable
# --dry-run
#
# --executability
rsync --exclude-from .IGNORE -avhiE --existing --no-perms ~/ .
#rsync --exclude-from .IGNORE -avhniE --existing --no-perms ~/.git/ .git/
#rsync --exclude-from .IGNORE -avhniE --existing --no-perms ~/.local/ .local/
#rsync --exclude-from .IGNORE -avhniE --existing --no-perms ~/.config/ .config/
