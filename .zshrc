set -o vi
alias ls="ls -a"
alias gsrc='ssh-add -D && ssh-add ~/.ssh/adithyasrc && git config --global user.name "adithyasource" && git config --global user.email "adithyasrc@gmail.com" && ssh -T git@github.com'
alias gnst='ssh-add -D && ssh-add ~/.ssh/adithyanst && git config --global user.name "adithyanst" && git config --global user.email "pampana.adithya2024@nst.rishihood.edu.in" && ssh -T git@github.com'
