# Hooks for zsh
#
# - precmd
# - chpwd
# - preexec
# - periodic
# - zshaddhistory
# - zshexit
#

# Gitfetch precmd hook

# Empty, but required, callback function
# We can implement logging here
function completed_callback() {}

# Create worker for async precmd
async_start_worker _precmd
async_register_callback _precmd completed_callback

# Async invocation of gitfect on precmd worker
function gitfetch_hook() {
  async_job _precmd gitfetch $PWD
}

# Add async function to precmd hook
add-zsh-hook precmd gitfetch_hook
