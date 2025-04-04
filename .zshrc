set -o vi
alias ls="ls -a"
alias gsrc="switch_account ~/.ssh/adithyasrc 'adithyasource' 'adithyasrc@gmail.com'"
alias gnst="switch_account ~/.ssh/adithyanst 'adithyanst' 'pampana.adithya2024@nst.rishihood.edu.in'"
switch_account() {
  ssh-add -D
  ssh-add "$1"
  git config user.name "$2"
  git config user.email "$3"
  ssh -T git@github.com
}
