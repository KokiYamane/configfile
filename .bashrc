C() {
  case $1 in
    black)    echo -e -n "\033[1;30m";;
    red)      echo -e -n "\033[1;31m";;
    green)    echo -e -n "\033[1;32m";;
    yellow)   echo -e -n "\033[1;33m";;
    blue)     echo -e -n "\033[1;34m";;
    magenta)  echo -e -n "\033[1;35m";;
    cyan)     echo -e -n "\033[1;36m";;
    white)    echo -e -n "\033[1;37m";;
    *) echo -e -n "\033[0m";;
  esac
}

PS1='\n[\#] `C blue`◷\t '
PS1="${PS1}"'`C green`\u@\h'
PS1="${PS1}"' `C yellow`\w'
PS1="${PS1}"' `C cyan``ps1_git.sh`'
PS1="${PS1}"'\n`C red`❯`C yellow`❯`C green`❯`C reset` '

export LANG='ja_JP.UTF-8'
