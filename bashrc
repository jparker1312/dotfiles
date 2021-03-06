function cd {
    builtin cd "$@" && ls -laF
}

function up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

function parse_git_branch {
  branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ "HEAD" = "$branch" ]; then
    echo "(no branch)"
  else
    echo "$branch"
  fi
}

function prompt_segment {
  # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
  # change the 37 to change the foreground
  # change the 45 to change the background
  if [[ ! -z "$1" ]]; then
    echo "\[\033[${2:-30};46m\]${1}\[\033[0m\]"
  fi
}

function build_mah_prompt {
  # time
  ps1="$(prompt_segment " \@ ")"

  # cwd
  ps1="${ps1} $(prompt_segment " \w ")"

  # git branch
  git_branch=`parse_git_branch`
  if [[ ! -z "$git_branch" ]]
  then
    ps1="${ps1} $(prompt_segment " $git_branch " 30)"
  fi

  # next line
  ps1="${ps1}\n👻 "
  # set prompt output
  PS1="$ps1"
}

PROMPT_COMMAND='build_mah_prompt'
export HISTCONTROL=ignoredups
