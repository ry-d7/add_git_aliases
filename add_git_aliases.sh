#!/usr/bin/bash

declare -a ALIASKEYS
ALIASKEYS=("status"
          "checkout"
          "diff"
          "diff_cached"
          "log"
          "log_p"
          "commit"
          "commit_m"
          "merge"
          "tag"
          )

declare -A ALIASES
ALIASES[status,command]="status"
ALIASES[status,short]="s"

ALIASES[checkout,command]="checkout"
ALIASES[checkout,short]="co"

ALIASES[diff,command]="diff"
ALIASES[diff,short]="df"

ALIASES[diff_cached,command]="diff --cached"
ALIASES[diff_cached,short]="dfc"

ALIASES[log,command]="log"
ALIASES[log,short]="l"

ALIASES[log_p,command]="log -p"
ALIASES[log_p,short]="lp"

ALIASES[commit,command]="commit"
ALIASES[commit,short]="cm"

ALIASES[commit_m,command]="commit -m"
ALIASES[commit_m,short]="cmm"

ALIASES[merge,command]="merge"
ALIASES[merge,short]="m"

ALIASES[tag,command]="tag"
ALIASES[tag,short]="t"

for key in "${ALIASKEYS[@]}"; do
    command="${ALIASES[${key},command]}"
    short="${ALIASES[${key},short]}"
    # echo ${short} ${command}
    git config --global --get alias.${short} > /dev/null 2>&1
    if [ $? = 0 ]; then
        echo "git alias ${short} already exists"
    else
        echo "add git alias ${short}"
        echo \"${command}\" | xargs git config --global alias.${short}
    fi
done
