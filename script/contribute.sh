#!/bin/bash
set -e

[[ -d "CLONE" ]] || git clone https://code.vtiger.com/javanile/vtigercrm.git CLONE

cd CLONE

git checkout master
git pull https://github.com/javanile/vtiger-styleci.git contribute -X theirs --no-edit --allow-unrelated-histories
git push

cd ..
rm -fr CLONE
