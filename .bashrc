# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add `$GOPATH/bin` to the `$PATH`
export PATH=$PATH:$(go env GOPATH)/bin

# Add Krew to the `$PATH`
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# https://github.com/jonmosco/kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
