# What do the scripts do?

## n_helper.sh

This script is written purely to make sure that the correct enviornment and setup is present before entering the chroot environment for building the system, like setting variables like:
- `LFS`: The variable that defines the root directory of the lfs partition. 
- `PATH`: This variable defines the PATH for the shell in our chroot environment, tells the path where to look for executables when we type a command. 
- `PS1`: Sets the prompt string (`PS1`) that Bash uses to display our prompt.
	- `(lfs chroot)`: simple label so we know we are in the chroot environment.
	- `\u` : defines our username.
	- `\w` : defines our current working directory.
	- `\$` : shows `#` for root and `$` for non-root users.
