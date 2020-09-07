#!/bin/bash
set -e

[[ -d "CLONE" ]] || git clone https://github.com/javanile/vtiger-styleci.git CLONE

cd CLONE

git checkout master
git pull https://code.vtiger.com/vtiger/vtigercrm.git master -X theirs --no-edit --allow-unrelated-histories
git push

cd ..
rm -fr CLONE
