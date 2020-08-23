C() {
  case $1 in
    black)    echo -e -n "\033[30m";;
    red)      echo -e -n "\033[31m";;
    green)    echo -e -n "\033[32m";;
    yellow)   echo -e -n "\033[33m";;
    blue)     echo -e -n "\033[34m";;
    magenta)  echo -e -n "\033[35m";;
    cyan)     echo -e -n "\033[36m";;
    white)    echo -e -n "\033[37m";;
    *) echo -e -n "\033[0m";;
  esac
}

git_status() {
  local modified=0
  local cached=0
  local untracked=0

  while read -r line; do
    if [ "$line" = '_?_?_' ]; then
      untracked=1
      continue
    fi

    if [[ "$line" =~ ^_[^[:space:]]_.?_ ]]; then
      cached=1
    fi

    if [[ "$line" =~ ^_._[^[:space:]]_ ]]; then
      modified=1
    fi
  done < <(git status --short | cut -b -2 | sed -e 's/\(.\)\(.*\)/_\1_\2_/')

  if [ $modified -ne 0 ]; then
    C red
    echo -n 'M'
  fi

  if [ $cached -ne 0 ]; then
    C green
    echo -n 'C'
  fi

  if [ $untracked -ne 0 ]; then
    C red
    echo -n '?'
  fi

  if [ -n "$(git stash list)" ]; then
    C cyan
    echo -n 'S'
  fi
  C reset
}

git_branch() {
  local branch
  branch="$(git branch 2>/dev/null | grep '^\*' | sed -e "s/^* //")"
  echo -n "${branch}"
  C reset
}

ps1_git() {
  if ! git status --ignore-submodules &>/dev/null; then
    return
  fi
  echo "$(git_branch)[$(git_status)]"
}

ps1_git
