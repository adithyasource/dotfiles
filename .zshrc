source ~/.zshrcsensitive
alias ls="ls -a"
set -o vi
path+=('/Users/adithya/go/bin')
alias gsource="ssh-add -D && ssh-add ~/.ssh/id_rsa && ssh -T git@github.com && git config user.name 'adithyasource' && git config user.email 'adithyasrc@gmail.com'"
alias gnst="ssh-add -D && ssh-add ~/.ssh/github-adithyanst && ssh -T git@github.com && git config --global user.name adithyanst && git config --global user.email pampana.adithya2024@nst.rishihood.edu.in"
# bash <(curl -sSL https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/main/spotx.sh) -f
