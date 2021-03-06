alias res='source ~/.bashrc'
alias ll='ls -la'
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    java -version
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
