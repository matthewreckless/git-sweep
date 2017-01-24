#!/bin/sh
cd bash_completions

install_dir="/usr/local/etc/bash_completion.d"
current_dir=$(pwd)

echo "installing bash_completions to $install_dir"

for completion in *; do
    echo "installing $completion"
    rm "$install_dir/$completion" 2>/dev/null
    ln -s "$current_dir/$completion" "$install_dir/$completion"
    chmod a+x "$install_dir/$completion"
done
