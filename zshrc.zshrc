export PATH="$PATH:$HOME/.lmstudio/bin"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias home="cd ~"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias proj="cd ~/Projects"
alias apps="cd /Applications"
alias finder="open ."
alias c="clear"
alias cls="clear"
alias h="history"
alias j="jobs"
alias x="exit"
alias q="exit"
alias pwd="pwd && pwd | pbcopy"
alias back="cd -"
alias uvirun="uvicorn main:app --reload --host 0.0.0.0 --port 8000"

alias cd..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias l="ls -la"
alias ll="ls -alF"
alias la="ls -A"
alias ls="ls -G"
alias lh="ls -la | head -20"
alias lt="ls -lat | head -20"
alias ltr="ls -latr"
alias lsize="ls -laSh"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias count="find . -type f | wc -l"
alias countd="find . -type d | wc -l"

alias lf="ls -lh | \\grep -v '^d'"
alias ld="ls -lh | \\grep '^d'"
alias lsd="ls -d */"
alias recent="ls -lt | head -20"
alias oldest="ls -ltr | head -20"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias rmf="rm -rf"
alias mkdir="mkdir -pv"
alias size="du -sh"
alias sizes="du -sh * | sort -hr"
alias biggest="du -sh * | sort -hr | head -10"
alias zip="zip -r"
alias diff="diff --color=auto"
alias watch="watch -n 1"
alias tail="tail -f"
alias head="head -20"
alias less="less -R"

alias cpv="rsync -ah --info=progress2"
alias mvv="rsync -ah --info=progress2 --remove-source-files"
alias trashcan="open ~/.Trash"
alias emptytrash="rm -rf ~/.Trash/*"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias path="echo $PATH | tr ':' '\n'"
alias which="which -a"
alias ff="find . -type f -name"
alias fd="find . -type d -name"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias search="grep -r"

alias myip="curl -s ifconfig.me"
alias localip="ipconfig getifaddr en0"
alias ip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias pingg="ping 8.8.8.8"
alias fastping="ping -c 10 -i 0.2"

alias mydisk="df -h"
alias diskfree="df -h | grep -E '^/dev/'"
alias topcpu="ps aux | sort -rn -k 3,3 | head -10"
alias topmem="ps aux | sort -rn -k 4,4 | head -10"
alias ports="lsof -i -P | grep LISTEN"
alias ping="ping -c 5"
alias psgrep="ps aux | \\grep"
alias myps="ps -f -u $USER"

alias cpu="sysctl -n machdep.cpu.brand_string"
alias mem="top -l 1 -s 0 | grep PhysMem"
alias listening="lsof -iTCP -sTCP:LISTEN -n -P"
alias established="lsof -iTCP -sTCP:ESTABLISHED -n -P"
alias connections="netstat -an | grep ESTABLISHED | wc -l"

alias reload="source ~/.zshrc"
alias zshopen="code ~/.zshrc"
alias zshrc="code ~/.zshrc"
alias hosts="sudo code /etc/hosts"
alias sshconfig="code ~/.ssh/config"
alias profile="code ~/.zshrc"

alias bashrc="code ~/.bashrc"
alias vimrc="code ~/.vimrc"
alias gitconfig="code ~/.gitconfig"

alias cleanmac="rm -rf ~/Library/Caches/* && echo 'Cache cleared'"
alias cleanlogs="sudo rm -rf /var/log/* && echo 'Logs cleared'"
alias cleantemp="rm -rf /tmp/* && echo 'Temp files cleared'"
alias cleanbrew="brew cleanup && echo 'Brew cleaned'"
alias cleannpm="npm cache clean --force && echo 'NPM cache cleaned'"
alias cleanyarn="yarn cache clean && echo 'Yarn cache cleaned'"
alias cleanpip="pip3 cache purge && echo 'Pip cache cleaned'"
alias cleands="find . -name '.DS_Store' -type f -delete && echo '.DS_Store files removed'"
alias cleannode="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' + && echo 'node_modules removed'"
alias cleanpyc="find . -type f -name '*.pyc' -delete && find . -type d -name '__pycache__' -delete && echo 'Python cache cleaned'"
alias cleandocker="docker system prune -af --volumes && echo 'Docker cleaned'"
alias cleandownloads="find ~/Downloads -type f -mtime +30 -delete && echo 'Old downloads cleaned'"
alias cleantrash="rm -rf ~/.Trash/* && echo 'Trash emptied'"

unalias cleanall 2>/dev/null

cleanall() {
    local RED='\033[0;31m'
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local BLUE='\033[0;34m'
    local PURPLE='\033[0;35m'
    local CYAN='\033[0;36m'
    local NC='\033[0m'
    local BOLD='\033[1m'

    clear
    echo -e "${BOLD}${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║                                                        ║${NC}"
    echo -e "${BOLD}${CYAN}║           macOS SYSTEM CLEANUP UTILITY                 ║${NC}"
    echo -e "${BOLD}${CYAN}║                                                        ║${NC}"
    echo -e "${BOLD}${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -e "${BOLD}${PURPLE}Current Disk Usage:${NC}"
    df -h / | awk 'NR==1 {print "   " $0} NR>1 {printf "   %s %s %s %s (%s used)\n", $1, $2, $3, $4, $5}'
    echo ""

    local cache_size=$(du -sh ~/Library/Caches 2>/dev/null | awk '{print $1}')
    local trash_size=$(du -sh ~/.Trash 2>/dev/null | awk '{print $1}')
    local downloads_size=$(find ~/Downloads -type f -mtime +30 2>/dev/null | xargs du -ch 2>/dev/null | tail -1 | awk '{print $1}')

    echo -e "${BOLD}${YELLOW}Available Cleanup Options:${NC}"
    echo ""
    echo -e "  ${BOLD}1.${NC} System Caches          ${BLUE}[~$cache_size]${NC}"
    echo -e "  ${BOLD}2.${NC} Package Manager Caches  ${BLUE}[Brew/NPM/Yarn/Pip]${NC}"
    echo -e "  ${BOLD}3.${NC} Trash                   ${BLUE}[~$trash_size]${NC}"
    echo -e "  ${BOLD}4.${NC} Old Downloads (>30d)    ${BLUE}[~$downloads_size]${NC}"
    echo -e "  ${BOLD}5.${NC} .DS_Store Files         ${BLUE}[System metadata]${NC}"
    echo -e "  ${BOLD}6.${NC} Docker Cleanup          ${BLUE}[Images/Containers/Volumes]${NC}"
    echo -e "  ${BOLD}7.${NC} System Logs             ${BLUE}[/var/log]${NC}"
    echo -e "  ${BOLD}8.${NC} Memory Purge            ${BLUE}[RAM cleanup]${NC}"
    echo -e "  ${BOLD}9.${NC} ${GREEN}ALL OF THE ABOVE${NC}      ${BLUE}[Complete cleanup]${NC}"
    echo -e "  ${BOLD}0.${NC} Exit"
    echo ""
    echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════${NC}"
    echo -ne "${BOLD}Select option (0-9): ${NC}"
    read choice
    echo ""

    case $choice in
        1)
            echo -e "${YELLOW}Cleaning system caches...${NC}"
            rm -rf ~/Library/Caches/* 2>/dev/null
            echo -e "${GREEN}System caches cleared${NC}"
            ;;
        2)
            echo -e "${YELLOW}Cleaning package manager caches...${NC}"
            if command -v brew &> /dev/null; then
                echo "   Cleaning Homebrew..."
                brew cleanup 2>/dev/null
            fi
            if command -v npm &> /dev/null; then
                echo "   Cleaning NPM..."
                npm cache clean --force 2>/dev/null
            fi
            if command -v yarn &> /dev/null; then
                echo "   Cleaning Yarn..."
                yarn cache clean 2>/dev/null
            fi
            if command -v pip3 &> /dev/null; then
                echo "   Cleaning Pip..."
                pip3 cache purge 2>/dev/null
            fi
            echo -e "${GREEN}Package manager caches cleared${NC}"
            ;;
        3)
            echo -e "${YELLOW}Emptying trash...${NC}"
            rm -rf ~/.Trash/* 2>/dev/null
            echo -e "${GREEN}Trash emptied${NC}"
            ;;
        4)
            echo -e "${YELLOW}Removing old downloads (>30 days)...${NC}"
            find ~/Downloads -type f -mtime +30 -delete 2>/dev/null
            echo -e "${GREEN}Old downloads removed${NC}"
            ;;
        5)
            echo -e "${YELLOW}Removing .DS_Store files...${NC}"
            find ~ -name '.DS_Store' -type f -delete 2>/dev/null
            echo -e "${GREEN}.DS_Store files removed${NC}"
            ;;
        6)
            if command -v docker &> /dev/null; then
                echo -e "${YELLOW}Cleaning Docker...${NC}"
                echo -ne "${RED}   This will remove ALL unused containers, images, and volumes. Continue? (y/N): ${NC}"
                read confirm
                if [[ $confirm == "y" || $confirm == "Y" ]]; then
                    docker system prune -af --volumes 2>/dev/null
                    echo -e "${GREEN}Docker cleaned${NC}"
                else
                    echo -e "${YELLOW}Skipped Docker cleanup${NC}"
                fi
            else
                echo -e "${RED}Docker not installed${NC}"
            fi
            ;;
        7)
            echo -e "${YELLOW}Cleaning system logs...${NC}"
            echo -ne "${RED}   Requires sudo. Continue? (y/N): ${NC}"
            read confirm
            if [[ $confirm == "y" || $confirm == "Y" ]]; then
                sudo rm -rf /var/log/* 2>/dev/null
                echo -e "${GREEN}System logs cleared${NC}"
            else
                echo -e "${YELLOW}Skipped log cleanup${NC}"
            fi
            ;;
        8)
            echo -e "${YELLOW}Purging inactive memory...${NC}"
            echo -ne "${RED}   Requires sudo. Continue? (y/N): ${NC}"
            read confirm
            if [[ $confirm == "y" || $confirm == "Y" ]]; then
                sudo purge
                echo -e "${GREEN}Memory purged${NC}"
            else
                echo -e "${YELLOW}Skipped memory purge${NC}"
            fi
            ;;
        9)
            echo -e "${BOLD}${GREEN}Running COMPLETE system cleanup...${NC}"
            echo ""

            echo -e "${YELLOW}[1/8] Cleaning system caches...${NC}"
            rm -rf ~/Library/Caches/* 2>/dev/null
            echo -e "${GREEN}      Done${NC}"

            echo -e "${YELLOW}[2/8] Cleaning package managers...${NC}"
            if command -v brew &> /dev/null; then
                brew cleanup 2>/dev/null
            fi
            if command -v npm &> /dev/null; then
                npm cache clean --force 2>/dev/null
            fi
            if command -v yarn &> /dev/null; then
                yarn cache clean 2>/dev/null
            fi
            if command -v pip3 &> /dev/null; then
                pip3 cache purge 2>/dev/null
            fi
            echo -e "${GREEN}      Done${NC}"

            echo -e "${YELLOW}[3/8] Emptying trash...${NC}"
            rm -rf ~/.Trash/* 2>/dev/null
            echo -e "${GREEN}      Done${NC}"

            echo -e "${YELLOW}[4/8] Removing old downloads...${NC}"
            find ~/Downloads -type f -mtime +30 -delete 2>/dev/null
            echo -e "${GREEN}      Done${NC}"

            echo -e "${YELLOW}[5/8] Removing .DS_Store files...${NC}"
            find ~ -name '.DS_Store' -type f -delete 2>/dev/null
            echo -e "${GREEN}      Done${NC}"

            if command -v docker &> /dev/null; then
                echo -e "${YELLOW}[6/8] Docker cleanup...${NC}"
                echo -ne "${RED}      Clean Docker? (y/N): ${NC}"
                read docker_confirm
                if [[ $docker_confirm == "y" || $docker_confirm == "Y" ]]; then
                    docker system prune -af --volumes 2>/dev/null
                    echo -e "${GREEN}      Done${NC}"
                else
                    echo -e "${YELLOW}      Skipped${NC}"
                fi
            else
                echo -e "${YELLOW}[6/8] Docker not installed, skipping${NC}"
            fi

            echo -e "${YELLOW}[7/8] System logs...${NC}"
            echo -ne "${RED}      Clean logs (requires sudo)? (y/N): ${NC}"
            read logs_confirm
            if [[ $logs_confirm == "y" || $logs_confirm == "Y" ]]; then
                sudo rm -rf /var/log/* 2>/dev/null
                echo -e "${GREEN}      Done${NC}"
            else
                echo -e "${YELLOW}      Skipped${NC}"
            fi

            echo -e "${YELLOW}[8/8] Memory purge...${NC}"
            echo -ne "${RED}      Purge memory (requires sudo)? (y/N): ${NC}"
            read mem_confirm
            if [[ $mem_confirm == "y" || $mem_confirm == "Y" ]]; then
                sudo purge
                echo -e "${GREEN}      Done${NC}"
            else
                echo -e "${YELLOW}      Skipped${NC}"
            fi

            echo ""
            echo -e "${BOLD}${GREEN}════════════════════════════════════════════════════════${NC}"
            echo -e "${BOLD}${GREEN}Complete cleanup finished${NC}"
            echo -e "${BOLD}${GREEN}════════════════════════════════════════════════════════${NC}"
            ;;
        0)
            echo -e "${YELLOW}Exiting cleanup utility${NC}"
            return 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            return 1
            ;;
    esac

    echo ""
    echo -e "${BOLD}${PURPLE}Disk Usage After Cleanup:${NC}"
    df -h / | awk 'NR==1 {print "   " $0} NR>1 {printf "   %s %s %s %s (%s used)\n", $1, $2, $3, $4, $5}'
    echo ""
    echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Cleanup complete${NC}"
    echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════${NC}"
}

alias battery="pmset -g batt"
alias uptime="uptime"
alias whoami="whoami"

alias temp="sudo powermetrics --samplers smc | grep -i 'CPU die temperature'"
alias fans="sudo powermetrics --samplers smc | grep -i 'Fan'"
alias sleepnow="pmset sleepnow"
alias restart="sudo shutdown -r now"
alias shutdownnow="sudo shutdown -h now"

alias brewup="brew update && brew upgrade && brew cleanup"
alias brewl="brew list"
alias brews="brew services list"
alias brewi="brew install"
alias brewu="brew uninstall"
alias brewinfo="brew info"
alias brewsearch="brew search"

alias brewdeps="brew deps --tree --installed"
alias brewoutdated="brew outdated"
alias brewleaves="brew leaves"
alias brewcask="brew list --cask"

unalias deactivate 2>/dev/null
alias python="python3"
alias py="python3"
alias pip="pip3"
alias pipi="pip3 install"
alias pipu="pip3 uninstall"
alias piplist="pip3 list"
alias pipr="pip3 install -r requirements.txt"
alias pipf="pip3 freeze > requirements.txt"
alias venvc="python3 -m venv .venv && source .venv/bin/activate"
alias venv="source .venv/bin/activate"
alias globalvenv="source ~/.globalvenv/bin/activate"
alias pyserver="python3 -m http.server"
alias pytest="python3 -m pytest"

alias pipupgrade="pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U"
alias pipshow="pip3 show"
alias pipsearch="pip3 search"
alias pypath="python3 -c 'import sys; print(\"\n\".join(sys.path))'"
alias pyversion="python3 --version"
alias pyclean="find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete"
alias venvhere="python3 -m venv venv && source venv/bin/activate"
alias ipython="python3 -m IPython"
alias notebook="jupyter notebook"

alias npmi="npm install"
alias npmu="npm uninstall"
alias npms="npm start"
alias npmt="npm test"
alias npmr="npm run"
alias dev="npm run dev"
alias start="npm start"
alias test="npm test"
alias build="npm run build"
alias yi="yarn install"
alias ya="yarn add"
alias yr="yarn remove"
alias ys="yarn start"
alias yt="yarn test"
alias yb="yarn build"

alias npml="npm list --depth=0"
alias npmg="npm list -g --depth=0"
alias npmo="npm outdated"
alias npmup="npm update"
alias npminit="npm init -y"
alias yarnl="yarn list --depth=0"
alias yarng="yarn global list"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrs="npm run start"

alias g="git"
alias gs="git status"
alias gss="git status -s"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcane="git commit --amend --no-edit"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gp="git push"
alias gpu="git push -u origin"
alias gpf="git push --force-with-lease"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gf="git fetch"
alias gcl="git clone"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcom="git checkout main"
alias gm="git merge"
alias gr="git rebase"
alias gri="git rebase -i"
alias gd="git diff"
alias gdc="git diff --cached"
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gl="git log --oneline -10"
alias gll="git log --oneline"
alias glg="git log --graph --oneline --decorate --all"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias greset="git reset --hard HEAD"
alias gundo="git reset --soft HEAD~1"
alias gremote="git remote -v"
gitall() {
    echo "Enter your commit message:"
    read msg
    if [ -z "$msg" ]; then
        echo "Commit message cannot be empty."
        return 1
    fi
    git add .
    git commit -m "$msg"
    git push origin main
    echo "All changes committed and pushed to main"
}
alias gita="gitall"
gitbackups() {
    local backup_dir=".git_backups"
    mkdir -p "$backup_dir"

    echo "Git Backup Manager"
    echo "----------------------------"
    echo "1  Create new backup"
    echo "2  List backups"
    echo "3  Restore from backup"
    echo "4  Delete a backup"
    echo "5  Exit"
    echo "----------------------------"
    echo -n "Choose an option (1-5): "
    read choice

    case $choice in
        1)
            local ts=$(date +"%Y-%m-%d_%H-%M-%S")
            local backup_branch="backup_$ts"
            git checkout -b "$backup_branch"
            git add .
            git commit -m "Backup on $ts"
            git tag "backup_$ts"
            echo "$backup_branch" >> "$backup_dir/list.txt"
            git checkout main >/dev/null 2>&1
            echo "Backup created: $backup_branch"
            ;;
        2)
            echo "Available Backups:"
            if [ ! -f "$backup_dir/list.txt" ]; then
                echo "No backups found."
                return
            fi
            nl -w2 -s'. ' "$backup_dir/list.txt"
            ;;
        3)
            if [ ! -f "$backup_dir/list.txt" ]; then
                echo "No backups found to restore."
                return
            fi
            echo "Available Backups:"
            nl -w2 -s'. ' "$backup_dir/list.txt"
            echo -n "Enter backup number to restore: "
            read num
            local backup_branch=$(sed -n "${num}p" "$backup_dir/list.txt")
            if [ -z "$backup_branch" ]; then
                echo "Invalid selection."
                return
            fi
            echo "This will restore from: $backup_branch"
            echo -n "Type 'yes' to confirm: "
            read confirm
            if [ "$confirm" = "yes" ]; then
                git checkout "$backup_branch"
                echo "Restored backup: $backup_branch"
            else
                echo "Cancelled."
            fi
            ;;
        4)
            if [ ! -f "$backup_dir/list.txt" ]; then
                echo "No backups to delete."
                return
            fi
            echo "Backups:"
            nl -w2 -s'. ' "$backup_dir/list.txt"
            echo -n "Enter backup number to delete: "
            read num
            local backup_branch=$(sed -n "${num}p" "$backup_dir/list.txt")
            if [ -z "$backup_branch" ]; then
                echo "Invalid selection."
                return
            fi
            echo -n "Type 'yes' to delete $backup_branch: "
            read confirm
            if [ "$confirm" = "yes" ]; then
                git branch -D "$backup_branch" >/dev/null 2>&1
                sed -i '' "${num}d" "$backup_dir/list.txt"
                echo "Deleted backup: $backup_branch"
            else
                echo "Cancelled."
            fi
            ;;
        5)
            echo "Exiting Backup Manager."
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}
alias gbak="gitbackups"

alias gignore="curl -sL https://www.gitignore.io/api/$@ >> .gitignore"
alias gtags="git tag -l"
alias gshow="git show"
alias gblame="git blame"
alias gclean="git clean -fd"
alias gpristine="git reset --hard && git clean -dfx"
alias gwho="git shortlog -sn"
alias gcontrib="git shortlog --summary --numbered"
alias glast="git log -1 HEAD --stat"
alias gdiff="git diff --word-diff"
alias gcount="git rev-list --count HEAD"
alias gfind="git log --all --full-history --source -- "
alias guncommit="git reset --soft HEAD~1"
alias gopen="open \$(git remote get-url origin | sed 's/git@github.com:/https:\\/\\/github.com\\//' | sed 's/\\.git$//')"
alias gbr="git branch -r"
alias gcd='cd "$(git rev-parse --show-toplevel)"'

alias code="code"
alias cr="code -r"
alias d="docker"
alias dc="docker-compose"
alias dps="docker ps"
alias di="docker images"
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias httpserver="python3 -m http.server 8000"
alias copy="pbcopy"
alias paste="pbpaste"

alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"
alias dcl="docker-compose logs -f"
alias dpa="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"
alias dstop="docker stop \$(docker ps -aq)"
alias drmall="docker rm \$(docker ps -aq)"
alias drmiall="docker rmi \$(docker images -q)"
alias dexec="docker exec -it"
alias dlogs="docker logs -f"
alias dvolumes="docker volume ls"
alias dnetworks="docker network ls"

alias kd="kubectl describe"
alias ke="kubectl edit"
alias kl="kubectl logs -f"
alias kx="kubectl exec -it"
alias ka="kubectl apply -f"
alias kdel="kubectl delete"
alias kgn="kubectl get nodes"
alias kgd="kubectl get deployments"

mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

backup() {
    cp "$1"{,.bak-$(date +%Y%m%d-%H%M%S)}
}

mkvenv() {
    python3 -m venv "${1:-venv}" && source "${1:-venv}/bin/activate"
}

gcp() {
    git add .
    git commit -m "$1"
    git push
}

killport() {
    lsof -ti:$1 | xargs kill -9
}

dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

take() {
    mkdir -p "$1" && cd "$1"
}

whoisport() {
    lsof -i :$1
}

weather() {
    curl -s "wttr.in/${1}?format=3"
}

weatherfull() {
    curl -s "wttr.in/${1}"
}

note() {
    echo "$(date +%Y-%m-%d\ %H:%M:%S): $*" >> ~/notes.txt
}

notes() {
    cat ~/notes.txt
}

gcmoji() {
    local emoji=$1
    shift
    git commit -m "$emoji $*"
}

compresspdf() {
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${1%.*}_compressed.pdf" "$1"
}

filesize() {
    du -sh "$1"
}

sr() {
    find . -type f -exec sed -i '' "s/$1/$2/g" {} +
}

largest() {
    du -ah . | sort -rh | head -n ${1:-20}
}

dirtree() {
    find . -maxdepth ${1:-2} -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
}

timer() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        echo -ne "$seconds\033[0K\r"
        sleep 1
        : $((seconds--))
    done
    echo "Time's up!"
    afplay /System/Library/Sounds/Glass.aiff
}

calc() {
    python3 -c "print($*)"
}

genpass() {
    openssl rand -base64 ${1:-16}
}

json() {
    python3 -m json.tool
}

serve() {
    python3 -m http.server ${1:-8000}
}

copypath() {
    realpath "$1" | tr -d '\n' | pbcopy
    echo "Path copied: $(realpath "$1")"
}
alias cpath="copypath"

copyfile() {
    cat "$1" | pbcopy
    echo "File contents copied: $1"
}
alias cfile="copyfile"

copyabs() {
    pwd | tr -d '\n' | pbcopy
    echo "Current path copied: $(pwd)"
}
alias cpwd="copyabs"

pytorchenv() {
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        python3 -m venv .venv
        source .venv/bin/activate
        pip install --upgrade pip
        pip install torch torchvision torchaudio
        pip install numpy matplotlib jupyter ipython
    fi
    echo "PyTorch environment activated"
}

mlenv() {
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        python3 -m venv .venv
        source .venv/bin/activate
        pip install --upgrade pip
        pip install torch torchvision torchaudio
        pip install numpy pandas matplotlib seaborn scikit-learn
        pip install jupyter ipython notebook
        pip install tqdm tensorboard
    fi
    echo "ML environment activated"
}

webenv() {
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        python3 -m venv .venv
        source .venv/bin/activate
        pip install --upgrade pip
        pip install fastapi uvicorn
        pip install sqlalchemy pydantic
        pip install python-multipart python-jose passlib bcrypt
        pip install pytest pytest-asyncio httpx
    fi
    echo "Web development environment activated"
}

researchenv() {
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        python3 -m venv .venv
        source .venv/bin/activate
        pip install --upgrade pip
        pip install torch torchvision torchaudio
        pip install transformers datasets
        pip install numpy pandas matplotlib seaborn
        pip install jupyter ipython notebook
        pip install wandb tensorboard
        pip install scikit-learn scipy
    fi
    echo "Research environment activated"
}

alias pte="pytorchenv"
alias mle="mlenv"
alias webe="webenv"
alias rese="researchenv"

trainwatch() {
    watch -n 1 'ps aux | grep python | grep -v grep'
}

gpuwatch() {
    if command -v nvidia-smi &> /dev/null; then
        watch -n 1 nvidia-smi
    else
        echo "nvidia-smi not found. Showing CPU usage instead:"
        watch -n 1 'top -l 1 | grep -E "^CPU|^PhysMem"'
    fi
}

memwatch() {
    watch -n 1 'top -l 1 | grep -E "^CPU|^PhysMem"'
}

portcheck() {
    local port=${1:-8000}
    lsof -i :$port
    if [ $? -eq 0 ]; then
        echo "Port $port is in use"
        echo -n "Kill process? (y/n): "
        read answer
        if [ "$answer" = "y" ]; then
            lsof -ti:$port | xargs kill -9
            echo "Process killed"
        fi
    else
        echo "Port $port is available"
    fi
}

quickapi() {
    cat > main.py << 'EOF'
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
EOF
    echo "FastAPI template created in main.py"
    echo "Run with: uvicorn main:app --reload"
}

quickreact() {
    npx create-react-app ${1:-my-app}
    cd ${1:-my-app}
    echo "React app created: ${1:-my-app}"
}

quicknext() {
    npx create-next-app@latest ${1:-my-app} --typescript --tailwind --app --src-dir
    cd ${1:-my-app}
    echo "Next.js app created: ${1:-my-app}"
}

jupyterhere() {
    if [ ! -d ".venv" ]; then
        python3 -m venv .venv
        source .venv/bin/activate
        pip install jupyter notebook ipython
    else
        source .venv/bin/activate
    fi
    jupyter notebook
}

alias jup="jupyterhere"

tensorboard() {
    if [ -z "$1" ]; then
        echo "Usage: tensorboard <logdir>"
        echo "Example: tensorboard ./runs"
        return 1
    fi
    python3 -m tensorboard.main --logdir="$1" --port=6006
}

alias tb="tensorboard"

modelsize() {
    if [ ! -f "$1" ]; then
        echo "File not found: $1"
        return 1
    fi
    local size=$(du -h "$1" | cut -f1)
    local count=$(python3 << EOF
import sys
try:
    import torch
    model = torch.load("$1", map_location='cpu')
    if isinstance(model, dict) and 'state_dict' in model:
        params = sum(p.numel() for p in model['state_dict'].values())
    else:
        params = sum(p.numel() for p in model.parameters()) if hasattr(model, 'parameters') else 0
    print(f"{params:,}")
except Exception as e:
    print("Error:", str(e))
EOF
)
    echo "File size: $size"
    echo "Parameters: $count"
}

gitignore() {
    if [ -z "$1" ]; then
        echo "Usage: gitignore <template>"
        echo "Example: gitignore python"
        echo "Multiple: gitignore python,node,react"
        return 1
    fi
    curl -sL "https://www.gitignore.io/api/$1" >> .gitignore
    echo ".gitignore updated with $1 template"
}

alias gi="gitignore"

projectinit() {
    local name=${1:-project}
    mkdir -p "$name"
    cd "$name"
    git init
    echo "# $name" > README.md
    echo "node_modules/\n.venv/\n__pycache__/\n*.pyc\n.DS_Store\n.env" > .gitignore
    echo "Project initialized: $name"
}

pyinit() {
    local name=${1:-project}
    mkdir -p "$name"
    cd "$name"
    git init
    python3 -m venv .venv
    source .venv/bin/activate
    cat > .gitignore << 'EOF'
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
.venv/
venv/
ENV/
.env
*.egg-info/
dist/
build/
.DS_Store
EOF
    echo "# $name" > README.md
    touch requirements.txt
    echo "Python project initialized: $name"
}

reactinit() {
    local name=${1:-my-app}
    npx create-react-app "$name"
    cd "$name"
    echo "React project initialized: $name"
}

findlarge() {
    local size=${1:-100M}
    echo "Finding files larger than $size..."
    find . -type f -size +$size -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
}

finddupe() {
    find . -type f -exec shasum {} \; | sort | uniq -d -w 40
}

diskusage() {
    du -sh */ 2>/dev/null | sort -hr | head -20
}

alias du1="du -h -d 1 | sort -hr"
alias du2="du -h -d 2 | sort -hr"

unalias ports 2>/dev/null

ports() {
    echo "Common development ports:"
    echo "3000: React default"
    echo "3001: React alternative"
    echo "4200: Angular"
    echo "5000: Flask default"
    echo "5173: Vite"
    echo "8000: FastAPI/Django default"
    echo "8080: General web"
    echo "8888: Jupyter"
    echo "6006: TensorBoard"
    echo ""
    echo "Currently listening ports:"
    lsof -iTCP -sTCP:LISTEN -n -P
}

alias portlist="ports"

requirements() {
    if [ ! -f "requirements.txt" ]; then
        pip3 freeze > requirements.txt
        echo "requirements.txt created"
    else
        echo "requirements.txt already exists"
        echo -n "Overwrite? (y/n): "
        read answer
        if [ "$answer" = "y" ]; then
            pip3 freeze > requirements.txt
            echo "requirements.txt updated"
        fi
    fi
}

alias req="requirements"

envinfo() {
    echo "Python Environment Info"
    echo "======================="
    echo "Python: $(python3 --version)"
    echo "Location: $(which python3)"
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "Virtual Env: $VIRTUAL_ENV"
        echo "Packages:"
        pip3 list | head -20
    else
        echo "No virtual environment active"
    fi
}

alias ei="envinfo"

gitquick() {
    local msg=${1:-"Quick update"}
    git add .
    git commit -m "$msg"
    git push
}

alias gq="gitquick"

gitundo() {
    git reset --soft HEAD~1
}

alias gu="gitundo"

branchclean() {
    echo "Cleaning merged branches..."
    git branch --merged | command grep -v "\*\|main\|master\|develop" | xargs -n 1 git branch -d
    echo "Merged branches cleaned"
}

alias bc="branchclean"

logview() {
    local file=${1:-"*.log"}
    tail -f $file | command grep --color=auto -E 'ERROR|WARN|INFO|DEBUG|$'
}

alias lv="logview"

dockercleanup() {
    echo "Docker cleanup options:"
    echo "1. Remove stopped containers"
    echo "2. Remove unused images"
    echo "3. Remove unused volumes"
    echo "4. Full cleanup (all unused)"
    echo "5. Exit"
    echo -n "Choose (1-5): "
    read choice
    case $choice in
        1)
            docker container prune -f
            echo "Stopped containers removed"
            ;;
        2)
            docker image prune -a -f
            echo "Unused images removed"
            ;;
        3)
            docker volume prune -f
            echo "Unused volumes removed"
            ;;
        4)
            docker system prune -a -f --volumes
            echo "Full cleanup complete"
            ;;
        5)
            echo "Exiting"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
}

alias dclean="dockercleanup"

npmfix() {
    echo "Fixing npm issues..."
    rm -rf node_modules package-lock.json
    npm cache clean --force
    npm install
    echo "npm fixed"
}

alias nf="npmfix"

yarnfix() {
    echo "Fixing yarn issues..."
    rm -rf node_modules yarn.lock
    yarn cache clean
    yarn install
    echo "yarn fixed"
}

alias yf="yarnfix"

venvlist() {
    echo "Virtual environments in current directory:"
    find . -maxdepth 2 -name "activate" -path "*/bin/*" | sed 's|/bin/activate||g'
}

alias vl="venvlist"

pipfreeze() {
    pip3 freeze > requirements.txt
    echo "requirements.txt created with $(wc -l < requirements.txt) packages"
}

alias pf="pipfreeze"

condaenv() {
    if command -v conda &> /dev/null; then
        conda env list
    else
        echo "conda not installed"
    fi
}

alias ce="condaenv"

sshlist() {
    if [ -f ~/.ssh/config ]; then
        echo "SSH Hosts:"
        command grep "^Host " ~/.ssh/config | sed 's/Host /  /'
    else
        echo "No SSH config found"
    fi
}

alias sl="sshlist"

alias tssh="ssh user@your-server"

remoterun() {
    if [ -z "$1" ]; then
        echo "Usage: remoterun <command>"
        return 1
    fi
    ssh user@your-server "$@"
}

alias rr="remoterun"

remotecopy() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: remotecopy <local-file> <remote-path>"
        echo "Example: remotecopy ./model.py ~/projects/"
        return 1
    fi
    scp "$1" user@your-server:"$2"
    echo "File copied to remote server"
}

alias rc="remotecopy"

remotefetch() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: remotefetch <remote-file> <local-path>"
        echo "Example: remotefetch ~/models/best.pth ./"
        return 1
    fi
    scp user@your-server:"$1" "$2"
    echo "File fetched from remote server"
}

alias rf="remotefetch"

remotesync() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: remotesync <local-dir> <remote-dir>"
        echo "Example: remotesync ./src ~/projects/myapp/src"
        return 1
    fi
    rsync -avz --progress "$1" user@your-server:"$2"
    echo "Directory synced to remote server"
}

alias rs="remotesync"

quicktest() {
    if [ -f "test.py" ]; then
        python3 test.py
    elif [ -f "tests/test_*.py" ]; then
        pytest tests/
    elif [ -f "test_*.py" ]; then
        pytest .
    else
        echo "No test files found"
    fi
}

alias qt="quicktest"

runserver() {
    if [ -f "main.py" ]; then
        uvicorn main:app --reload --host 0.0.0.0 --port ${1:-8000}
    elif [ -f "app.py" ]; then
        python3 app.py
    elif [ -f "manage.py" ]; then
        python3 manage.py runserver
    elif [ -f "package.json" ]; then
        npm run dev
    else
        echo "No runnable file found"
    fi
}

alias run="runserver"

devstart() {
    echo "Starting development environment..."

    if [ -d ".venv" ]; then
        source .venv/bin/activate
        echo "Virtual environment activated"
    fi

    if [ -f "docker-compose.yml" ]; then
        docker-compose up -d
        echo "Docker services started"
    fi

    if [ -f "package.json" ]; then
        echo "Installing npm dependencies..."
        npm install
    fi

    if [ -f "requirements.txt" ]; then
        echo "Installing Python dependencies..."
        pip install -r requirements.txt
    fi

    echo "Development environment ready"
}

alias ds="devstart"

devstop() {
    if [ -f "docker-compose.yml" ]; then
        docker-compose down
        echo "Docker services stopped"
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
        echo "Virtual environment deactivated"
    fi

    echo "Development environment stopped"
}

alias dst="devstop"

export EDITOR="vim"
export VISUAL="code"
export PAGER="less"
export LESS="-R"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTFILE=~/.zsh_history
export SAVEHIST=20000
export HISTCONTROL=ignoredups:erasedups
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

setopt CORRECT
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt EXTENDED_GLOB
setopt NO_BEEP

autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%{$fg[cyan]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$fg[red]%}${vcs_info_msg_0_}%{$reset_color%}$ '

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

if command -v exa &> /dev/null; then
    alias ls="exa --icons"
    alias la="exa -la --icons"
    alias ll="exa -l --icons"
    alias tree="exa --tree --icons"
    alias lt="exa -l --sort=modified --icons"
fi

if command -v bat &> /dev/null; then
    alias cat="bat --style=plain"
    alias catt="bat"
fi

if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    alias fkill="ps aux | fzf | awk '{print \\\$2}' | xargs kill -9"
fi

if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c757d"
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

alias globalvenv="source ~/.globalvenv/bin/activate"

echo "Shell loaded"
echo "Type 'alias' to see all available shortcuts"
echo "Type 'help-zsh' for custom function help"

help-zsh() {
    cat << 'EOF'
Custom Functions Available:

File Operations:
  mkcd <dir>          Make directory and cd into it
  take <dir>          Same as mkcd
  extract <file>      Extract any archive
  backup <file>       Backup file with timestamp
  largest [n]         Show n largest files (default: 20)
  copypath <file>     Copy absolute path to clipboard
  copyfile <file>     Copy file contents to clipboard
  copyabs             Copy current directory path

Development:
  killport <port>     Kill process on specified port
  whoisport <port>    Show process using port
  serve [port]        Start HTTP server (default: 8000)
  portcheck [port]    Check port status and optionally kill
  runserver [port]    Auto-detect and run project server

Python Environments:
  pytorchenv          Create/activate PyTorch environment
  mlenv               Create/activate ML environment
  webenv              Create/activate web dev environment
  researchenv         Create/activate research environment
  jupyterhere         Start Jupyter in current directory

Monitoring:
  trainwatch          Watch Python training processes
  gpuwatch            Watch GPU usage (or CPU on Mac)
  memwatch            Watch memory usage
  logview <file>      Tail logs with colored output

Project Init:
  projectinit <name>  Initialize generic project
  pyinit <name>       Initialize Python project
  reactinit <name>    Initialize React project
  quickapi            Create FastAPI template
  quickreact <name>   Create React app
  quicknext <name>    Create Next.js app

Git:
  gitquick "msg"      Quick add, commit, push
  gitundo             Undo last commit (keep changes)
  branchclean         Remove merged branches
  gitbackups (gbak)   Git backup manager

Remote Server:
  tssh                SSH to remote server
  remoterun <cmd>     Run command on remote
  remotecopy <f> <d>  Copy file to remote
  remotefetch <f> <d> Fetch file from remote
  remotesync <d> <d>  Sync directory to remote

Docker:
  dockercleanup       Interactive Docker cleanup

NPM/Yarn:
  npmfix              Fix npm issues
  yarnfix             Fix yarn issues

Development Workflow:
  devstart            Start full dev environment
  devstop             Stop dev environment
  quicktest           Auto-detect and run tests
  requirements        Generate requirements.txt
  envinfo             Show Python environment info

Utilities:
  calc <expression>   Quick calculator
  timer <seconds>     Countdown timer
  genpass [length]    Generate random password
  weather [city]      Show weather
  note <text>         Quick note taking
  json                Pretty print JSON (pipe input)
  modelsize <file>    Show PyTorch model size

System:
  findlarge [size]    Find files larger than size
  finddupe            Find duplicate files
  diskusage           Show disk usage by directory
  sshlist             List SSH hosts from config

Type individual command names for details
EOF
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
