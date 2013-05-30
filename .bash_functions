function replace() {
    find -name "$3" -exec sed -r -i "s/$1/$2/g" {} \;
}

function proxy() {
    case $1 in
        "off" | "OFF")
            unset http_proxy
            unset https_proxy
            echo "proxy is off"
            ;;
        *)
            export http_proxy=$HTTP_PROXY
            export https_proxy=$HTTPS_PROXY
            echo "proxy is on"
            ;;
    esac
}

function add-my-ssh-key() {
    ssh-add ~/.ssh/toralf.wittner@wearezeta.com
}

function git-file-hist() {
    case $1 in
        "-p") git log -w --follow -p "$2" ;;
        *)    git log -w --follow "$1" ;;
    esac
}

function git-word-hist() {
    case $1 in
        "-p") git log -w -p -S "$2" ;;
        *)    git log -w -S "$1" ;;
    esac
}

function git-change() {
    if [[ $@ ]]; then
        local refs="$@"
    else
        local refs="HEAD"
    fi

    for r in $refs; do
        git diff "$r^..$r"
    done
}

function git-grep-commits() {
    local commits=$(git log -i --grep $1 --format=%h --reverse --date-order)
    if [[ $2 ]]; then
        $2 $commits
    else
        echo $commits
    fi
}

function random_password() {
    < /dev/urandom tr -dc '_ABCDEFGHJKMNPQRSTUVWXYZabcdefghjklmnopqrstuvwxyz0-9+*#$^%[]<>();' | head -c${1:-8}
    echo ""
}

. ~/.udev_functions

