#!/bin/bash

branch_name="$(git symbolic-ref HEAD 2>/dev/null)"

if [ -z "$branch_name" ]; then
    echo -e "detached HEAD"
    exit 1
fi

branch_name=${branch_name##refs/heads/}

git push origin $branch_name --force
git fetch --prune