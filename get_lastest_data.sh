timestamp=$(date +%d.%m.%Y)
rsync /srv/salt/* ./salt
git reset HEAD */*
git reset HEAD *
git add */*
git add *
git commit -m "update $timestamp"
git push origin master
