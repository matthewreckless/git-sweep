#!/bin/bash
cd commands

install_dir="/usr/local/bin"
current_dir=$(pwd)

echo "installing commands to $install_dir"

for command in *; do
    echo "installing $command"
    rm "$install_dir/$command" 2>/dev/null
    ln -s "$current_dir/$command" "$install_dir/$command"
    chmod a+x "$install_dir/$command"
done
