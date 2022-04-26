# gbr== get branch; or get the current branch name checked out
function gbr() {git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'}

# git push origin for current branch optionally pass --force to force update
function gpo() {git push origin $(gbr) $1}

# create a PR for the current branch
gpr () {
  BRANCH=$(gbr);
  git push -u origin "$BRANCH" &&
  gh pr create --fill &&
  return 0
}

# git checkout branch from main
gcbm () {
  $BRANCH=$1;
  if [[ -z "$1" ]] {
    echo 'please provide a branch name\n';
    echo 'usage: gcbm BranchName \n';
    return 1;
  }
  git checkout main &&
  git pull &&
  git checkout -b $1 &&
  return 0
}

# git rebase quick
function grbq () {
  BRANCH=$(gbr)
  git checkout $BRANCH && git pull --rebase origin main
}


# git grep based find and replace
function git_find_replace(){
  GREPSTR=$1;
  REPLACESTR=$2;
  for f in $(git grep -l $GREPSTR -- $3);
  do;
    sed -i '' "s/$GREPSTR/$REPLACESTR/g" $f;
  done;
}
