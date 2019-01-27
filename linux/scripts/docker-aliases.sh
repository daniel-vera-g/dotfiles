###########
# DOCKER ALIASES & FUNCTIONS
##########

############################################## Functions ##############################################

# Run a bash shell in the specified container.
dexbash() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker exec -it $1 /bin/bash
}

alias deb='dexbash'

# Remove containers created before a specific container
function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

# IP addresses of all running containers
function dipall-fn {
	echo "IP addresses of all named running containers"

	for DOC in `dnames-fn`
	do
  		IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
  		echo $DOC : $IP
	done
}

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# From functions
alias dex=dex-fn
alias di=di-fn
alias dipall=dipall-fn
alias dnames=dnames-fn

############################################## Commands ##############################################

# Docker in general
alias dk="sudo docker"

# Docker run
alias dkr="sudo docker run"

# Create
alias dkcr="sudo docker create"

# Execute
alias dkex="sudo docker exec" 

# Start
alias dkst="sudo docker start"

# Get Images
alias dki="sudo docker images"

############################### Clean up ############################### -> TODO: EXPORT TO CLEAN UP SCRIPT
# List all exited containers
alias dkle="docker ps -aq -f status=exited"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove stopped containers
alias dkrm="docker ps -aq --no-trunc -f status=exited | xargs docker rm"
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove containers created before a specific container
function dex-fn {
    docker exec -it $1 /bin/bash
}
# Remove containers created before a specific container
function di-fn {
	docker inspect $1
}

# Remove dangling/untagged images
alias dkrim="docker images -q --filter dangling=true | xargs docker rmi"
# Remove all images
dkri() { docker rmi $(docker images -q); }

# Other cleaning aliases
alias dkflush='docker rm `docker ps --no-trunc -aq`'
alias dkflush2='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

###########################################################################

# Get process & stats
alias dkpsa="sudo docker ps -a"
alias dkps="sudo docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"
alias dkst='sudo docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"'

# Other
alias dks='sudo docker service'
alias dkrm='sudo docker rm'
alias dkl='sudo docker logs'
alias dklf='sudo docker logs -f'

# SOURCES:
# https://gist.github.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb
# https://raw.githubusercontent.com/tcnksm/docker-alias/master/zshrc
# https://hackernoon.com/handy-docker-aliases-4bd85089a3b8
# https://dev.to/argherna/bash-functions-and-aliases-for-the-beginning-docker-developer-d4
