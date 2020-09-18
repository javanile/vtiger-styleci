#!/usr/bin/env bash
set -e

[[ -d "CLONE" ]] || git clone https://github.com/javanile/vtiger-styleci.git CLONE

cd CLONE

git symbolic-ref HEAD refs/heads/contribute
git rm -rf . && true
rm -r . && true
git pull https://code.vtiger.com/vtiger/vtigercrm.git master -X theirs --no-edit --allow-unrelated-histories
git push --set-upstream origin contribute

cd ..
rm -fr CLONE
