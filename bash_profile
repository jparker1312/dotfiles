export PATH="/usr/local/bin:$PATH"

# Path to the bash it configuration
export BASH_IT="/Users/localadmin/.bash_it"

# Lock and Load a custom theme file
export BASH_IT_THEME="bobby"

# Load Bash It
source $BASH_IT/bash_it.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/localadmin/bin:~/bin
git config --global hub.protocol https
git config --global credential.helper "cache --timeout=36000"
export no_proxy=192.168.50.4,xip.io
