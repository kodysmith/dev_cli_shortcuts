# cli colors
GH_GREEN="\033[1;32m";
GH_RED="\033[1;31m";
GH_UN="\033[1;34m";

# gbr== get branch; or get the current branch name checked out
function gbr() {git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'}

# git push origin for current branch optionally pass --force to force update
function gpo() {git push origin $(gbr) $1}

# create a PR for the current branch
function gpr () {
  BRANCH=$(gbr);
  git push -u origin "$BRANCH" &&
  gh pr create --fill &&
  return 0
}

# git checkout shorthand 
function gco() {
  if [[ -z "$1" ]] {
    echo "${GH_RED}please provide a branch name";
    echo "${GH_UN}Usage: gco myBranch\n";
    return 1;
  } else {
    git checkout $1;
  }
  return 0;
}

# git checkout branch from main
function gcbm () {
  BRANCH=$1;
  if [[ -z "$BRANCH" ]] {
    echo "${GH_RED}please provide a branch name\n";
    echo "${GH_UN}usage: gcbm BranchName \n";
    return 1;
  }
  git checkout main &&
  git pull &&
  git checkout -b $BRANCH &&
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

# git branch delete all (list)
# Why? because sometimes you want to copy / paste the branches you want to delete
# Alternative: git branch -D branchName1 branchName1_1 branchName2 branchName3
#
# gathering branches to delete:
#
# BRANCHES=$(git branch |grep branchName1)
# gbda $BRANCHES
#
# usage: gbda "ksmith/foo \nksmith/bar \nksmith/baz"
# alternate usage: 
# gbda '
# ksmith/foo
# ksmith/bar
# ksmith/baz';

function gbda () {
  BRANCHES=$1;
  if [[ -z "$1" ]] {
    echo "${GH_RED}please provide a branch name(s)\n";
    echo "${GH_UN}usage: gbda 'BranchName1 \nBranchName2 \nBranchName3' \n";
    return 1;
  }

  for branch in $(echo $BRANCHES)
  do
    git branch -D $branch
  done
}
contributors () {
	git log --pretty="format:%an" -- $1 | sort | uniq -c | sort -r | head -n 30
}
hotspot () {
	git log --name-only --pretty="format:" -- $1 | sort | uniq -c | sort -r | head -n 30
}
