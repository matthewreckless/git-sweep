#!/bin/bash
install_dir=$1

if [ -z "$1" ]; then
    echo "first argument must be a path to a git repository" >&2
    exit 1
fi

# check if the install location is a git repo
if [ ! -d "$install_dir/.git" ]; then
    echo "$install_dir is not a git repository" >&2
    exit 1
fi

echo "installing hooks to $install_dir/.git/hooks/"

cd hooks/
for hook in *; do
    echo "installing $hook"
    rm "$install_dir/.git/hooks/$hook" 2>/dev/null
    cp "$hook" "$install_dir/.git/hooks/$hook"
    chmod a+x "$install_dir/.git/hooks/$hook"
done
