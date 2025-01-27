alias nv='nvim .'
alias lg='lazygit'
alias docker-obliterate='docker-compose down -v --rmi all && docker-compose rm -f -v'
alias newmain='echo -e "package main\n\nimport (\n\t\"fmt\"\n)\n\nfunc main() {\n\tfmt.Println(\"Hello, World!\")\n}" > main.go'

alias Bash='newBash'
newBash() {
  echo -e "#!/usr/bin/env bash\n" > "$1"
  chmod u+x "$1"
}
