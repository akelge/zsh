# Hooks for zsh
#
# - precmd
# - chpwd
# - preexec
# - periodic
# - zshaddhistory
# - zshexit
#

# Async Git update
autoload -Uz vcs_info

_vbe_vcs_info_done() {
  local stdout=$3
  vcs_info_msg_0_=$stdout
	# echo $(date +"%Y-%m-%d %H:%M:%S") $PWD info $vcs_info_msg_0_  $vcs_info_msg_1_ >> ~/vcs.log
  zle reset-prompt
}

_vbe_vcs_precmd() {
  # echo $(date +"%Y-%m-%d %H:%M:%S") $PWD pre >> ~/vcs.log
  async_flush_jobs vcs_info
  async_job vcs_info _vbe_vcs_info $PWD
}

async_init
async_start_worker vcs_info
async_register_callback vcs_info _vbe_vcs_info_done
add-zsh-hook precmd _vbe_vcs_precmd
