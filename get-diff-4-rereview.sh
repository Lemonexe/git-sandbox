#!/bin/bash

# Get git diff between two commits which are supposed to be of the same branch, but divergent
# Very useful when you have last reviewed a PR at $seen_commit, but it has been force-pushed to $curr_commit
# Usage: get-diff-4-rereview.sh asd1234 qwer789 main
# See params below:

# commit which I have seen & reviewed
seen_commit=$1
# current commit of the branch (after it been force pushed x times, and I want to re-review changes from last time I saw it)
curr_commit=$2
# OPTIONAL: name of the base branch, default "master"
trunk_branch=${3:-"master"} 

git fetch origin "$seen_commit"
git fetch origin "$curr_commit"

# update trunk branch, otherwise all the comparisons could be nonsense
git fetch origin "$trunk_branch" && git update-ref refs/heads/"$trunk_branch" refs/remotes/origin/"$trunk_branch"

# common ancestor between current PR commit & trunk branch
git checkout "$curr_commit"
curr_base_commit=$(git merge-base HEAD "$trunk_branch")

# rebase the commit which I have reviewed so it has the same base as the current PR commit
git checkout "$seen_commit"
seen_base_commit=$(git merge-base HEAD "$trunk_branch")
git rebase --onto "$curr_base_commit" "$seen_base_commit"

# (now you have to manually solve conflicts if needed)
read -n 1 -s -r -p "IF CONFLICTS, manually solve them (In another terminal session) and press any key to continue..."

# get the modified seen_commit, now rebased to *same base* as current_commit
rebased_seen_commit=$(git rev-parse HEAD)

# and finally, display the diff which I should re-review
git diff "$rebased_seen_commit".."$curr_commit"
# note: it is important to use .. to show difference exactly between pointers, not ... which shows difference from last ancestor = whole commit
