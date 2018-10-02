export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export HOMESTEAD_DIR="$HOME/Homestead"


#####################
# Homestead Aliases
#####################

function homestead_vagrant() {
  (cd $HOMESTEAD_DIR && vagrant $*)
}

function homestead_command() {
  homestead ssh -c "cd /home/vagrant/$1 && $2"
}

alias homestead=homestead_vagrant
alias hcmd=homestead_command
alias hup="homestead up"
alias hdown="homestead halt"
alias hr="homestead reload"
alias hrp="homestead reload --provision"
alias hssh="homestead ssh"
alias hedit="nvim $HOMESTEAD_DIR/Homestead.yaml"

# switch nginx config between local directories
function switch() {
  local config="/usr/local/etc/nginx/nginx.conf"
  sed -i".bak" "s/\s*proxy_pass.*/proxy_pass http:\/\/$1;/" $config
  brew services restart nginx
}


################
# brew aliases
# ##############

alias sv="brew services"
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor"

########
# misc
########
alias myip="ipconfig getifaddr en0"
alias fastlane="/usr/local/Caskroom/fastlane/latest/fastlane_lib/fastlane"

