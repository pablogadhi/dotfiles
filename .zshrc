# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gadhi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	python
	sudo
	docker
	vagrant
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Pip installed programs in path
export PATH="${PATH}:${HOME}/.local/bin"

# Gem installed programs in path
export PATH="${PATH}:${HOME}/.gem/ruby/2.5.0/bin"

# CUDA
export CUDA_PATH="/usr/lib/cuda-10.2/"

# KindleGen
export PATH="${PATH}:${HOME}/kindlegen_linux_2.6_i386_v2_9"

# TSL Scripts
export PATH="${PATH}:${HOME}/Documents/TSL/tsl-scripts"

# Blender
export PATH="${PATH}:${HOME}/blender-3.1.2-linux-x64"

# Manually installed apps
export PATH="${PATH}:${HOME}/Apps/"
export PATH="${PATH}:${HOME}/.bin/"
export PATH="${PATH}:${HOME}/bin/"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias py="python3"
alias python="python3"
alias pip="pip3"
alias vim="nvim"
alias upsys="sudo apt update && sudo apt upgrade"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gpurun="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
alias android_studio='/usr/local/android-studio/bin/studio.sh'
alias fix_diegos_keyboard='echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode'

# TSL Projects
alias tsl-docker-provision-redis='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/opt/project-ansible --network=host ${PWD##*/} bash -c "cd apps/api && ansible-playbook -c docker -i environments/docker/hosts config_redis.yml"'

alias bdtlsapi="cd /home/gadhi/Documents/TSL/bdtls/bdtls-ansible && docker compose up -d && tsl-docker-provision-redis && tsl-docker runserver"
alias bdtlsweb="cd /home/gadhi/Documents/TSL/bdtls/bdtls_monorepo && nvm use && yarn dev"

alias flowapi="cd /home/gadhi/Documents/TSL/flow/flow-ansible/apps/api && vagrant up db web && vagrant ssh web"
alias flowweb="cd /home/gadhi/Documents/TSL/flow/flow-react && nvm use && npm run dev"

alias vupapi="cd /home/gadhi/Documents/TSL/vup/vup-ansible/apps/api && vagrant up db & vagrant up web && vagrant ssh web"
alias faveweb="cd /home/gadhi/Documents/TSL/vup/vup-fave-web && nvm use 14 && yarn dev"

alias eliteapi="cd /home/gadhi/Documents/TSL/elite/elite-ansible/apps/api && vagrant up db & vagrant up redis & vagrant up web && vagrant ssh web"
alias eliteweb="cd /home/gadhi/Documents/TSL/elite/elite-web && nvm use 14 && yarn dev"

alias svldapi="cd /home/gadhi/Documents/TSL/svld/svld-api-lambda && source venv/bin/activate"
alias svldweb="cd /home/gadhi/Documents/TSL/svld/svld-admin-portal && nvm use"

alias mintweb="cd /home/gadhi/Documents/TSL/mint/mint-web && nvm use"
alias mintapi="cd /home/gadhi/Documents/TSL/mint/mint-ansible/apps/api && vagrant up web && vagrant ssh web"

alias waysapi="cd /home/gadhi/Documents/TSL/ways/ways-ansible && tsl-docker start && tsl-docker runserver"
alias waysweb="cd /home/gadhi/Documents/TSL/ways/ways-web && nvm use && yarn dev"

alias blnapi="cd /home/gadhi/Documents/TSL/bln/bln-django-lambda && docker compose up"
alias blnweb="cd /home/gadhi/Documents/TSL/bln/bln-webapp-nextjs && nvm use && yarn dev"

alias sicuapi="cd /home/gadhi/Documents/TSL/sicu/sicu-api-django && docker compose up"
alias sicuweb="cd /home/gadhi/Documents/TSL/sicu/sicu-web && nvm use && yarn dev"

alias ustapi="cd /home/gadhi/Documents/TSL/ust/ust-api-django && docker compose up"
alias ustweb="cd /home/gadhi/Documents/TSL/ust/ust-web && nvm use && yarn dev"

alias jgrapi="cd /home/gadhi/Documents/TSL/jgr/jgr-api && docker compose up"
alias jgrweb="cd /home/gadhi/Documents/TSL/jgr/jgr-web && nvm use && yarn dev"

alias sppapi="cd /home/gadhi/Documents/TSL/spp/spp-backend-django && docker compose up"
alias sppweb="cd /home/gadhi/Documents/TSL/spp/spp-react && nvm use 18 && yarn dev"

alias hcmuapi="cd /home/gadhi/Documents/TSL/hcmu/hcmu-api-django && docker compose up"
alias hcmuweb="cd /home/gadhi/Documents/TSL/hcmu/hcmu-web && nvm use && yarn dev"


makewal() {
	wal --vte -n -q -b 1A1D2B -i "$1"
}

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval 

# Twilio
TWILIO_AC_ZSH_SETUP_PATH=/home/gadhi/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup

alias twilio-dev="docker start twilio && docker exec -it twilio /usr/local/bin/twilio dev-phone"

# Flux
command -v flux >/dev/null && . <(flux completion zsh)
